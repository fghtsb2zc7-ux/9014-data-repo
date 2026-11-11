import os, sys, json, zipfile, subprocess, io
import pandas as pd
SRC = sys.argv[1]; OUT = sys.argv[2]
os.makedirs(OUT, exist_ok=True)
inv = []
def safe(rel): return rel.replace('/', '__')
def profile_df(df, name):
    lines = [f"rows: {len(df)}  columns: {df.shape[1]}", "", "| column | dtype | non-null | unique | example values |", "|---|---|---|---|---|"]
    for c in df.columns:
        s = df[c]
        ex = ", ".join(map(lambda x: str(x)[:40], s.dropna().unique()[:4]))
        lines.append(f"| {str(c)[:60]} | {s.dtype} | {s.notna().sum()} | {s.nunique()} | {ex.replace('|','/')} |")
    num = df.select_dtypes('number')
    if not num.empty:
        lines += ["", "Numeric summary:", "```", num.describe().T.round(3).to_string()[:6000], "```"]
    lines += ["", "First 5 rows:", "```", df.head(5).to_string()[:4000], "```"]
    return "\n".join(lines)
def read_csv_any(f):
    for enc in ("utf-8", "utf-8-sig", "latin-1"):
        try: return pd.read_csv(f, encoding=enc, low_memory=False)
        except UnicodeDecodeError: continue
for root, _, files in os.walk(SRC):
    for fn in files:
        p = os.path.join(root, fn); rel = os.path.relpath(p, SRC); ext = fn.lower().rsplit('.', 1)[-1]
        rec = {"path": "sources/files/" + rel, "bytes": os.path.getsize(p), "ext": ext}
        try:
            if ext == "pdf":
                txt = subprocess.run(["pdftotext", "-layout", p, "-"], capture_output=True, text=True).stdout
                pages = subprocess.run(["pdfinfo", p], capture_output=True, text=True).stdout
                open(f"{OUT}/{safe(rel)}.txt", "w").write(txt); rec["extract"] = f"{safe(rel)}.txt"; rec["chars"] = len(txt)
                rec["pages"] = next((l.split()[-1] for l in pages.splitlines() if l.startswith("Pages")), None)
            elif ext in ("csv",):
                df = read_csv_any(p); open(f"{OUT}/{safe(rel)}.schema.md", "w").write(f"# {rel}\n\n" + profile_df(df, rel)); rec["extract"] = f"{safe(rel)}.schema.md"; rec["rows"] = len(df); rec["columns"] = list(map(str, df.columns))
            elif ext in ("xlsx", "xls"):
                xl = pd.ExcelFile(p); parts = [f"# {rel}\n\nSheets: {xl.sheet_names}\n"]
                for sh in xl.sheet_names:
                    df = xl.parse(sh); parts.append(f"\n## Sheet: {sh}\n\n" + profile_df(df, sh))
                open(f"{OUT}/{safe(rel)}.schema.md", "w").write("\n".join(parts)); rec["extract"] = f"{safe(rel)}.schema.md"; rec["sheets"] = xl.sheet_names
            elif ext in ("r", "qmd", "txt", "json"):
                rec["extract"] = None; rec["text"] = True
            elif ext == "docx":
                z = zipfile.ZipFile(p); import re
                x = z.read("word/document.xml").decode("utf8"); t = re.sub(r"</w:p>", "\n", x); t = re.sub(r"<[^>]+>", "", t)
                open(f"{OUT}/{safe(rel)}.txt", "w").write(t); rec["extract"] = f"{safe(rel)}.txt"
            elif ext == "zip":
                z = zipfile.ZipFile(p); members = [(i.filename, i.file_size) for i in z.infolist()]
                lines = [f"# {rel} (zip, {len(members)} entries)", "", "| member | bytes |", "|---|---|"] + [f"| {m} | {s} |" for m, s in members]
                # profile small tabular/text members
                for m, s in members:
                    ml = m.lower()
                    if s < 60_000_000 and ml.endswith(".csv"):
                        try: df = read_csv_any(io.BytesIO(z.read(m))); lines += ["", f"## {m}", profile_df(df, m)]
                        except Exception as e: lines += ["", f"## {m}", f"(could not parse: {e})"]
                    elif s < 300_000 and ml.endswith((".r", ".qmd", ".txt", ".prj", ".md", ".qml", ".xml")) and not ml.endswith(".shp.xml"):
                        lines += ["", f"## {m}", "```", z.read(m).decode("utf8", "replace")[:20000], "```"]
                    elif s < 60_000_000 and ml.endswith((".xlsx", ".xls")):
                        try:
                            xl = pd.ExcelFile(io.BytesIO(z.read(m))); lines += ["", f"## {m} sheets {xl.sheet_names}"]
                            for sh in xl.sheet_names[:6]: lines += [f"### {sh}", profile_df(xl.parse(sh), sh)]
                        except Exception as e: lines += [f"(xlsx error {e})"]
                open(f"{OUT}/{safe(rel)}.contents.md", "w").write("\n".join(lines)); rec["extract"] = f"{safe(rel)}.contents.md"; rec["entries"] = len(members)
        except Exception as e:
            rec["error"] = str(e)[:200]
        inv.append(rec)
json.dump(inv, open(f"{OUT}/_inventory.json", "w"), indent=1)
print(len(inv), "files;", sum(1 for r in inv if r.get("error")), "errors")
for r in inv:
    if r.get("error"): print("ERR", r["path"], r["error"])
