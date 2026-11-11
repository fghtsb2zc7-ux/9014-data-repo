"""Rank knowledge-base procedures, references and datasets by keyword match.
Usage: python3 agent/kb_find.py <keyword> [keyword ...] [--tool excel|qgis|r-positron] [-n 10]
"""
import json
import os
import sys

repo = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
args = sys.argv[1:]
tool, n = None, 10
if "--tool" in args:
    i = args.index("--tool"); tool = args[i + 1]; del args[i:i + 2]
if "-n" in args:
    i = args.index("-n"); n = int(args[i + 1]); del args[i:i + 2]
terms = [t.lower() for t in args]
if not terms:
    sys.exit(__doc__)

m = json.load(open(os.path.join(repo, "manifest.json")))


def text_of(entry):
    parts = []
    for k, v in entry.items():
        if isinstance(v, str):
            parts.append(v)
        elif isinstance(v, list):
            parts.extend(x for x in v if isinstance(x, str))
    return " ".join(parts).lower()


hits = []
for section in ("procedures", "references", "datasets"):
    for e in m.get(section, []):
        if not isinstance(e, dict):
            continue
        if tool and e.get("tool") not in (tool, None):
            continue
        blob = text_of(e)
        kw = " ".join(e.get("keywords", []) if isinstance(e.get("keywords"), list) else []).lower()
        title = str(e.get("title", "")).lower()
        score = sum(3 * (t in title) + 2 * (t in kw) + (t in blob) for t in terms)
        if score:
            hits.append((score, section, e.get("path") or e.get("file") or e.get("id"), e.get("title", "")))

for score, section, path, title in sorted(hits, key=lambda h: -h[0])[:n]:
    print(f"{score:3d}  {section[:-1]:9s}  {path}  —  {title}")
