---
id: r-positron.open-folder-and-set-working-directory
tool: r-positron
title: Open the lesson folder in Positron and check the working directory
keywords: [working directory, getwd, open folder, project, root folder, file path, relative path, data folder, trust authors, setwd, RStudio project]
software_context: "Positron with R 4.6.1 / 4.5.0 on Windows"
prerequisites: [r-positron.install-r-and-positron]
source_videos: [{video: transcripts/r-positron/positron-introduction-and-package-installation.md, timestamps: "04:25-05:37"}, {video: transcripts/r-positron/r-row-binds-and-joins2.md, timestamps: "00:06-00:43"}]
source_pages: [course-pages/technical-skills-checklist.md, course-pages/topic-5-connecting-data-joins-merges-and-spatial-relationships.md]
datasets_used: [sources/files/Class 1/NPRI data.zip, sources/files/Topic 5.zip, sources/files/Class 2/Class 2.zip]
---
# Open the lesson folder in Positron and check the working directory

## Purpose
In Positron the working directory is set by opening a folder. There is no need to call `setwd()` or build an RStudio project. Open the folder that holds both the script and the data files, so that `read_csv("file.csv")` finds files by name.

## Steps
1. Put the course script in the same folder as the downloaded data. The Topic 5 page says: "download and copy it into the data you downloaded above and then open that folder within Positron". [page topic-5-connecting-data-joins-merges-and-spatial-relationships.md]
2. In Positron, click the Explorer icon (top of the left activity bar) to see "NO FOLDER OPENED". Then click **Open Folder**. You can also use the **Open ▾** dropdown in the top toolbar and choose its "Open Folder" entry; the instructor says "you go open, open folder". The dropdown's contents aren't shown in any frame. [video positron-introduction-and-package-installation @04:42] [video r-row-binds-and-joins2 @00:06]
3. Select the lesson folder (for example `NPRI data` or `Topic 5`) and confirm. When Positron asks whether you trust the authors, answer yes ("Yes, we trust the authors of this"). [video positron-introduction-and-package-installation @04:25]
4. The window title changes to "<file> - <folder> - Positron", and the Explorer lists the folder contents (for example `Lesson_1.R` and the `NPRI-INRP_...csv` files). [frame @04:52]
5. Start an R console session if none is running (**Start Session**, then pick the R version). [frame @05:12]
6. Open the script by clicking it in the Explorer. [frame @05:32] [video r-row-binds-and-joins2 @00:22]
7. Run `getwd()` to confirm the working directory. [script R Skills Review.R:33]
8. If a script loads files from a sub-folder (Topic 2 uses `data/108916_tag.csv`), open the lesson's root folder (`Class 2`), not the `data` folder. The script comment says "Ensure you are sitting in the root folder for the lesson". [script R Skills Review.R:159-162]

## Formulas / expressions / code
```r
## Find your working directory
getwd() #Check working directory
```
`getwd()` prints the folder R currently reads from and writes to. [script R Skills Review.R:29-33]

Relative paths used in the course:
```r
read_csv("NPRI-INRP_ReleasesRejets_1993-present.csv")   # file in the opened folder (Topic 1)
read_csv("data/108916_tag.csv")                          # file in a data/ sub-folder (Topic 2)
```

## Verify
- The console header (path bar above the console output) shows the opened folder, for example "~/OneDrive - The University of Western Ontario/Teaching/EnvrSust 9014/2026-2027/NPRI data". [frame @05:32]
- `getwd()` prints the same folder.
- The Explorer header shows the folder name in capitals (for example "NPRI DATA", "TOPIC 5"). [frame]

## Pitfalls
- If `read_csv()` errors with "does not exist in current working directory", the wrong folder is open, or the script was opened on its own without a folder. Breadcrumbs that start with `C: > Users > ...` while the Explorer says "NO FOLDER OPENED" mean no folder is open. [frame @00:12]
- `setwd()` is never used in the course. (general knowledge: `setwd("path")` would also work but is not the course method)
- Close the Explorer pane to get more editing space, and reopen it with the Explorer icon. [video r-row-binds-and-joins2 @00:06]

## Related
- [install-r-and-positron.md](install-r-and-positron.md)
- [read-csv-and-clean-column-names.md](read-csv-and-clean-column-names.md)
- [run-code-and-use-positron-panes.md](run-code-and-use-positron-panes.md)
