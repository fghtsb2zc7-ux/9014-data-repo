---
title: "Loading and Ordering Spatial Data in QGIS (QGIS Demo 3)"
publisher: Statistics Canada
catalogue: 89200005, issue 2020003
release_date: 2020-02-17
source_page: https://www.statcan.gc.ca/en/wtc/online-lectures/qgis/2020003
video_file: https://publications.gc.ca/collections/collection_2020/statcan/892-00005/CS892-00005-2020-3-eng.mp4
linked_from: ["Videos organized by software", "Topic 1: Loading, Cleaning and Exploring Data"]
course_link_text: "Loading and ordering spatial data in QGIS (Statistics Canada)"
transcript_source: publisher HTML transcript (paraphrased)
---

# Loading and Ordering Spatial Data in QGIS - Statistics Canada QGIS Demo 3

> **Provenance note:** This file comes from the publisher's web page, not from Brightspace. Verbatim retrieval was not possible through the available fetch tool (it returned a detailed paraphrase only), so the text below is a faithful point-by-point **paraphrase of the published transcript**, with UI names quoted as they appear in the transcript. It is not an auto-caption and not verbatim.

1. Open QGIS Desktop (desktop shortcut or Start bar); pin it to the taskbar. Default layout opens.
2. In the **Browser** panel expand Home > Documents to the **GeospatialData** folder (data downloaded in the previous video).
3. Right-click the folder and add it as a **Favourite**; it appears under Favourites at the top for faster loading.
4. The Intro Demo folder holds 4 shapefiles and 2 geodatabases; expand geodatabases to see their layers.
5. Load layers by double-clicking in the Browser or dragging into the **Layers** panel: Grain Elevators (one layer), Transport Features (many layers; Road Segments used), two census boundary files - six layers in total.
6. QGIS assigns random colours to vector layers, so colours may differ.
7. In the Layers panel, toggle visibility and rename layers (Census Subdivisions renamed to a clearer name).
8. Only one layer may be visible in the **Map Canvas**: layer order sets drawing order. Generally points above lines above polygons.
9. Same-type layers: follow real-world relationships (roads above rivers; the Lakes and Rivers polygon above census boundaries).
10. After reordering, zoom in to see all layers.
11. Save with the **Save** icon on the **Project** toolbar, next to the data, with a descriptive name (e.g. "Loading and Ordering Spatial Data"). Projects keep layer order, styles (labels, colours) and joins.
12. Next demo: **Map Navigation** and **Attribute** toolbars.
