# Irish Marine Sportfish Tagging Programme

| Copy | Original path (`sources/files/...`) | Size | Rows x cols |
|---|---|---|---|
| Stand-alone CSV | `Class 2/Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full.csv` | 5,800,518 B | 47,086 x 13 |
| Inside Class 2.zip | `Class 2/Class 2.zip` > `Class 2/data/Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full.csv` | 6,323,307 B | 47,086 x 15 |

- Provenance: Inland Fisheries Ireland, Marine Sportfish Tagging Programme
  (<https://www.fisheriesireland.ie/research/marine-sportfish-tagging-programme>). Per the course page: established
  1970 to promote catch-and-release of elasmobranchs (sharks, skates, rays); more than 40,000 fish tagged and over
  3,000 recaptures in 50 years; data revealed migration patterns, local extinctions (e.g. angelshark) and seasonal
  site fidelity (juvenile porbeagle); anglers can report tagged fish (citizen science).
- Course use: [Marine Sportfish Tagging Programme](../course-pages/marine-sportfish-tagging-programme.md) case study
  (Class 2 case study; Class 3 "Marine Sportfishing Programme (2 hours)"). Task: a briefing for Inland Fisheries
  Ireland programme managers showing how the programme developed over time, who and what contributes records, and
  temporal or species-level patterns, with visualizations and a short narrative, ending with implications for
  monitoring, outreach or resourcing. Class 3 objectives add exploratory analysis to find patterns and unusual
  observations.

## Column dictionary (stand-alone CSV, 13 columns)

| Column | dtype | Non-null | Unique | Example values | Meaning / notes |
|---|---|---|---|---|---|
| `OBJECTID_1` | int64 | 47,086 | 47,086 | 1, 1075 | GIS export row ID (1-47,112; gaps exist) |
| `Tag Event ID` | object | 47,086 | 47,086 | `MSFTag_000001` | unique tagging-event key |
| `TagType Num` | object | 47,086 | 47,086 | `D000001`, `J000013`, `P000047a` | tag number (prefix = tag type; some have letter suffix) |
| `Tag Type` | object | 47,086 | 5 | `D`, `J`, `P`, `R` | tag type code (meanings not given in course) |
| `Common Name` | object | 47,086 | 22 | `Blue shark`, `Tope`, `Thornback ray`, `Porbeagle shark` | species common name |
| `Species Code` | object | 47,082 | 21 | `PGB`, `GGT`, `THR`, `LNP` | 4 missing; 21 codes vs 22 names |
| `Latin name` | object | 47,086 | 22 | `Prionace glauca`, `Galeorhinus galeus`, `Raja clavata`, `Lamna nasus` | |
| `Tag Date` | object | 46,586 | 5,455 | `1971-09-15 0:00` | date-time text; 500 missing |
| `Tag Year` | int64 | 47,086 | 50 | 1971 | 1970-2019; complete even where `Tag Date` is missing |
| `Tagger ID` | object | 47,086 | 389 | `MSFTagger_0155`, `MSFTagger_Unknown` | anonymised angler/skipper ID |
| `ICES Statistical SubRectangles` | object | 47,086 | 228 | `37D98`, `32E24` | ICES statistical sub-rectangle code |
| `x` | float64 | 47,086 | 30 | -10.16666667 | longitude of the sub-rectangle centre (-13.5 to 1.8) |
| `y` | float64 | 47,086 | 47 | 54.25 | latitude of the sub-rectangle centre (36.75-58.4) |

The zip copy replaces `x`, `y` with four columns whose headers are all prefixed
`Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full_view_lat_long.` and end in `stat_x`, `stat_y`
(ICES statistical rectangle centre, 14 and 20 unique values) and `sub_x`, `sub_y` (sub-rectangle centre, same values
as `x`, `y`).

## Data-quality issues an agent must handle

1. **Coarse locations:** coordinates are grid-cell centres (30 unique x, 47 unique y), not capture points; many
   records stack on the same point in QGIS.
2. **Missing `Tag Date`** for 500 records - use `Tag Year` for annual trends; parse dates with `ymd_hm()` (R) or
   Power Query Date parsing; time part is always `0:00`.
3. **`MSFTagger_Unknown`** is a placeholder, not one person - exclude or treat separately when counting taggers.
4. **Species code / name mismatch** (21 codes, 22 names, 4 blank codes) - group by `Common Name` or `Latin name`.
5. **Two different CSV versions** (13 vs 15 columns, long duplicated-prefix headers in the zip copy). R's
   `read_csv` keeps long names; use `clean_names()` or select by position.
6. Only tagging events are included (no recapture records are visible in the columns), so recapture analysis is not
   possible from this file.

## Course procedures that use it

Exploratory analysis in Excel (PivotTables/PivotCharts by year, species, tagger), R (`group_by`, `summarize`,
`n_distinct`, `ggplot`) and QGIS (delimited text layer with X = `x`, Y = `y`, EPSG:4326). No captured video
uses it directly.
