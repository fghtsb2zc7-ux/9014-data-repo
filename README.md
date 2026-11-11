---
id: readme
title: ENVRSUST 9014 software knowledge base — start here
keywords: [start here, overview, how to use, navigation, agent instructions]
---
# ENVRSUST 9014 software knowledge base — start here

This repository holds everything the Brightspace course **ENVRSUST 9014 — Environmental Data Analysis and Visualization**
(Western University, Fall 2026, course 198357) teaches about its three programs: **Excel (Power Query)**, **QGIS** and
**Positron/R**. It is organised so an AI agent can find the right procedure quickly and carry it out the way the course does.

Captured 25 October 2026 from all 31 Brightspace content items, 60 course files and 44 course videos (watched frame by frame
at 10-second intervals), plus 8 publisher transcripts for linked external videos.

## How an agent should use this repository

1. **Find the task.** Search [manifest.json](manifest.json) (`procedures[].keywords`, `title`) or scan [INDEX.md](INDEX.md).
   Each tool folder also has a grouped guide: [Excel](tools/excel/README.md) · [QGIS](tools/qgis/README.md) · [Positron/R](tools/r-positron/README.md).
2. **Open the procedure file** (`tools/<tool>/<task>.md`). Check `prerequisites` in its front matter and do those first.
3. **Follow the Steps exactly**: menu paths are written `Menu > Submenu > Item`; formulas, expressions and code are verbatim from the course.
4. **Confirm with the Verify section**, and read Pitfalls before running anything on large files.
5. **Look up details** when needed:
   - functions and syntax: [Excel formula reference](tools/excel/formula-reference.md), [QGIS expressions](tools/qgis/expression-reference.md), [QGIS Processing algorithms](tools/qgis/processing-algorithms-reference.md), [R function reference](tools/r-positron/function-reference.md)
   - the QGIS window: [interface-map.md](tools/qgis/interface-map.md)
   - the input data (columns, encodings, traps): [datasets/](datasets/README.md)
   - what an assignment or exam asks for: [course/assessments.md](course/assessments.md)
6. **Need more context?** Each procedure links to its source video transcript (`transcripts/<tool>/<video>.md`). Each transcript
   has timestamped **visual notes** (what was on screen) followed by the narration.

### Provenance tags (trust levels)
| Tag | Meaning |
|---|---|
| `[video <slug> @mm:ss]` | said in the course video at that time |
| `[frame]` / `[frame @mm:ss]` | seen on screen in the video (not narrated) |
| `[page <file>]` | from a Brightspace course page |
| `[script <file>:<lines>]` | from a course R/Quarto script under `sources/files/` |
| `[doc <file>]` | from extracted PDF text (e.g. practice exams) |
| `(general knowledge — not shown in course)` | added to stop an agent getting stuck; not taught in the course — lower confidence |

## Folder layout
| Path | Contents |
|---|---|
| `tools/excel/`, `tools/qgis/`, `tools/r-positron/` | one Markdown file per task (procedures) + reference files + folder README |
| `transcripts/excel/`, `transcripts/qgis/`, `transcripts/r-positron/` | 44 course video transcripts with visual notes |
| `transcripts/external/` | publisher transcripts (paraphrased) for linked Statistics Canada QGIS demos and ECCC NPRI videos |
| `datasets/` | catalog + one doc per course dataset (column dictionaries, encodings, CRS, data-quality traps) |
| `course/` | course overview, class-by-class guide, assessments and practice exams, NPRI, slides, glossary, external links |
| `course-pages/` | every Brightspace content page converted to Markdown (video links point to the transcripts) |
| `sources/files/` | original course files (PDFs, CSVs, XLSX, zips, R/qmd scripts) in their Brightspace folder structure |
| `sources/videos/` | original course video MP4s |
| `_raw/` | capture artefacts: Brightspace content bundle, extracted text and schema profiles, video frames (1 per 10 s), Whisper output |
| `manifest.json` | machine-readable index of everything above |
| `INDEX.md` | human-readable index of everything above |

## Quick router — common tasks
| I need to… | Excel | QGIS | R |
|---|---|---|---|
| load a CSV | [import CSV](tools/excel/import-csv-as-table-power-query.md) | [delimited text layer](tools/qgis/add-delimited-text-layer-csv.md) | [read_csv + clean_names](tools/r-positron/read-csv-and-clean-column-names.md) |
| filter rows | [Power Query filter](tools/excel/filter-rows-power-query.md) | [Query Builder](tools/qgis/filter-vector-multiple-conditions.md) | [filter()](tools/r-positron/filter-rows.md) |
| classify with conditions | [IF](tools/excel/if-classify-rows-new-column.md) / [IFS](tools/excel/ifs-categorize-numeric-thresholds.md) | [CASE WHEN](tools/qgis/field-calculator-case-when.md) | [ifelse](tools/r-positron/classify-with-ifelse.md) |
| reshape long ↔ wide | [pivot/unpivot](tools/excel/pivot-unpivot-columns-power-query.md) | — | [pivot_longer/wider](tools/r-positron/pivot-longer-and-wider.md) |
| join two tables | [merge queries](tools/excel/merge-queries-left-outer-join-power-query.md) | [attribute join](tools/qgis/join-table-to-layer-by-attribute.md) / [by location](tools/qgis/join-attributes-by-location.md) | [joins](tools/r-positron/join-tables.md) |
| summarise by group | [PivotTable](tools/excel/create-pivottable-summarize-filter-sort.md) | [count points in polygon](tools/qgis/count-points-in-polygon.md) | [group_by + summarise](tools/r-positron/group-and-summarize.md) |
| make a chart / map | [PivotChart](tools/excel/create-pivotchart-from-pivottable.md) | [print layout](tools/qgis/print-layout-map-export.md) | [ggplot line](tools/r-positron/plot-line-chart.md) |
| work with dates | [extract parts](tools/excel/extract-date-parts-power-query.md) / [parse](tools/excel/parse-inconsistent-dates-power-query.md) | — | [parse dates](tools/r-positron/parse-dates-and-extract-month.md) |

## Known data traps (read before working on course data)
- **NPRI CSV encodings differ:** only the Releases file is UTF-8; the others are Windows-1252, and two use CR-only line endings. See [datasets/npri-file-schemas.md](datasets/npri-file-schemas.md).
- **The NPRI Releases file is truncated** at Excel's 1,048,575-row limit.
- **PWQMN station IDs** have lost leading zeros in some files, so joins drop about half the measurements. STATION is not unique in the stations file, so merges duplicate some rows. See [datasets/pwqmn.md](datasets/pwqmn.md).
- **Zero-padded ID columns** (PWQMN, buckthorn Transect ID, SOLRIS) must be read as text: [datasets/id-columns-leading-zeros.md](datasets/id-columns-leading-zeros.md).
- **Several course R scripts contain bugs** (listed with fixes in [tools/r-positron/README.md](tools/r-positron/README.md)).

## Coverage and gaps
- All 44 Brightspace videos are transcribed: 43 from Brightspace captions (auto-generated; ASR errors are corrected in the notes, never inside the transcript text) and 1 ("Excel - IF statements") with Whisper small.en. All 44 have visual notes.
- External videos: 6 Statistics Canada QGIS demos and 2 ECCC NPRI videos have paraphrased publisher transcripts. The 4 YouTube install/tutorial videos have titles only ([course/external-resources.md](course/external-resources.md)).
- Not retrievable: `01 - Conservation/sr_North Atlantic Right Whale_2013_e.pdf` (broken link on Brightspace) and `IMG_5011.JPG` (a photo the browser refused to save).
- Taught in class only, with no materials: Topic 3 deterministic modelling in R, and some in-class R sessions listed on topic pages.
- Steps that fell between 10-second frames are marked in each procedure's notes; where filled from general knowledge they are tagged as such.
