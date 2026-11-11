#!/bin/bash
# usage: extract_frames.sh <video.mp4> <outdir> ; one frame every 10 s, 1280px wide
v="$1"; out="$2"; mkdir -p "$out"
dur=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$v" | cut -d. -f1)
for ((t=2; t<dur; t+=10)); do
  f=$(printf "%s/t%04d.jpg" "$out" $t)
  [ -s "$f" ] || ffmpeg -nostdin -loglevel error -ss $t -i "$v" -frames:v 1 -vf scale=1280:-2 -q:v 5 "$f"
done
echo done > "$out/.complete"
