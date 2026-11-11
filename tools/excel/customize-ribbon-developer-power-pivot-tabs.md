---
id: excel.customize-ribbon-developer-power-pivot-tabs
tool: excel
title: Add the Developer and Power Pivot tabs to the ribbon (and reorder tabs)
keywords: [customize ribbon, developer tab, power pivot tab, show developer, add tab, enable power pivot, reorder ribbon tabs, excel options, macros tab, data model tab, ribbon setup]
software_context: "Excel for Microsoft 365 desktop (Windows), Excel Options > Customize Ribbon"
prerequisites: []
source_videos: [{video: transcripts/excel/excel-intro-to-excel.md, timestamps: "10:32-11:42"}]
source_pages: [course-pages/topic-1-loading-cleaning-and-exploring-data.md]
datasets_used: []
---
# Add the Developer and Power Pivot tabs to the ribbon (and reorder tabs)

## Purpose
The course asks every student to show two extra ribbon tabs: **Developer** (macros, Excel Add-ins, used to switch on the Analysis ToolPak) and **Power Pivot** (data model). This is one-time setup done in the intro video, before any data work.

## Steps
1. Make sure you are in the **desktop** version of Excel (installed through Office 365 / Western's subscription), not Excel for the web. [video excel-intro-to-excel @00:07]
2. Right-click anywhere on the ribbon and choose **Customize the Ribbon...**. [video excel-intro-to-excel @10:32] (The exact context-menu wording is not visible in a frame; the result is the "Excel Options" dialog. `File > Options > Customize Ribbon` reaches the same page - general knowledge, not shown in course.)
3. In the **Excel Options** dialog, the **Customize Ribbon** page is selected. Leave "Choose commands from:" at **Popular Commands** and "Customize the Ribbon:" at **Main Tabs**. [frame @10:52]
4. In the right-hand list, tick **Developer**. [video excel-intro-to-excel @11:02]
5. Tick **Power Pivot** (near the bottom of the list, below Acrobat). [frame @11:22]
6. Click **OK**. The new tabs appear at the end of the tab bar: "... Review, View, Developer, Help, Power Pivot". [frame @11:12]
7. Optional - move the tabs next to Data: reopen **Customize the Ribbon**, select **Power Pivot** in the right-hand list and click the **up arrow** (to the right of the list) until it sits just below **Data**; do the same for **Developer**. [video excel-intro-to-excel @11:04; frame @11:22]
8. Click **OK**. [frame @11:32]

## Formulas / expressions / code
None.

## Verify
- Tab bar reads: File, Home, Insert, Draw, Page Layout, Formulas, Data, Power Pivot, Developer, Review, View, Help (order after step 7). [frame @11:32]
- **Developer** tab shows groups Code (Visual Basic, Macros, Record Macro, Use Relative References, Macro Security), Add-ins (Add-ins, Excel Add-ins, COM Add-ins), Controls, XML. [frame @11:42]
- **Power Pivot** tab shows Data Model (Manage), Calculations (Measures, KPIs), Tables (Add to Data Model), Relationships (Detect), Settings. [frame @14:02]

## Pitfalls
- Some recordings (e.g. the loading-data and filtering videos) were made on a ribbon without these tabs and with an extra **Automate** tab; that is normal - the tabs are per-installation settings. [frame excel-loading-data-into-excel @00:12]
- Mac users: the instructor notes that menus are sometimes in different places on Macs. [video excel-loading-data-into-excel @01:10]
- Excel for the web has no Customize Ribbon option for these tabs (general knowledge - not shown in course); use the desktop app.

## Related
- [Enable the Data Analysis ToolPak](enable-data-analysis-toolpak.md) (uses Developer > Excel Add-ins)
- [Ribbon tour: where the course's tools live](ribbon-tour-course-features.md)
- Transcript: [Excel - Intro to Excel](../../transcripts/excel/excel-intro-to-excel.md)
