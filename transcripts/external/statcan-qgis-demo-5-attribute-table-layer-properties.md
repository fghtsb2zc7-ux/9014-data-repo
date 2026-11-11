---
title: "Exploring the Attribute Table and Layer Properties Box of Vector Data (QGIS Demo 5)"
publisher: Statistics Canada
catalogue: 89200005, issue 2020005
release_date: 2020-02-17
source_page: https://www.statcan.gc.ca/en/wtc/online-lectures/qgis/2020005
video_file: https://publications.gc.ca/collections/collection_2020/statcan/892-00005/CS892-00005-2020-5-eng.mp4
linked_from: ["Videos organized by software", "Topic 1: Loading, Cleaning and Exploring Data"]
course_link_text: "Vector Data - Exploring the Attribute Table and Layer Properties Box (Statistics Canada)"
transcript_source: publisher HTML transcript (paraphrased)
---

# Exploring the Attribute Table and Layer Properties Box of Vector Data - Statistics Canada QGIS Demo 5

> **Provenance note:** This file comes from the publisher's web page, not from Brightspace. Verbatim retrieval was not possible through the available fetch tool (it returned a detailed paraphrase only), so the text below is a faithful point-by-point **paraphrase of the published transcript**, with UI names quoted as they appear in the transcript. It is not an auto-caption and not verbatim.

1. Follows the Map Canvas demo; covers the Attribute Table and Layer Properties.
2. Open the table: select the layer and click the **Attribute table** icon, or right-click > **Open Attribute Table**.
3. Columns = fields (variables); rows = features.
4. Pick a feature with the row tabs on the left; right-click > **Zoom to the Feature**; if hidden (e.g. under Census Subdivision) use **Flash** the feature.
5. Multi-select rows: Shift for a range, Ctrl for individual rows; then zoom to selection.
6. Selections are linked between canvas and table (highlighted in different colours).
7. Click a field name once/twice to sort ascending/descending (e.g. to select all features in one province); **Invert feature selection** flips it.
8. **Move Selection to Top** keeps selected rows at the top; selected rows can be copied to a spreadsheet.
9. Filtering: the **Show All Features** drop-down offers a **Field Filter** (e.g. Province name = Manitoba).
10. **Show Features Visible on Map** limits the table to features in the current extent (updates while panning/zooming).
11. Editing: toggle editing to add/delete features and fields or edit cells; the **Update Field** bar with **Update Selected** sets a value for selected features (changes discarded in the demo).
12. Layer Properties: right-click > **Properties** or double-click the layer.
13. **Information** tab: summary of spatial and attribute characteristics.
14. **Source** tab: rename layer; **Query Builder** filters which geometries draw on the canvas (unlike the table-only Field Filter).
15. **Symbology** and **Labels** tabs (later demo); **Diagrams**; **3D** view when enabled.
16. **Source Fields** tab: field names, types, parameters; with editing on, add/delete/rename fields.
17. **Joins** tab: link tables/layers by a shared field (one-to-one only); example joined Census Division and Subdivision by a unique identifier; remove with the minus icon.
18. **Rendering** tab: minimum/maximum scale visibility (from drop-downs or current canvas scale) - helps with large datasets.
19. Next demo: creating vector data (digitising features, filling attributes).
