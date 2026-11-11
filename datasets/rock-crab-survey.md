# Rock crab trawl survey (Practice set #2 - crab counts)

| File | Original path (`sources/files/...`) | Size | Rows x cols |
|---|---|---|---|
| `Information_stations.csv` | `Practice sets/Practice set #2/Information_stations.csv` | 303,470 B | 2,012 x 23 |
| `Nombre_crabe_crab_number.csv` | `Practice sets/Practice set #2/Nombre_crabe_crab_number.csv` | 103,016 B | 1,755 x 16 |
| target figure | `Practice sets/Practice set #2/crab_counts.png` | 212 KB | image to recreate |

- Provenance: a French-language (Quebec / Gulf of St. Lawrence) crab trawl survey; positions are around 47.3-47.6 N,
  61.5 W, and years 1995-2022. The course page does not name the publisher (likely Fisheries and Oceans Canada open
  data, not confirmed). Comment columns are given in French with an English translation column.
- Course use: [Exam Practice](../course-pages/exam-practice.md) "Practice Set #2 - Crab counts": recreate
  `crab_counts.png` in R. Probably also the Class 3 "Case study #3: Rock crab fishery"
  ([Lesson 3 Overview](../course-pages/lesson-3-overview.md)) - inferred, not stated.
- Course description: `Information_stations.csv` "contains information on all of the stations and tows, including
  the distance that each tow was run for (dist)". `Nombre_crabe_crab_number.csv`: "Numbers of crabs (n_tot) for each
  tow is listed in every row with stations (st) and years (an); however, the length of the tow is not accounted for
  ... tows that run for longer distances could have more crabs ... This needs to be fixed!" (i.e. standardise counts
  by tow distance).

## Information_stations.csv

Abbreviations are French; meanings marked (inferred) are deduced from names and values, not from course material.

| Column | dtype | Non-null | Unique | Example values | Meaning / notes |
|---|---|---|---|---|---|
| `st` | object | 2,012 | 57 | `10`, `11` | station ID (text: some IDs are non-numeric) |
| `tr` | int64 | 2,012 | 4 | 1-4 | tow (trait) number at the station (inferred) |
| `an` | int64 | 2,012 | 28 | 2020, 2001 | year (année); 1995-2022 |
| `bat` | object | 2,012 | 3 | `L`, `C`, `M` | vessel (bateau) code (inferred) |
| `date` | object | 2,012 | 231 | `2020-09-10` | ISO date |
| `long.ddec` | object | 2,012 | 1,666 | `-61.53093333` | start longitude, decimal degrees (inferred "début"); stored as TEXT - some non-numeric entries |
| `lat.ddec` | float64 | 2,009 | 1,531 | 47.50681667 | start latitude |
| `long.fdec` | object | 2,012 | 1,644 | `-61.5241` | end longitude (inferred "fin"); TEXT |
| `lat.fdec` | float64 | 1,988 | 1,552 | 47.50675 | end latitude |
| `dist` | float64 | 2,012 | 1,980 | 514.83, 1014.79 | distance towed (course: "distance that each tow was run for"); units not stated, values 173-2,621 suggest metres |
| `heure.d`, `heure.f` | object | 2,006 / 1,961 | ~550 | `8:37`, `8:43` | start / end time H:MM (inferred) |
| `prof.m` | float64 | 2,010 | 215 | 15.8 | depth in metres (inferred) |
| `vit.nd` | float64 | 1,872 | 17 | 2.5 | tow speed in knots (noeuds) (inferred) |
| `cable.m` | float64 | 1,926 | 44 | 150.0 | cable length, m (inferred) |
| `comm.entete` / `comm_heading_EN` | object | 170 | ~135 | `mesure 1 homard sur 2` / `measures 1 out of 2 lobsters` | header comment, French / English |
| `moy.t3t10`, `moy.t1tn` | float64 | 1,972 / 1,998 | | 9.6, 9.7 | means of a repeated measurement (meaning not documented; possibly trawl-opening readings) |
| `comm.ouverture` / `comm_opening_EN` | object | 80 | 76 | `bcp d'algues` / `lots of algae` | comment on trawl opening |
| `surf` | float64 | 2,001 | 2,001 | 4015.70 | swept surface area (inferred, likely m2) |
| `Strate` | float64 | 1,766 | 4 | 1.0-4.0 | survey stratum |

## Nombre_crabe_crab_number.csv

| Column | dtype | Non-null | Unique | Example values | Meaning / notes |
|---|---|---|---|---|---|
| `date` | object | 1,755 | 202 | `1997-09-04` | ISO date |
| `st` | object | 1,755 | 56 | `5`, `16` | station ID (text) |
| `tr` | int64 | 1,755 | 4 | 1-4 | tow number |
| `bat` | object | 1,755 | 3 | `C`, `L`, `M` | vessel code |
| `com` | float64 | 1,663 | 98 | 34.0 | commercial-size crabs (inferred) |
| `non.com` | float64 | 1,647 | 165 | 14.0 | non-commercial crabs (inferred) |
| `m50` | float64 | 944 | 79 | 0.0 | males in a 50 mm size class (inferred) |
| `m.tot` | float64 | 1,755 | 231 | 67.0 | total males |
| `f` | float64 | 848 | 172 | 242.0 | females (inferred) |
| `f50` | float64 | 832 | 70 | 0.0 | females in a 50 mm size class (inferred) |
| `f.tot` | float64 | 1,754 | 271 | 180.0 | total females |
| `ind`, `ind50` | float64 | ~750 | 2 / 7 | 0.0 | sex undetermined (indéterminé) (inferred) |
| `n.tot` | float64 | 1,755 | 385 | 247.0 | total crabs in the tow (course: `n_tot`) |
| `comm` / `comm_EN` | object | 834 | ~72 | `1 crabe araignée` / `1 spider crab` | comment French / English |

Note: there is no year column in this file; derive year from `date` (or join to `an`).

## Data-quality issues an agent must handle

1. **French column names with dots.** `clean_names()` turns `n.tot` into `n_tot`, `long.ddec` into `long_ddec`,
   `heure.d` into `heure_d`, etc. (the course refers to `n_tot`).
2. **Standardise by effort:** divide `n_tot` by tow `dist` (e.g. crabs per km = `n_tot / (dist / 1000)` if dist is in
   metres) after joining; the course says counts must account for tow length.
3. **Join keys:** the common columns are `date`, `st`, `tr`, `bat`. The course note says you may run
   `left_join()` without `by =` and it will join on all shared column names
   (example given: `pwqmn_data_2024 |> left_join(unique_stations)`). Make sure `st` has the same type in both files
   (both are character as read).
4. **Text coordinates** (`long.ddec`, `long.fdec` are character): `as.numeric()`; non-numeric entries become `NA`.
5. **Missing values** in many count columns (`m50`, `f`, `f50`, `ind`) - `NA` does not mean zero; `n.tot`,
   `m.tot` are complete.
6. **Outliers:** `non.com` max 2,255 and `n.tot` max 2,480 vs median 85 - check before plotting.
7. **Bilingual comments**: use the `_EN` columns.

## Course procedures that use it

R only: `read_csv`, `clean_names`, `left_join` (implicit keys), `mutate` (rate per distance), `group_by` /
`summarize`, `ggplot` to match `crab_counts.png`. See [../course/assessments.md](../course/assessments.md#practice-set-2-crab-counts).
