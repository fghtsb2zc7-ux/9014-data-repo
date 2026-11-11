# Vessel traffic routes - `Practice sets/Vessel_Traffic_Routes.zip`

- Original path: `sources/files/Practice sets/Vessel_Traffic_Routes.zip` (1.06 MB, 61 entries: 15 shapefiles, each
  with `.dbf`, `.prj`, `.shp`, `.shx`).
- A second, larger copy (8,845,016 B, nested zip; contents not listed) is inside `Class 1/Class 1 case study.zip`
  for the Class 1 case study. Its layer list may differ from the 15 layers below - check after unzipping.
- CRS: every `.prj` is `GCS_WGS_1984` (geographic WGS 84, EPSG:4326, units degrees).
- Provenance: Canadian marine vessel-routing features (traffic separation schemes, recommended routes, ferry
  routes). The course pages do not name the publisher. The 6-letter layer names follow the IHO S-57 electronic
  navigational chart object-class acronyms (general knowledge - not shown in course).
- Course use: Class 1 case study (`Topic 1 - Case study.qmd`: "Load all of the shapefiles for the different vessel
  routes around Canada. Focus on the Bay of Fundy"), [Exam practice set #1](../course-pages/practice-1-north-atlantic-right-whale.md)
  Q.1.2-Q.1.6, and the practice-exam ferry question (buffers of 1 km and 2 km around a ferry route near Grand Manan,
  see `Practice Questions/ferry.png`, `grand_mana.png`).

## Layers

| Layer | Geometry (suffix) | .dbf size | Meaning | Source of meaning |
|---|---|---|---|---|
| `TSSLPT_A` | polygon | 498,000 B | Traffic separation scheme lane part ("traffic separation lanes") | course (Q.1.2) |
| `TSEZNE_A` | polygon | 213,675 B | Traffic separation zone ("area separating the traffic separation lanes") | course (Q.1.2) |
| `FERYRT_L` | line | 1,076,197 B | Ferry routes | inferred from name; practice exam uses a ferry route |
| `CTSARE_A` | polygon | 2,969 B | Cautionary area | S-57 acronym (general knowledge) |
| `ISTZNE_A` | polygon | 16,078 B | Inshore traffic zone | S-57 acronym (general knowledge) |
| `NAVLNE_L` | line | 1,632,122 B | Navigation line | S-57 acronym (general knowledge) |
| `RCRTCL_L` | line | 564,450 B | Recommended route centreline | S-57 acronym (general knowledge) |
| `RCTLPT_A`, `RCTLPT_P` | polygon, point | 10,071 B; 131,051 B | Recommended traffic lane part | S-57 acronym (general knowledge) |
| `RECTRC_A`, `RECTRC_L` | polygon, line | 14,508 B; 2,996,326 B | Recommended track | S-57 acronym (general knowledge) |
| `TSELNE_L` | line | 4,766 B | Traffic separation line | S-57 acronym (general knowledge) |
| `TSSBND_L` | line | 233,566 B | Traffic separation scheme boundary | S-57 acronym (general knowledge) |
| `TSSCRS_A` | polygon | 2,278 B | Traffic separation scheme crossing | S-57 acronym (general knowledge) |
| `TWRTPT_A` | polygon | 58,806 B | Two-way route part | S-57 acronym (general knowledge) |

Suffix convention: `_A` area (polygon), `_L` line, `_P` point.

Attribute fields: not profiled (no `.dbf` schema was extracted). Practice set #1 warns that merging layers may raise
"errors about field length" that can be ignored.

## Data-quality issues an agent must handle

1. **Geographic CRS (degrees).** Distances and buffers must be computed after reprojection to a metre CRS; the course
   uses NAD83 / UTM zone 20N (EPSG:26920) for the Bay of Fundy (Q.1.4).
2. **Merging layers** with different attribute schemas: Vector > Data Management Tools > Merge Vector Layers; field
   length warnings can be ignored (Q.1.2).
3. **Selection to new layer:** select Bay of Fundy features, then right-click layer > Export > Save Selected
   Features As (use the `...` button to set the output path) (Q.1.2 help).
4. **Proximity is not presence:** distance to a mapped route does not show that a vessel was present at the time of
   a sighting (Q.1.5 discussion).

## Course procedures that use it

QGIS: adding a shapefile (drag and drop), Merge Vector Layers, select features, Save Selected Features As,
Count Points in Polygon, Reproject Layer, Join attributes by nearest, Buffer, Print Layout. Full questions:
[../course/assessments.md](../course/assessments.md#practice-set-1-north-atlantic-right-whale).
