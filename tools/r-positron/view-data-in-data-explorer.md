---
id: r-positron.view-data-in-data-explorer
tool: r-positron
title: Open a data frame in the Positron Data Explorer to check columns, types and missing values
keywords: [Data Explorer, view data, table viewer, spreadsheet view, missing values, column summary, histogram, data types, str, dbl, View, inspect, sort, filter, Variables pane, table icon]
software_context: "Positron (R 4.5.0) Data Explorer"
prerequisites: [r-positron.run-code-and-use-positron-panes]
source_videos: [{video: transcripts/r-positron/r-row-binds-and-joins2.md, timestamps: "00:43-03:07, 04:22-04:59, 06:15-06:53, 10:28-11:04, 12:52-14:08"}]
source_pages: [course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md]
datasets_used: [sources/files/PWQMN_Stations.csv, sources/files/PWQMN_data_2024.csv, "sources/files/Topic 5.zip (PWQMN-2000_2009.csv, PWQMN-2010_2018.csv)"]
---
# Open a data frame in the Positron Data Explorer to check columns, types and missing values

## Purpose
Positron's Data Explorer is the course's main visual check after loading, binding or joining data. It shows every column's type, its distribution as a mini-histogram, its percentage of missing values, and the rows themselves. The instructor names this as one reason the course uses Positron ("intuitive tools that allow you to explore data and distributions").

## Steps
1. Create or load a data frame (for example run the `pwqmn_stations <- read_csv(...)` pipe). [video r-row-binds-and-joins2 @01:02]
2. In the Variables pane (SESSION tab, top-right), find the object under **DATA**, shown as `pwqmn_stations [2198 rows x 10 colu...]`. [frame @01:12]
3. Click the **table icon** at the right end of that row. A new editor tab opens, titled "Data: <object name>". [video r-row-binds-and-joins2 @02:32] [frame]
4. Read the left summary panel ("Sort by Original", "Filter"). Each column has a type glyph (`A` = text, `#` = number, `?` = time/other), a mini histogram or bar, and the percentage missing (for example `0%`, `3%`, `54%`). Hover over a bar to see a value and its count. Expand a column with its `>` arrow. [frame @01:12, @02:52]
5. Read the grid on the right. Column headers show the name and the type (`str`, `dbl`, `int`). Scroll sideways to reach later columns. The footer shows the total, for example "112,392 rows 15 columns". [frame @02:52]
6. Use the toolbar actions **Clear Column Sorting** and **Convert to Code** as needed. These buttons are visible in the toolbar but the video doesn't use them. [frame]
7. Close the "Data: ..." tab with its ✕ to return to the script. [frame]

## Formulas / expressions / code
No code is needed; this is done by clicking. The code equivalents used in the course are `glimpse()`, `names()`, `head()`, `nrow()` and `ncol()` (see [inspect-a-dataset.md](inspect-a-dataset.md)).

## Verify
- The tab title reads "Data: <object>" and the footer row and column counts match the Variables pane.
- Use it after a join. In the course, `pwqmn_data_2024_joined` showed name, description, latitude, longitude, status, first_year and last_year each 54% missing, which revealed unmatched stations. [video r-row-binds-and-joins2 @12:52-13:31] [frame @13:32]

## Pitfalls
- A column that should be numeric but shows `str`/`A` contains text values. In PWQMN, `results` holds below-detection-limit entries like `<2` and `<5`. Convert before doing calculations (see [convert-column-types.md](convert-column-types.md)). [video r-row-binds-and-joins2 @02:31-03:07] [frame @02:52]
- Units like µg/L can display as "�g/L", an encoding glyph. This is cosmetic. [frame @02:52]
- Very large tables (about 1-2 million rows) take a moment to fill. Rows show "..." while loading. [frame @04:22]

## Related
- [inspect-a-dataset.md](inspect-a-dataset.md)
- [join-tables.md](join-tables.md)
- [run-code-and-use-positron-panes.md](run-code-and-use-positron-panes.md)
