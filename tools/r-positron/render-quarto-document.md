---
id: r-positron.render-quarto-document
tool: r-positron
title: Complete a Quarto (.qmd) case study in Positron and render it to Word or HTML
keywords: [Quarto, qmd, render, quarto render, docx, Word document, HTML, embed-resources, code chunk, r chunk, eval false, case study submission, terminal, powershell, YAML header, visual editor]
software_context: "Positron with Quarto CLI (status bar shows Quarto 1.10.18 / 1.9.38), Windows PowerShell terminal"
prerequisites: [r-positron.open-folder-and-set-working-directory, r-positron.install-and-load-packages]
source_videos: []
source_pages: [course-pages/class-1-overview.md, course-pages/marine-sportfish-tagging-programme.md]
datasets_used: ["sources/files/Topic 1 - Case study.qmd", "sources/files/Class 1/Topic 1.qmd", "sources/files/Class 2/Class 2.zip (Topic 2 - Case study.qmd)", "Class 1 case study.zip (Topic 1 - Case study.qmd, earlier variant)"]
---
# Complete a Quarto (.qmd) case study in Positron and render it to Word or HTML

## Purpose
Case studies are handed out as Quarto documents. You type answers in the visual editor, paste screenshots from Excel and QGIS, and write executable R code in ```` ```{r} ```` chunks. You then render the .qmd to a Word document (`format: docx`) for submission. The Class 1 Positron lesson itself is a Quarto file that renders to self-contained HTML.

## Steps
1. Put the .qmd in the lesson folder with the data, and open that folder in Positron (see [open-folder-and-set-working-directory.md](open-folder-and-set-working-directory.md)).
2. Open the .qmd from the Explorer. Its YAML header sets the output, for example `format: docx` and `editor: visual`. [script Topic 1 - Case study.qmd:1-5]
3. Type written answers below each question; the shaded "Question:" boxes are `::: {style=...}` divs. Insert screenshots where asked. [script Topic 1 - Case study.qmd:9-21, 27-29]
4. Write R code inside the empty chunks:
   ````
   ```{r}
   library(tidyverse)
   ...
   ```
   ````
   [script Topic 1 - Case study.qmd:85-89]
5. Run chunks interactively to test them, as you would script lines.
6. To show code without running it, add `#| eval: false` as the first line of the chunk; the course does this for `install.packages()`. [script Class 1/Topic 1.qmd:16-21]
7. Save the file.
8. Open the **TERMINAL** tab (the second tab in the bottom panel, next to CONSOLE). Paste the render command by copying it and right-clicking once in the terminal ("Use right click to paste"). Press Enter. [script Topic 1 - Case study.qmd:133-135] [_raw Class 1 case study.zip: Topic 1 - Case study.qmd]
9. Wait for the render to finish. A `.docx` with the same base name appears in the folder.

## Formulas / expressions / code
Render commands, as printed in the case-study files:
```
quarto render "Topic 1 - Case study.qmd"
```
```
quarto render "Topic 2 - Case study.qmd"
```
The instructions read: "Export your QMD file to a Word document by pasting the following code into the terminal (second tab below) by copying and right clicking once." (Topic 1) and "To finalize your submission, copy the following into the powershell terminal" (Topic 2). [script Topic 1 - Case study.qmd:133] [_raw Class 2.zip: Topic 2 - Case study.qmd]

YAML headers used in the course:
```yaml
---
title: "Topic 1: North Atlantic Right Whale"
format: docx
editor: visual
---
```
```yaml
---
title: "Topic 1: Positron"
format:
  html:
    embed-resources: true
---
```
(The second header is from `Class 1/Topic 1.qmd:1-6`; `embed-resources: true` makes one self-contained HTML file.)

Chunk option to skip execution [script Class 1/Topic 1.qmd:16-21]:
````
```{r}
#| eval: false

install.packages("tidyverse")
install.packages("janitor")
```
````

## Verify
- The terminal shows Quarto's render progress and ends by naming the output file. (general knowledge)
- `Topic 1 - Case study.docx` (or `.html` for the Class 1 lesson) appears in the Explorer.

## Pitfalls
- Run `quarto render` in the **TERMINAL** tab, not in the R CONSOLE. In the console it is not valid R. [script Topic 1 - Case study.qmd:133]
- The file name has spaces, so keep the double quotes around it.
- Rendering runs every chunk from scratch in a new R session. Each document must load its own packages and data, and any chunk with an error (for example the unbalanced `)` in `Class 1/Topic 1.qmd:125`) stops the render. Fix errors or mark the chunk `#| eval: false`. (render behaviour is general knowledge) [script Class 1/Topic 1.qmd:125]
- The earlier Class 1 case-study variant (inside `Class 1 case study.zip`) has a placeholder chunk that calls `library(ggplot2)` and plots `mtcars`. Replace it with the real answer. [_raw Class 1__Class 1 case study.zip.contents.md:439-447]
- Positron bundles Quarto (general knowledge — not stated in course). The status bar's "Quarto: <version>" confirms it is available. [frame positron-introduction-and-package-installation @00:12]

## Related
- [save-plot-png-and-csv.md](save-plot-png-and-csv.md)
- [scripts-catalog.md](scripts-catalog.md)
- [run-code-and-use-positron-panes.md](run-code-and-use-positron-panes.md)
