---
id: review.verification-report
title: Independent verification of a stratified sample (October 2026)
---
# Independent verification report

Reviewer: an independent agent that did not write the knowledge base. Date: 25 October 2026.
Method: each sampled claim was compared with the video frames (`_raw/frames/<mp4>/tNNNN.jpg`, viewed directly), the
transcript narration, the course scripts (`sources/files/`) and the extracted schema profiles
(`_raw/extracted/`). Fixes were made in place with minimal edits.

## 1. What was sampled

### Procedure files (21)
| Tool | File | Evidence checked |
|---|---|---|
| Excel | build-interactive-summary-sheet-countif-filter | frames 14:42, 14:52, 17:32, 20:42, 20:52, 21:12; narration 14:33, 20:17 |
| Excel | pivot-unpivot-columns-power-query | frames 01:12, 03:22, 04:22, 05:42, 05:52, 06:52, 07:32 (all M code lines) |
| Excel | merge-queries-left-outer-join-power-query | frames 02:32, 03:12, 03:42; stations schema (2,198 rows, 2,188 unique STATION) |
| Excel | parse-inconsistent-dates-power-query | frames 01:32, 01:52, 03:12 |
| Excel | if-classify-rows-new-column | frames 02:22, 05:12 |
| Excel | import-csv-as-table-power-query | frames 00:32, 00:52, 01:12, 01:52, 02:02 |
| QGIS | print-layout-map-export | frames 04:22, 06:42, 08:12, 08:52, 13:32; narration 03:49, 13:16 |
| QGIS | join-attributes-by-location | frames 02:22, 02:42 (log), 03:02 |
| QGIS | zonal-histogram-raster-categories-in-polygons | frames 07:32, 09:32 |
| QGIS | buffer-points-fixed-distance | frames 03:02, 05:22, 05:52 (log) |
| QGIS | field-calculator-case-when | frames 01:02, 02:42, 03:02 |
| QGIS | count-points-in-polygon | frames 02:52, 04:12, 04:52 |
| QGIS | filter-vector-multiple-conditions | frames 01:32, 01:52, 05:52 |
| QGIS | raster-calculator-threshold-filter | frames 03:12, 03:52, 05:12 |
| QGIS | reproject-vector-layer | frames 01:32, 02:02 (log); narration 01:22 |
| R | join-tables | Topic5.R:1-115; frames 01:12, 09:22, 13:32, 14:22, 17:22; course-pages/exam-practice.md |
| R | group-and-summarize | R Skills Review.R (all cited ranges), Topic 7.R:84-86, Class 1/Topic 1.qmd:105-153, Combined R Scripts.R:450-453 |
| R | practice-exam-r-workflows | exam-practice.md code (character-exact), crab and human-wildlife schemas, R Practice Exam PDF text |
| R | pivot-longer-and-wider | R Skills Review.R:195-245, 337-341, 549-552; Class 2.zip histos schema (Bin6 `>18.000000`) |
| R | read-csv-and-clean-column-names | R Skills Review.R:25-45, 158-184, 361-368; Topic 5 in-class script.R:4-5; NPRI releases schema |
| R | plot-line-chart | R Skills Review.R:129-137, 644-685; practice-1 page R.1.4 code |

In addition, every fenced code line in all `tools/r-positron`, `tools/excel` and `tools/qgis` files was machine-compared
(whitespace-insensitive) against the course scripts, course pages, transcripts and extracted PDF text. Lines not
found were reviewed by hand: all were elided processing-log excerpts, console output, reconstructed formulas already
labelled as such, or variants explicitly labelled as narrated-only/general knowledge.

### Transcript visual notes (4 transcripts, 23 timestamps)
- excel-pivoting-columns: 01:12, 03:22, 04:22, 05:42, 05:52, 06:52, 07:32 — all match.
- excel-loading-data-into-excel: 00:32, 00:52, 01:12, 01:52, 02:02 — all match.
- qgis-print-layout: 04:22, 06:42, 08:12, 08:52, 13:32 — all match.
- r-row-binds-and-joins2: 01:12, 09:22, 13:32, 14:22, 15:32/16:02 (variables pane), 17:22 — all match.

### Dataset docs (3)
- datasets/pwqmn.md vs PWQMN_data_2024.csv and PWQMN_Stations.csv schema profiles — column names, dtypes, counts match the profiles (but see issue 2).
- datasets/us-power-plants.md vs Power_Plants.csv profile — all 34 column names match.
- datasets/obis-north-atlantic-right-whale.md vs both reduced-file profiles — all columns match, including the Topic 2-only `month`.

## 2. Issues found and fixed

| # | Severity | File | Claim | Evidence | Fix |
|---|---|---|---|---|---|
| 1 | Minor | tools/r-positron/read-csv-and-clean-column-names.md | Code block "Files in a `data/` sub-folder, kept with their original names" showing `tag_data <- read_csv("data/108916_histos.csv")` as a complete statement | R Skills Review.R:177-184 continues the pipe with `rename()` (`Greater than 18 C` = Bin6 … `Less than 9 C` = Bin2); location_data continues with two `mutate()` calls (162-164) | Reworded the caption: names are not cleaned, the pipes are truncated, and `tag_data` renames Bin2-Bin6; corrected the line citation |
| 2 | Major | datasets/pwqmn.md | `STATION` documented only as int64 (`3007703502`); issue 1 advises converting both keys to text; README's "leading zeros" trap points here, but the doc didn't mention it | Frame r-row-binds-and-joins2 @01:12: readr reads `STATION` as `chr` with values `03007703502`; @02:02 `Collection Site` is `dbl`; @15:32 only 51,351 of 112,392 rows match (61,041 unmatched); excel-merging-data @02:32: with both keys numeric, 112,126 of 112,392 match | Added a note to the STATION row, a "Leading-zero mismatch in R" paragraph under issue 1 (padding or converting both keys to numbers, tagged general knowledge), and Excel's 266-unmatched baseline under issue 3 |
| 3 | Minor | tools/r-positron/join-tables.md | Code block cited as `[script Topic5.R:47-115]` (implying verbatim) | The block drops the trailing comma and comment at lines 59/78 and replaces the duplicate_stations block (62-70) with a comment (already noted further down in Pitfalls) | Labelled the block as lightly edited and listed the edits; added the Excel match count as supporting evidence in the leading-zero pitfall |
| 4 | Clarification | tools/excel/build-interactive-summary-sheet-countif-filter.md | Step 4 "select all 147 cells" with no mention of what the video did | Frame @14:52: Source `='Unique industries'!$A$1:$A$145`, "145R x 1C" | Added the observed range and the instruction to select to A147. The linked data-validation file already noted this |

No errors were found in menu paths, dialog names, parameter values, M code, Excel formulas, QGIS expressions,
processing-log values or result counts in the 15 Excel and QGIS files sampled. Timestamps cited were within one frame (10 s) of the
state shown. Additions not shown in the course were consistently tagged "(general knowledge — not shown in course)".

## 3. Error rate
- Procedure files: 1 of 21 had a factual error (minor); 2 more got clarifications. About 330 individual claims were checked (UI paths, values, code lines, counts), giving roughly 0.3% wrong and 1% needing clarification.
- Transcript visual notes: 0 of 23 timestamps wrong.
- Dataset docs: 0 wrong column names across 3 docs; 1 substantive omission (issue 2).

## 4. Residual risks an agent should know
1. **Schema profiles were made with pandas, which turns zero-padded numeric text into int64.** The PWQMN stations
   file is one confirmed case (issue 2). Other dataset docs that list ID-like columns as int64/float64 (e.g.
   rock-crab-survey, human-wildlife-coexistence, irish-marine-sportfish-tagging, solris-3-land-use-change,
   buckthorn-survey, npri-file-schemas) may hide leading zeros in the raw text. The raw CSVs were not available to
   this review. Before joining on an ID, check how `read_csv()` or Power Query types it.
2. **The same join behaves differently in Excel and R.** Power Query types PWQMN IDs as whole numbers, so about 99.8% of rows match. R reads stations as zero-padded text, so about 46% match. The course does not explain the difference.
3. **Menu clicks between frames** (e.g. `Vector > Data Management Tools > Reproject Layer...`, `Project > New Print
   Layout...`, `Layout > Export as Image...`) come from narration, not frames. They were checked against narration and are plausible, but the exact menu item labels were not seen on screen.
4. **QGIS version mix:** 2025-26 recordings use QGIS 3.22 (Join attributes by location shows "Base Layer"/"Join
   Layer"); 2026-27 recordings use 3.44.13 (shown in processing logs). The interface map says the version is never displayed, which is out of date for the processing logs. Parameter labels differ between versions.
5. **Query Builder "Test" applies the filter live** in the recorded QGIS. The filter-multiple-conditions procedure's final `OK` step is inferred, not shown.
6. **Some code blocks drop inline comments** (e.g. `grouped_tag_data` in group-and-summarize). The code is the same; the comments are not reproduced character for character.
7. The review did not cover the remaining ~70 procedure files, the reference files (formula, expression and
   function references) or the course-page conversions.
