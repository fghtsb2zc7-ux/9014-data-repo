---
id: excel.enable-data-analysis-toolpak
tool: excel
title: Enable the Analysis ToolPak and open the Data Analysis tools
keywords: [analysis toolpak, data analysis toolpak, data analysis button, add-in, excel add-ins, regression, descriptive statistics, anova, correlation, t-test, histogram, statistics in excel, enable add-in]
software_context: "Excel for Microsoft 365 desktop (Windows), Developer tab > Excel Add-ins; Data tab > Analysis group"
prerequisites: [excel.customize-ribbon-developer-power-pivot-tabs]
source_videos: [{video: transcripts/excel/excel-intro-to-excel.md, timestamps: "12:42-13:42"}]
source_pages: [course-pages/topic-1-loading-cleaning-and-exploring-data.md]
datasets_used: []
---
# Enable the Analysis ToolPak and open the Data Analysis tools

## Purpose
Adds Excel's built-in statistics add-in ("Analysis ToolPak") so that a **Data Analysis** button appears on the Data tab. The course uses it for basic statistics (descriptive statistics, correlation, ANOVA, regression; regression is used again in later lessons alongside R). Topic 1 lists this as part of the intro video.

## Steps
1. Show the Developer tab first (see prerequisite). [video excel-intro-to-excel @11:04]
2. Click the **Developer** tab, then **Excel Add-ins** (in the **Add-ins** group). [video excel-intro-to-excel @12:22; frame @12:42]
3. In the Add-ins dialog, tick **Analysis ToolPak** and click **OK**. [video excel-intro-to-excel @12:30] (This dialog is not captured in any frame, so its exact layout is unverified.)
4. Click the **Data** tab. A new group **Analysis** with the button **Data Analysis** is now at the far right. [frame @12:52]
5. Click **Data > Analysis > Data Analysis** to open the **Data Analysis** dialog. [video excel-intro-to-excel @12:55; frame @13:12]
6. Select a tool in the **Analysis Tools** list and click **OK** (or **Cancel** to close). [frame @13:12, @13:42]

## Formulas / expressions / code
None. Tools visible in the **Analysis Tools** list [frame @13:12]:

| Tool names exactly as listed |
|---|
| Anova: Two-Factor With Replication; Anova: Two-Factor Without Replication; Correlation; Covariance; Descriptive Statistics; Exponential Smoothing; F-Test Two-Sample for Variances; Fourier Analysis; Histogram; Moving Average; Random Number Generation; Rank and Percentile; Regression; Sampling; t-Test: Paired Two Sample for Means; t-Test: Two-Sample Assuming Equal Variances; t-Test: Two-Sample Assuming Unequal Variances |

The list was scrolled; any entry above "Anova: Two-Factor With Replication" was not visible.

## Verify
- Data tab ends with an **Analysis** group containing **Data Analysis**. [frame @12:52]
- Clicking it opens the "Data Analysis" dialog with the list above. [frame @13:12]

## Pitfalls
- The instructor stresses that Excel's statistics are limited; more advanced statistics are done in R. [video excel-intro-to-excel @12:55-13:30]
- If you skipped the Developer tab, `File > Options > Add-ins`, Manage: **Excel Add-ins** > **Go...** reaches the same Add-ins dialog (general knowledge - not shown in course).

## Related
- [Add the Developer and Power Pivot tabs](customize-ribbon-developer-power-pivot-tabs.md)
- [Ribbon tour](ribbon-tour-course-features.md)
- Transcript: [Excel - Intro to Excel](../../transcripts/excel/excel-intro-to-excel.md)
