#!/bin/bash
# Open a workbook in Microsoft Excel so it can be screenshotted.
# Usage: bash agent/excel/open_in_excel.sh <job folder> <file.xlsx|csv relative to job>
JOB="$(cd "$1" && pwd)"
open -a "Microsoft Excel" "$JOB/$2"
sleep 6
