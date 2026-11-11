---
title: "QGIS - Changing column types"
tool: qgis
duration: "01:58"
content_id: f49207a2-ff4e-4d84-a2a7-85dc41888a6e
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 5: Connecting Data - Joins, merges, and spatial relationships"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=f49207a2-ff4e-4d84-a2a7-85dc41888a6e&revisionId=latest
---

# QGIS - Changing column types — transcript

Duration 01:58. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:02]** Title card "QGIS - Changing column types".
- **[00:12]** QGIS (different toolbar layout/version from other videos). Layers: group/table "PWQMN_data_2024" and point layer "PWQMN_Stations" symbolised as categorized on text values ("<0.003", 0.003, 0.004, ... 0.028) over Google Maps; "Search QMS" panel (Google Maps, ESRI Satellite, ESRI Ocean, ESRI National). Map of southern Ontario/Great Lakes stations.
- **[00:32]** "PWQMN_Stations" selected; pointer on the Field Calculator button (Attributes toolbar, right of Identify).
- **[00:42]** "PWQMN_Stations — Field Calculator": "Create virtual field" ticked/greyed; Output field type "Whole number (integer)", length 10, precision 3; Fields list includes MISS_YEARS, PWQMN_data_2024__id, PWQMN_data_2024_Year, PWQMN_data_2024_Analyte, PWQMN_data_2024_Collected, PWQMN_data_2024_Collection_Time, PWQMN_data_2024_Lab Workorder ID, PWQMN_data_2024_Lab Sample ID, abc PWQMN_data_2024_Results, PWQMN_data_2024_Units; "Feature: Bar River"; message "This layer does not support adding new provider fields. You can only add virtual fields."
- **[00:52]** Expression `"PWQMN_data_2024_Results"` (double-clicked from list); Preview: NULL (for feature Bar River).
- **[01:02]** Output field name "phosphate"; Output field type "Decimal number (double)"; Output field length -1 (greyed), Precision 3; OK enabled.
- **[01:22]** Attribute table "PWQMN_Stations — Features Total: 2198, Filtered: 2198, Selected: 0": columns STATUS, FIRST_YEAR, LAST_YEAR, TOTAL_YEARS, MISS_YEARS, ...data_2024 (Phosphorus; ...), Results (0.039, <0.003 ...), Units mg/L, Result Call Detected/BDL, Detection limit 0.003, Method E3364, Value Qualifier (<), last column "phosphate" right-aligned numbers (0.039, 0.026, ...) and NULL where Results was "<0.003".
- **[01:32]** Right-click on PWQMN_Stations: ..., Open Attribute Table, Filter..., Change Data Source..., Set Layer Scale Visibility..., Layer CRS, Export, Styles, Add Layer Notes..., **Properties...**
- **[01:42]** "Layer Properties — PWQMN_Stations — Symbology": "Graduated", Value "1.2 phosphate", Legend format "%1 - %2", Precision 4, Method "Color", Color ramp white-to-red; Mode "Equal Count (Quantile)", Classes 5; classes 0.000000–0.004000, 0.004000–0.005000, 0.005000–0.009200, 0.009200–0.024000, 0.024000–2.970000; Classify clicked; "Link class boundaries" ticked.
- **[01:52]** Map: stations graduated white→dark red; legend 0 - 0.004, 0.004 - 0.005, 0.005 - 0.0092, 0.0092 - 0.024, 0.024 - 2.97.

## Transcript

**[00:05]** Alright, while we were here, I thought maybe I would just take a second to show you how you can change the column type here from kind of a text file to numeric. You can actually do that on the way in, so when you load up the file, sometimes there's a little previewed box, you can change the um sort of the the data class there, but we can do this also with with something that's called the field calculator. So I'm just gonna grab the stations, I'm gonna go up to the field calculator here, which is this button. Um, we're just going to go and find the, um, column itself that we wanna change. So in this case, we do wanna change, uh, the results. So we wanna, uh, right now

**[00:46]** they're in a text format. So we're gonna throw the text format of the column in there. We're gonna say, let's change this to phosphate, because remember it's our phosphate levels we're trying to measure. We can change this to decimal number, because most of them are in decimal number. And uh then we can just click OK. When we go into our attributes table now, we scroll over, we can see that we've got phosphate and it is in this sort of numeric format now. Anything that was that negative, whatever has been turned into null or missing data.

**[01:26]** So that's fine, that's great for us. We've now made that numeric. Let's go back in and change the symbology here. We're gonna graduated. Uh, we're gonna find our phosphate column, classify it, OK, so this should show us dark red areas should be areas that have high phosphate concentrations. OK, so we were able to change that over from text to numeric just using the field calculator.
