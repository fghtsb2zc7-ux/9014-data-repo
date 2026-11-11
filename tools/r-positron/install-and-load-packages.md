---
id: r-positron.install-and-load-packages
tool: r-positron
title: Install and load R packages (tidyverse, janitor)
keywords: [install.packages, library, package, tidyverse, janitor, load package, Packages pane, missing packages, dplyr, ggplot2, readr, lubridate, tidyr, CRAN]
software_context: "Positron, R 4.6.1, tidyverse 2.0.0 (dplyr 1.2.1, readr 2.2.0, forcats 1.0.1, stringr 1.6.0, ggplot2 4.0.3, tibble 3.3.1, lubridate 1.9.5, tidyr 1.3.2, purrr 1.2.2), janitor 2.2.1"
prerequisites: [r-positron.install-r-and-positron]
source_videos: [{video: transcripts/r-positron/positron-introduction-and-package-installation.md, timestamps: "03:47-07:37"}]
source_pages: [course-pages/technical-skills-checklist.md, course-pages/getting-started-with-course-software.md]
datasets_used: []
---
# Install and load R packages (tidyverse, janitor)

## Purpose
The course uses only two add-on packages, **tidyverse** and **janitor**. Install each one once per computer. Load both with `library()` at the start of every R session, before running any other course code.

## Steps
1. Open the lesson script in the editor. In the video this is `Lesson_1.R`; every course script starts with these lines. [video positron-introduction-and-package-installation @03:47]
2. To install from code (needed once only), select the two `install.packages()` lines and run them (see [run-code-and-use-positron-panes.md](run-code-and-use-positron-panes.md)). [video positron-introduction-and-package-installation @05:52]
3. Alternatively, install from the interface. Click the lowest icon in the left activity bar to open the **PACKAGES** pane. Click the icons at the top of the pane: the frame shows the cursor there, but the exact icon name isn't readable. The **Install Package (1/2)** picker opens at the top of the window. Type `tidyverse` and choose `tidyverse` from the suggestions. Repeat for `janitor`. [video positron-introduction-and-package-installation @04:22-04:32] [frame]
4. Wait until the console reports `package 'tidyverse' successfully unpacked and MD5 sums checked`. Installing tidyverse downloads many dependency packages and takes a minute or more. [video positron-introduction-and-package-installation @06:13] [frame]
5. Run the two `library()` lines. You must do this in every new session. [video positron-introduction-and-package-installation @06:48]
6. Check that the console prints the "Attaching core tidyverse packages" block. [frame @07:02]

## Formulas / expressions / code
As written in the course scripts (R Skills Review.R:17-18, 25-26; the video's Lesson_1.R lines 5-10):
```r
## Install packages
# You only need to complete this step once
install.packages("tidyverse")
install.packages("janitor")

# Loading required packages, you do this at the start of every session
library(tidyverse) # large collection of packages for data manipulation
library(janitor) # package with function for cleaning data, the function is called "clean_names"
```
- `install.packages("name")` downloads the package from CRAN (`https://cran.rstudio.com/...` in the console).
- `library(name)` loads an installed package into the current session.
- In the course .R/.qmd scripts the install lines are commented out (`# install.packages("tidyverse")`), or the Quarto chunk is marked `#| eval: false`, so they don't re-run every time. [script R Skills Review.R:15-18]

## Verify
After `library(tidyverse)` the console shows: [frame @07:02]
```
── Attaching core tidyverse packages ──── tidyverse 2.0.0 ──
✔ dplyr     1.2.1     ✔ readr     2.2.0
✔ forcats   1.0.1     ✔ stringr   1.6.0
✔ ggplot2   4.0.3     ✔ tibble    3.3.1
✔ lubridate 1.9.5     ✔ tidyr     1.3.2
✔ purrr     1.2.2
── Conflicts ──── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
```
After `library(janitor)` the console shows "Attaching package: 'janitor'" and "The following objects are masked from 'package:stats': chisq.test, fisher.test". These "masks" messages are normal. The editor's "⚠ 2 missing packages" banner goes away once both packages are installed.

## Pitfalls
- If `library()` fails with "there is no package called ...", the package was never installed. Run `install.packages()` first. (general knowledge — not shown in course)
- Don't leave `install.packages()` uncommented in scripts you run repeatedly. It reinstalls the package every time. The course comments those lines out. [script Combined R Scripts.R:15-16]
- "package 'janitor' was built under R version 4.5.1" is a harmless warning that appears when your R is slightly older. [video r-row-binds-and-joins2 @00:43]
- No other packages (sf, terra, readxl, etc.) are used anywhere in the course R material.

## Related
- [install-r-and-positron.md](install-r-and-positron.md)
- [read-csv-and-clean-column-names.md](read-csv-and-clean-column-names.md)
- [function-reference.md](function-reference.md)
