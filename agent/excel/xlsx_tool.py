"""Build real .xlsx workbooks with native Excel charts (openpyxl), as a scripted stand-in for the course's
Excel GUI steps. Run with the agent's python:  bash agent/py.sh agent/excel/xlsx_tool.py <command> ...

Commands
  info  <file.xlsx|csv>                                   sheets, dimensions, header row
  csv2xlsx <in.csv> <out.xlsx> [--sheet Data] [--text-cols A,B] [--encoding cp1252]  (default: UTF-8, else Windows-1252)
        import a CSV as an Excel table (like Data > From Text/CSV > Load); listed columns kept as text
  chart <file.xlsx> --sheet Summary --type column|bar|line|scatter|pie
        --cats A2:A20 --vals B1:D20 [--title "..."] [--x-title "..."] [--y-title "..."]
        [--stacked] [--anchor F2] [--legend b|r|t|l|none] [--out file.xlsx] [--png final/chart.png]
        add a native chart; --vals includes the header row so series get names.
        --png exports the chart to an image by opening the workbook in Excel (AppleScript).

Import it from your own script for anything else:
  sys.path.insert(0, "agent/excel"); import xlsx_tool as xt
"""
import argparse
import csv
import os
import subprocess
import sys

from openpyxl import Workbook, load_workbook
from openpyxl.chart import BarChart, LineChart, PieChart, Reference, ScatterChart, Series
from openpyxl.utils import get_column_letter, range_boundaries
from openpyxl.worksheet.table import Table, TableStyleInfo


def _num(v):
    if v is None or v == "":
        return None
    try:
        f = float(v)
        return int(f) if f.is_integer() and "." not in str(v) else f
    except ValueError:
        return v


def read_csv_rows(src, encoding=None):
    """Read a CSV; with no encoding given, try UTF-8 then Windows-1252 (several course files are cp1252)."""
    for enc in ([encoding] if encoding else ["utf-8-sig", "cp1252"]):
        try:
            with open(src, newline="", encoding=enc) as fh:
                return list(csv.reader(fh))
        except UnicodeDecodeError:
            continue
    raise SystemExit(f"could not decode {src}; pass --encoding")


def csv_to_xlsx(src, dest, sheet="Data", text_cols=(), encoding=None):
    wb = Workbook()
    ws = wb.active
    ws.title = sheet
    rows = read_csv_rows(src, encoding)
    header = rows[0]
    keep_text = {c.strip() for c in text_cols}
    ws.append(header)
    for r in rows[1:]:
        ws.append([v if header[i] in keep_text else _num(v) for i, v in enumerate(r)])
    ref = f"A1:{get_column_letter(len(header))}{len(rows)}"
    name = "".join(ch for ch in os.path.splitext(os.path.basename(src))[0] if ch.isalnum()) or "Table1"
    t = Table(displayName=name[:200], ref=ref)
    t.tableStyleInfo = TableStyleInfo(name="TableStyleMedium2", showRowStripes=True)
    ws.add_table(t)
    wb.save(dest)
    return dest


def add_chart(path, sheet, kind, cats, vals, title=None, x_title=None, y_title=None, stacked=False,
              anchor="H2", legend="r", out=None):
    wb = load_workbook(path)
    ws = wb[sheet]
    c1, r1, c2, r2 = range_boundaries(vals)
    k1, kr1, k2, kr2 = range_boundaries(cats)
    cat_ref = Reference(ws, min_col=k1, min_row=kr1, max_col=k2, max_row=kr2)
    if kind in ("column", "bar"):
        ch = BarChart()
        ch.type = "col" if kind == "column" else "bar"
        if stacked:
            ch.grouping = "stacked"; ch.overlap = 100
    elif kind == "line":
        ch = LineChart()
    elif kind == "pie":
        ch = PieChart()
    elif kind == "scatter":
        ch = ScatterChart(); ch.style = 13
        for col in range(c1, c2 + 1):
            s = Series(Reference(ws, min_col=col, min_row=r1 + 1, max_row=r2), cat_ref, title_from_data=False,
                       title=str(ws.cell(r1, col).value))
            s.marker.symbol = "circle"; s.graphicalProperties.line.noFill = True
            ch.series.append(s)
    else:
        raise SystemExit(f"unknown chart type {kind}")
    if kind != "scatter":
        ch.add_data(Reference(ws, min_col=c1, min_row=r1, max_col=c2, max_row=r2), titles_from_data=True)
        ch.set_categories(cat_ref)
    if title:
        ch.title = title
    if kind != "pie":
        if x_title:
            ch.x_axis.title = x_title
        if y_title:
            ch.y_axis.title = y_title
        ch.x_axis.delete = False; ch.y_axis.delete = False
    if legend == "none":
        ch.legend = None
    else:
        ch.legend.position = legend
    ch.width, ch.height = 18, 10
    ws.add_chart(ch, anchor)
    out = out or path
    wb.save(out)
    return out


def export_chart_png(xlsx, png, sheet=None):
    """Ask Excel to save the first chart on the sheet as a picture (macOS AppleScript)."""
    xlsx, png = os.path.abspath(xlsx), os.path.abspath(png)
    sheet_line = f'set ws to worksheet "{sheet}" of wb' if sheet else "set ws to active sheet of wb"
    script = f'''
    tell application "Microsoft Excel"
        activate
        open POSIX file "{xlsx}"
        delay 2
        set wb to active workbook
        {sheet_line}
        set co to chart object 1 of ws
        save as picture co file name (POSIX file "{png}" as string) picture type save as PNG file
    end tell'''
    r = subprocess.run(["osascript", "-e", script], capture_output=True, text=True)
    if r.returncode != 0 or not os.path.exists(png):
        print("PNG export via Excel failed; take a screenshot with agent/screenshot.sh instead.\n" + r.stderr,
              file=sys.stderr)
        return None
    return png


def info(path):
    if path.lower().endswith(".csv"):
        rows = read_csv_rows(path)
        print(f"{path}: {len(rows) - 1} rows x {len(rows[0])} cols\nheader: {rows[0]}")
        return
    wb = load_workbook(path, read_only=True, data_only=True)
    for ws in wb.worksheets:
        first = next(ws.iter_rows(min_row=1, max_row=1, values_only=True), ())
        print(f"[{ws.title}] {ws.max_row} rows x {ws.max_column} cols\n  header: {list(first)}")


def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = p.add_subparsers(dest="cmd", required=True)
    a = sub.add_parser("info"); a.add_argument("file")
    b = sub.add_parser("csv2xlsx"); b.add_argument("src"); b.add_argument("dest")
    b.add_argument("--sheet", default="Data"); b.add_argument("--text-cols", default="")
    b.add_argument("--encoding", default=None)
    c = sub.add_parser("chart"); c.add_argument("file"); c.add_argument("--sheet", required=True)
    c.add_argument("--type", required=True); c.add_argument("--cats", required=True)
    c.add_argument("--vals", required=True); c.add_argument("--title"); c.add_argument("--x-title")
    c.add_argument("--y-title"); c.add_argument("--stacked", action="store_true")
    c.add_argument("--anchor", default="H2"); c.add_argument("--legend", default="r")
    c.add_argument("--out"); c.add_argument("--png")
    o = p.parse_args()
    if o.cmd == "info":
        info(o.file)
    elif o.cmd == "csv2xlsx":
        cols = [x for x in o.text_cols.split(",") if x]
        print(csv_to_xlsx(o.src, o.dest, o.sheet, cols, o.encoding))
    elif o.cmd == "chart":
        out = add_chart(o.file, o.sheet, o.type, o.cats, o.vals, o.title, o.x_title, o.y_title, o.stacked,
                        o.anchor, o.legend, o.out)
        print(out)
        if o.png:
            print(export_chart_png(out, o.png, o.sheet))


if __name__ == "__main__":
    main()
