---
id: r-positron.install-r-and-positron
tool: r-positron
title: Install R and Positron and start an R console session
keywords: [install, setup, download, Positron, R, CRAN, RStudio alternative, interpreter, R version, start session, console, base R, 4.6.1]
software_context: "Positron (Posit) on Windows; R 4.6.1 (course page says current version 4.6.1); Quarto 1.10.18 shown in status bar"
prerequisites: []
source_videos: [{video: transcripts/r-positron/positron-introduction-and-package-installation.md, timestamps: "00:07-01:19, 05:00-05:37"}]
source_pages: [course-pages/getting-started-with-course-software.md, course-pages/videos-organized-by-software.md]
datasets_used: []
---
# Install R and Positron and start an R console session

## Purpose
Positron is the course code editor; R is the language it runs. Both must be installed before any R work in ENVRSUST 9014. Positron detects the installed R automatically, and you then start an R console session.

## Steps
1. Download Positron from https://positron.posit.co/download.html and install it. [page getting-started-with-course-software.md]
2. Download base R for your operating system from https://cran.r-project.org/ (the course page says the current version is 4.6.1) and install it. [page getting-started-with-course-software.md]
3. Open Positron. Positron will detect the installed R. [page getting-started-with-course-software.md]
4. Open your lesson folder with the Explorer's **Open Folder** button. See [open-folder-and-set-working-directory.md](open-folder-and-set-working-directory.md). [video positron-introduction-and-package-installation @04:42]
5. If the console says "There is no session running. Use Start Session to start one.", click **Start Session** at the top right of the window. [video positron-introduction-and-package-installation @05:02] [frame]
6. In the **Start New Console Session** picker, choose the R version marked "Suggested" (in the video, `R 4.6.1  C:\Program Files\R\R-4.6.1\bin\x64\R.exe`). Other installed versions, such as R 4.4.1, 4.3.2 and 4.3.1, appear too, along with "+ Install Python via uv". [video positron-introduction-and-package-installation @05:12] [frame]
7. Wait for the console to print the R banner, for example `R version 4.6.1 (2026-06-24 ucrt) -- "Happy Hop"`. [frame]
8. Optional: watch the linked videos "A quick tour of Positron" (https://youtu.be/4Ir_HX4riHw) and "R programming in one hour" (https://www.youtube.com/watch?v=eR-XRSKsuR4). [page getting-started-with-course-software.md]

## Formulas / expressions / code
None. All of this is done through the user interface.

## Verify
- The top-right interpreter badge shows the R version, for example "R 4.6.1". [frame]
- The console shows the R startup banner and a `>` prompt.
- The status bar shows "Quarto: <version>", which means Positron found Quarto. The videos show 1.10.18 and 1.9.38. [frame]

## Pitfalls
- R itself is a separate install from Positron. Positron is only the editor. [page getting-started-with-course-software.md]
- If you have several R versions installed, check which one you pick. In the joins video the instructor runs R 4.5.0, and loading janitor prints "Warning message: package 'janitor' was built under R version 4.5.1". That warning is harmless. [video r-row-binds-and-joins2 @00:43]
- Positron can also run Python. The course plans Python for large geospatial work later, but for now always start an **R** console. [video positron-introduction-and-package-installation @05:00]

## Related
- [install-and-load-packages.md](install-and-load-packages.md)
- [open-folder-and-set-working-directory.md](open-folder-and-set-working-directory.md)
- [run-code-and-use-positron-panes.md](run-code-and-use-positron-panes.md)
