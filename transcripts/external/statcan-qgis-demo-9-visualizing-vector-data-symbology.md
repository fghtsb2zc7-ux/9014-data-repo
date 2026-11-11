---
title: "Visualizing Vector Data (Part 1): Symbology Styles (QGIS Demo 9)"
publisher: Statistics Canada
catalogue: 89200005, issue 2020009
release_date: 2020-02-25
source_page: https://www.statcan.gc.ca/en/wtc/online-lectures/qgis/2020009
video_file: https://publications.gc.ca/collections/collection_2020/statcan/892-00005/CS892-00005-2020-9-eng.mp4
linked_from: ["Videos organized by software", "Topic 1: Loading, Cleaning and Exploring Data"]
course_link_text: "Visualizing Vector Data (Statistics Canada)"
transcript_source: publisher HTML transcript (paraphrased)
---

# Visualizing Vector Data (Part 1): Symbology Styles - Statistics Canada QGIS Demo 9

> **Provenance note:** This file comes from the publisher's web page, not from Brightspace. Verbatim retrieval was not possible through the available fetch tool (it returned a detailed paraphrase only), so the text below is a faithful point-by-point **paraphrase of the published transcript**, with UI names quoted as they appear in the transcript. It is not an auto-caption and not verbatim.

1. Symbology lives in Layer Properties > **Symbology** tab. Part 2 (separate video) covers rule-based symbology, saving/loading styles and labels.
2. Design: check conventions for the feature type, logical colours, style matched to field type, contrast, avoid clutter or oversimplification for the map scale.
3. Quick colour change: right-click layer > **Style** > drag the colour wheel (white marker sets hue/brightness).
4. **Single Symbol** (default): one colour; to show outlines only open **Simple Fill**, set **Fill Color** opacity to 0, **Apply**, **OK**.
5. Census Division outline width 0.86 and red under Simple Fill, so divisions and subdivisions show together.
6. **Categorized**: choose the field in **Column**, click **Classify**, **Apply** (subdivisions coloured by provincial unique identifier; then by Census Division name - Classify, Yes, OK).
7. Random colours can give neighbours similar colours / poor palettes.
8. **Topological Coloring** (Processing Toolbox): set **Input layer**, number of colours, **Mode** ("Assigned Area" chosen); output adds a **color id** field.
9. Categorize on color id; **Colour Ramp** > **Create New** > **Catalog: ColorBrewer**, matching class count, Pastel1; OK, Classify, OK.
10. **Graduated**: numeric fields (concentrations, magnitudes, frequencies); grain elevators by Capacity_Tonne.
11. **Mode** (e.g. **Pretty Breaks**), **Precision** (legend decimals), **Classes** (number of ranges). Most elevators fell in the lowest class.
12. **Histogram** tab > **Load Values** shows the distribution; switched to **Quantile (Equal Count)**.
13. Double-click values to edit breaks (5000, 50000) and legend labels ("less than 5000", "greater than 50000"); Apply; histogram confirms.
14. Symbol size can increase per class (point size +0.5 per class).
15. **Point Cluster** renderer (keeps graduated style in **Render Settings**; **Distance** sets cluster radius; counts change with scale).
16. **Point Displacement**: spreads clustered points in a pattern; can label by a field (Capacity Tonne); best for sparse data.
17. **Heatmap** renderer: raster-like density surface; colour ramp Red-Yellow-Green inverted; **Weight** by Capacity Tonne.
18. Click the colour ramp itself to edit stops, each with its own **Opacity** (make low values transparent so boundaries show beneath).
19. **Save Project As** "VectorVisualization" for part 2.
