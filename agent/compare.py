"""Side-by-side image of the target (left) and the result (right) -> <job>/final/comparison.png
Usage: bash agent/py.sh agent/compare.py <job folder> [result image] [target image]
"""
import glob
import os
import sys

from PIL import Image, ImageDraw

job = sys.argv[1]
result = sys.argv[2] if len(sys.argv) > 2 else None
target = sys.argv[3] if len(sys.argv) > 3 else None
if not target:
    t = sorted(glob.glob(os.path.join(job, "inputs", "target.*")))
    target = t[0] if t else None
if not result:
    r = [p for p in sorted(glob.glob(os.path.join(job, "final", "*.png"))) if not p.endswith("comparison.png")]
    result = r[0] if r else None
if not (target and result):
    sys.exit(f"need a target and a result image (target={target}, result={result})")

a, b = Image.open(target).convert("RGB"), Image.open(result).convert("RGB")
h = 900
a = a.resize((int(a.width * h / a.height), h))
b = b.resize((int(b.width * h / b.height), h))
out = Image.new("RGB", (a.width + b.width + 30, h + 40), "white")
out.paste(a, (10, 30)); out.paste(b, (a.width + 20, 30))
d = ImageDraw.Draw(out)
d.text((10, 8), "TARGET: " + os.path.basename(target), fill="black")
d.text((a.width + 20, 8), "RESULT: " + os.path.basename(result), fill="black")
dest = os.path.join(job, "final", "comparison.png")
out.save(dest)
print(dest)
