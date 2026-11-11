---
id: r-positron.function-reference
tool: r-positron
title: R function lookup table for ENVRSUST 9014 (function → package, purpose, where used)
keywords: [function reference, lookup, R functions, dplyr, ggplot2, tidyr, lubridate, readr, janitor, base R, where used, line numbers, cheat sheet, operators, pipe]
software_context: "R 4.5-4.6, tidyverse 2.0.0 (dplyr 1.2.1, ggplot2 4.0.3, readr 2.2.0, tidyr 1.3.2, lubridate 1.9.5), janitor 2.2.1"
prerequisites: []
source_videos: [{video: transcripts/r-positron/positron-introduction-and-package-installation.md, timestamps: "03:47-07:37"}, {video: transcripts/r-positron/r-row-binds-and-joins2.md, timestamps: "00:43-17:32"}]
source_pages: [course-pages/technical-skills-checklist.md, course-pages/practice-1-north-atlantic-right-whale.md, course-pages/exam-practice.md, course-pages/npri-group-assignment-updated.md]
datasets_used: []
---
# R function lookup table for ENVRSUST 9014

Every function and operator that appears in course R material, with its package, what it does in the course, where it is used, and the procedure that explains it.

**File abbreviations** (line numbers are in that file; `sources/files/` prefix omitted):
| Abbr. | File |
|---|---|
| RSR | `R Skills Review.R` |
| CRS | `Combined R Scripts.R` |
| T1q | `Class 1/Topic 1.qmd` |
| T1cs | `Topic 1 - Case study.qmd` |
| T1cs-v | early variant of `Topic 1 - Case study.qmd` in `Class 1/Class 1 case study.zip` (qmd line numbers) |
| T2 | `Topic 2.R` inside `Class 2/Class 2.zip` (Topic 2.R line numbers) |
| T5ic | `Topic 5 in-class script.R` |
| T5 | `Topic5.R` |
| T7 | `Topic 7.R` |
| P1 | course page `practice-1-north-atlantic-right-whale.md` |
| EP | course page `exam-practice.md` |
| NPRI | course page `npri-group-assignment-updated.md` |
| V1 / V2 | videos "Positron - Introduction and package installation" / "R - Row binds and joins2" |

## Packages and setup
| Function | Package | What it does in the course | Where used | Procedure |
|---|---|---|---|---|
| `install.packages()` | utils (base) | install tidyverse / janitor once | RSR:17-18 (commented); CRS:15-16 (commented); T1q:19-20 (`#| eval: false`); V1 @05:52 | [install-and-load-packages](install-and-load-packages.md) |
| `library()` | base | load a package each session | RSR:25-26,156-157,316-317,353-354,458-459,573-574; CRS:23-24,155-156,322-323,367-368,484-485; T1q:28-29; T2:1-2; T5:3-4; T5ic:1-2; T7:1-2; P1:223-224; EP:31-32; NPRI:113; T1cs-v:43 (`library(ggplot2)`); V1 @07:02 | [install-and-load-packages](install-and-load-packages.md) |
| `getwd()` | base | print working directory | RSR:33; CRS:31; T1q:37; V1 line 13 | [open-folder-and-set-working-directory](open-folder-and-set-working-directory.md) |

## Import / export
| Function | Package | What it does | Where used | Procedure |
|---|---|---|---|---|
| `read_csv()` | readr | read CSV into a tibble | RSR:41,44,162,177,319,361,366,376,380,462,576; CRS:39,42,161,176,325,371,487; T1q:46,49; T2:7,22; T5:11,17,29,33; T5ic:4; T7:5; P1:226; EP:34,38; NPRI:114 | [read-csv-and-clean-column-names](read-csv-and-clean-column-names.md) |
| `clean_names()` | janitor | snake_case column names | RSR:45,320,362,367,377,381,463,577; CRS:43,326,372,488; T1q:50; T5:12,18,30,34; T5ic:5; T7:6; P1:228; EP:35,39 | [read-csv-and-clean-column-names](read-csv-and-clean-column-names.md) |
| `write_csv()` | readr | save a data frame as CSV | RSR:152; CRS:147; T1q:170; P1:334 | [save-plot-png-and-csv](save-plot-png-and-csv.md) |
| `ggsave()` | ggplot2 | save the last plot to PNG (`width`, `height`, `units = "cm"`) | RSR:145; CRS:140; T1q:162; P1:333 | [save-plot-png-and-csv](save-plot-png-and-csv.md) |
| `quarto render "<file>.qmd"` | Quarto CLI (terminal, not R) | render case study to .docx | T1cs:135; T1cs-v (end); T2 case study qmd | [render-quarto-document](render-quarto-document.md) |

## Inspecting
| Function | Package | What it does | Where used | Procedure |
|---|---|---|---|---|
| `glimpse()` | dplyr (tibble) | columns, types, example values | RSR:52,83,119,167,186,322; CRS:50,80,114,166,185,328; T1q:58,92,133; T2:12,31; T5ic:7; P1:231 | [inspect-a-dataset](inspect-a-dataset.md) |
| `names()` | base | list column names | RSR:57,225,384,385; CRS:55,224; T1q:64; T2:70; T5:37-38; V2 @05:22 | [inspect-a-dataset](inspect-a-dataset.md) |
| `head()` | utils (base) | first 6 rows; `head(n)` keeps the first n (top-N) | RSR:88,122,601; CRS:85,117,512; T1q:98,137; P1:300 | [inspect-a-dataset](inspect-a-dataset.md), [sort-and-keep-top-n](sort-and-keep-top-n.md) |
| `unique()` | base | distinct values of a vector | RSR:193,579; CRS:192,490; T2:38 | [inspect-a-dataset](inspect-a-dataset.md) |
| `$` | base | pick or create one column (`data$col`) | RSR:193,579,597,605; T2:38; P1:303; NPRI:115 | [inspect-a-dataset](inspect-a-dataset.md) |
| `nrow()` / `ncol()` | base | row and column counts (join check) | RSR:426-429,441-442; T5:84-87,100-101; V2 @13:52 | [join-tables](join-tables.md) |

## Wrangling verbs
| Function | Package | What it does | Where used | Procedure |
|---|---|---|---|---|
| `select()` | dplyr | keep/drop columns by name or position (`-(21:38)`) | RSR:67,228,338,550; CRS:64,227,344,459; T1q:75; T2:73; T5ic:23; T7:92; P1:242 | [select-and-rename-columns](select-and-rename-columns.md) |
| `rename()` | dplyr | `new = old` | RSR:74,178; CRS:71,177; T1q:82; T2:23 | [select-and-rename-columns](select-and-rename-columns.md) |
| `filter()` | dplyr | keep rows meeting conditions | RSR:72,98,105,113,197,202,207,211,217,411,583,588,594,597,605,645,648; CRS:69,95,102,110,196,201,206,210,216,494,499,505,508,516,556,559; T1q:80,109,117,126; T2:42,47,52,56,62; T5:67; P1:243,258,303; EP:48 | [filter-rows](filter-rows.md) |
| `mutate()` | dplyr | create/modify columns | RSR:163,164,216,257,260,284,363,368,378,382,464,465,552,584,587; CRS:162,163,215,256,259,283,373,374,461,495,498; T2:8,9,61,102,105,129; T5:13,19,31,35; T7:7,8,94; P1:229,325; EP:36,40,43 | [create-columns-with-mutate](create-columns-with-mutate.md) |
| `group_by()` | dplyr | define groups | RSR:96,103,111,263,344,509,543,555,592,598,606; CRS:93,100,108,262,350,418,452,464,503,509,517; T1q:107,115,124; T2:108; T5ic:29; T7:52,97; P1:255,275,297,304,326; EP:46 | [group-and-summarize](group-and-summarize.md) |
| `summarize()` | dplyr | one summary row per group | RSR:97,104,112,266,345,510,544,556,593,599,607; CRS:94,101,109,265,351,419,453,465,504,510,518; T1q:108,116,125; T2:111; T5ic:30; T7:53,86,98; P1:256,276,298,305,327; EP:47 | [group-and-summarize](group-and-summarize.md) |
| `arrange()` | dplyr | sort; `-x` = descending | RSR:392,600; CRS:511; T5:45; P1:299; V2 @07:02-07:52 | [sort-and-keep-top-n](sort-and-keep-top-n.md) |
| `count()` | dplyr | count rows per value (column `n`) | RSR:410; T5:66; V2 @10:12 | [find-duplicates-and-keep-distinct](find-duplicates-and-keep-distinct.md) |
| `distinct()` | dplyr | unique rows/values; `.keep_all = TRUE` keeps the other columns | RSR:416,453; T5:73,115; V2 @11:42, @16:02 | [find-duplicates-and-keep-distinct](find-duplicates-and-keep-distinct.md) |
| `bind_rows()` | dplyr | stack datasets with the same columns | RSR:388; T5:41; EP:42; V2 @05:22 | [bind-rows](bind-rows.md) |
| `left_join()` | dplyr | add lookup columns, keep all main rows | RSR:402,419; T5:57,76; EP:78 (no `by`); V2 @08:22-13:02 | [join-tables](join-tables.md) |
| `semi_join()` | dplyr | keep rows that have a match | RSR:436; T5:95; V2 @14:42 | [join-tables](join-tables.md) |
| `anti_join()` | dplyr | rows without a match | RSR:446; T5:107; V2 @15:02 | [join-tables](join-tables.md) |
| `join_by()` | dplyr | key spec, `join_by(a == b)` | RSR:404,421,438,448; T5:59,78,97,109 | [join-tables](join-tables.md) |
| `pivot_longer()` | tidyr | wide to long (`cols`, `names_to`, `values_to`) | RSR:229,339,551; CRS:228,345,460; T2:74; T5ic:24; T7:93 | [pivot-longer-and-wider](pivot-longer-and-wider.md) |
| `pivot_wider()` | tidyr | long to wide (`names_from`, `values_from`) | RSR:242; CRS:241; T2:87 | [pivot-longer-and-wider](pivot-longer-and-wider.md) |

## Summary and helper functions
| Function | Package | What it does | Where used | Procedure |
|---|---|---|---|---|
| `sum()` | base | total (`na.rm = TRUE`) | RSR:97; CRS:94; T1q:108; P1:257,298,305 | [group-and-summarize](group-and-summarize.md) |
| `mean()` | base | average | RSR:267,345,510,544,556,599,607; CRS:266,351,419,453,465,510,518; T2:112; T5ic:30; T7:53,86,98 | [group-and-summarize](group-and-summarize.md) |
| `max()` | base | maximum | RSR:104; CRS:101; T1q:116 | [group-and-summarize](group-and-summarize.md) |
| `n()` | dplyr | number of rows in group | RSR:112; CRS:109; T1q:125; P1:276,327; EP:47 | [group-and-summarize](group-and-summarize.md) |
| `n_distinct()` | dplyr | number of distinct values | RSR:593; CRS:504 | [group-and-summarize](group-and-summarize.md) |
| `complete.cases()` | stats (base) | TRUE where not missing; used in `filter()` | RSR:98,105,113; CRS:95,102,110; T1q:109,117,126; P1:258 | [filter-rows](filter-rows.md) |
| `is.na()` | base | TRUE where missing (`!is.na()` keeps non-missing) | RSR:588; CRS:499 | [filter-rows](filter-rows.md) |
| `ifelse()` | base | if/else classification or replacement | RSR:464,465,584; CRS:373,374,495; T7:7,8; P1:325 | [classify-with-ifelse](classify-with-ifelse.md) |
| `as.numeric()` | base | convert to number | RSR:216,587; CRS:215,498; T2:61 | [convert-column-types](convert-column-types.md) |
| `as.character()` | base | convert to text (IDs) | RSR:363,368,378,382,552,586; CRS:461,497; T5:13,19,31,35; T7:94 | [convert-column-types](convert-column-types.md) |
| `factor(levels = )` | base | fixed category order | RSR:285; CRS:284; T2:130 | [order-categories-with-factor-and-reorder](order-categories-with-factor-and-reorder.md) |
| `reorder()` | stats (base) | order categories by a value (`-value` = descending) | RSR:307,347; CRS:306,353; T2:152; T5ic:32 | [order-categories-with-factor-and-reorder](order-categories-with-factor-and-reorder.md) |
| `round()` | base | round numeric labels | RSR:613; CRS:524 | [plot-heatmap](plot-heatmap.md) |
| `c()` | base | combine values into a vector | RSR:207,211,230,287,339,660; CRS:206,210,229,286,345,571; T2:52,56,75,132; T5ic:24; EP:48 | [filter-rows](filter-rows.md) |
| `substring()` | base | characters `start` to `stop` (NAICS 4-digit) | NPRI:115 | [create-columns-with-mutate](create-columns-with-mutate.md) |
| `ymd_hm()` | lubridate | parse "YYYY-MM-DD HH:MM" | RSR:163,257; CRS:162,256; T2:8,102 | [parse-dates-and-extract-month](parse-dates-and-extract-month.md) |
| `mdy()` | lubridate | parse "MM/DD/YYYY" | RSR:585; CRS:496 | [parse-dates-and-extract-month](parse-dates-and-extract-month.md) |
| `month(label = TRUE)` | lubridate | month as ordered label (Jan...) | RSR:164,260,585; CRS:163,259,496; T2:9,105; P1:229; EP:43 | [parse-dates-and-extract-month](parse-dates-and-extract-month.md) |

## Modelling
| Function | Package | What it does | Where used | Procedure |
|---|---|---|---|---|
| `lm()` | stats (base) | linear model `y ~ x`, `y ~ a + b`, `y ~ a * b` | RSR:495,512,516,519; CRS:404,421,425,428; T7:38,55,59,62 | [fit-linear-regression](fit-linear-regression.md) |
| `summary()` | base | model summary (slope, p-value) | RSR:496,513,517,520; CRS:405,422,426,429; T7:39,56,60,63 | [fit-linear-regression](fit-linear-regression.md) |
| `residuals()` | stats (base) | model residuals | RSR:514; CRS:423; T7:57 | [fit-linear-regression](fit-linear-regression.md) |
| `hist()` | graphics (base) | quick base-R histogram | RSR:514; CRS:423; T7:57 | [plot-histogram-and-boxplot](plot-histogram-and-boxplot.md) |

## ggplot2 plotting
| Function | Package | What it does | Where used | Procedure |
|---|---|---|---|---|
| `ggplot()` | ggplot2 | start a plot from data | RSR:129,170,272,299,307,324,330,347,481,488,504,522,559,609,650; CRS:124,169,271,298,306,330,336,353,390,397,413,431,468,520,561; T1q:145; T2:15,117,144,152; T5ic:9,15,32; T7:24,31,47,65,101; P1:260,278,307,329; EP:50; T1cs-v:45 | [plot-column-chart](plot-column-chart.md) |
| `aes()` | ggplot2 | map x, y, colour, fill, group, label | same lines as `ggplot()` plus RSR:613,656,658 | [customize-plot-labels-themes-facets](customize-plot-labels-themes-facets.md) |
| `geom_col()` | ggplot2 | columns from y values (stacked with `fill`) | RSR:273,300,308,348,560; CRS:272,299,307,354,469; T2:118,145,153; T5ic:33; T7:102; P1:261,309,330; EP:51 | [plot-column-chart](plot-column-chart.md) |
| `geom_point()` | ggplot2 | points (`colour`, `size`, `alpha`) | RSR:130,325,331,489,523,654,655; CRS:125,331,337,398,432,565,566; T1q:146; T5ic:10,16; T7:32,66; P1:280; T1cs-v:46 | [plot-scatter-with-trend-line](plot-scatter-with-trend-line.md) |
| `geom_line()` | ggplot2 | lines (`linewidth`) | RSR:131,171,653; CRS:126,170,564; T1q:147; T2:16; P1:279 | [plot-line-chart](plot-line-chart.md) |
| `geom_smooth()` | ggplot2 | trend line (default smooth or `method = "lm"`) | RSR:326,332,490,524; CRS:332,338,399,433; T5ic:11,17; T7:33,67 | [plot-scatter-with-trend-line](plot-scatter-with-trend-line.md) |
| `geom_histogram()` | ggplot2 | histogram | RSR:482; CRS:391; T7:25 | [plot-histogram-and-boxplot](plot-histogram-and-boxplot.md) |
| `geom_boxplot()` | ggplot2 | boxplot | RSR:505; CRS:414; T7:48 | [plot-histogram-and-boxplot](plot-histogram-and-boxplot.md) |
| `geom_tile()` | ggplot2 | heatmap tiles | RSR:612; CRS:523 | [plot-heatmap](plot-heatmap.md) |
| `geom_text()` | ggplot2 | text labels (`size`, `hjust`, `vjust`) | RSR:613,657; CRS:524,568 | [plot-heatmap](plot-heatmap.md), [plot-line-chart](plot-line-chart.md) |
| `facet_wrap(~ var)` | ggplot2 | one panel per category | RSR:133,483,525; CRS:128,392,434; T1q:149; T7:26,68; P1:310 (commented at RSR:561, T7:103) | [customize-plot-labels-themes-facets](customize-plot-labels-themes-facets.md) |
| `coord_flip()` | ggplot2 | swap x/y (horizontal bars) | RSR:275,302,310; CRS:274,301,309; T2:120,147,155 | [plot-column-chart](plot-column-chart.md) |
| `labs()` | ggplot2 | title, subtitle, axis and legend titles | RSR:134,303,311,327,333,349,526,562,563,615,641,661; CRS:129,302,310,333,339,355,435,471,472,526,552,572; T1q:150; T2:148,156; T5ic:12,18,34; T7:69,104,105; P1:262,281,311,331; EP:52 | [customize-plot-labels-themes-facets](customize-plot-labels-themes-facets.md) |
| `theme_bw()` | ggplot2 | white theme with grid | RSR:132,274,301,304,309,312,328,334,531,622; CRS:127,273,300,303,308,311,334,340,440,533; T1q:148; T2:119,146,149,154,157; T5ic:13,19; T7:74; P1:283,312,331; EP:53 | [customize-plot-labels-themes-facets](customize-plot-labels-themes-facets.md) |
| `theme_classic()` | ggplot2 | axis-line theme, no grid | RSR:668; CRS:579 | [customize-plot-labels-themes-facets](customize-plot-labels-themes-facets.md) |
| `theme()` | ggplot2 | fine styling, `legend.position` | RSR:623,642,669,685; CRS:534,553,580,596; EP:54 | [customize-plot-labels-themes-facets](customize-plot-labels-themes-facets.md) |
| `element_text()` | ggplot2 | text style (size, face, colour, angle, hjust) | RSR:624-633,670-678; CRS:535-544,581-589 | [customize-plot-labels-themes-facets](customize-plot-labels-themes-facets.md) |
| `element_blank()` | ggplot2 | remove an element (grid lines) | RSR:630-631; CRS:541-542 | [customize-plot-labels-themes-facets](customize-plot-labels-themes-facets.md) |
| `element_line()` | ggplot2 | line style (axis.line) | RSR:676; CRS:587 | [customize-plot-labels-themes-facets](customize-plot-labels-themes-facets.md) |
| `scale_colour_manual()` | ggplot2 | set colours of mapped colour values | RSR:660; CRS:571 | [plot-line-chart](plot-line-chart.md) |
| `scale_fill_gradient()` | ggplot2 | custom fill gradient (commented out) | RSR:614; CRS:525 | [plot-heatmap](plot-heatmap.md) |

## Operators and syntax
| Operator | Meaning in course | Where used | Procedure |
|---|---|---|---|
| `<-` | assign | everywhere | [run-code-and-use-positron-panes](run-code-and-use-positron-panes.md) |
| `|>` | native pipe | everywhere | [run-code-and-use-positron-panes](run-code-and-use-positron-panes.md) |
| `%>%` | magrittr pipe (tidyverse) | RSR:600,605,606; CRS:511,516,517; V1 Lesson_1.R line 18 | [run-code-and-use-positron-panes](run-code-and-use-positron-panes.md) |
| `==`, `!=`, `>`, `>=` | comparisons | RSR:72-73,197,202,217,411,594 | [filter-rows](filter-rows.md) |
| `%in%`, `!x %in%` | is one of / is not one of | RSR:207,211,597,605; EP:48; P1:303 | [filter-rows](filter-rows.md) |
| `&` | AND | RSR:217 | [filter-rows](filter-rows.md) |
| `~` | formula (`lm`, `facet_wrap`) | RSR:133,495 | [fit-linear-regression](fit-linear-regression.md) |
| `+` (ggplot) | add a layer | every ggplot | [plot-column-chart](plot-column-chart.md) |
| `` `name with spaces` `` | backtick-quoted column names | RSR:170,178-184,216,263,285,307,347; NPRI:115 | [select-and-rename-columns](select-and-rename-columns.md) |
| `na.rm = TRUE` | ignore NA in summaries | RSR:97,104,267,345; P1:257 | [group-and-summarize](group-and-summarize.md) |
| `#| eval: false` | Quarto chunk option: don't run | T1q:17; RSR:15 (as comment) | [render-quarto-document](render-quarto-document.md) |

## Built-in dataset
| Object | Package | Where used |
|---|---|---|
| `mtcars` | datasets (base) | T1cs-v:45, placeholder plot only |

## Functions NOT used anywhere in the course R material
`read_excel()`, `case_when()`, `if_else()`, `separate()`, `str_*()` (stringr), `sf`/`terra` spatial functions, `setwd()`, `desc()`, `coef()`, `print(n = )` (only suggested by the console). Procedures mention a few of these, marked "(general knowledge — not shown in course)".

## Related
- [README.md](README.md)
- [scripts-catalog.md](scripts-catalog.md)
