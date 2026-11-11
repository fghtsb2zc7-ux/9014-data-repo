# Parks Canada human-wildlife coexistence records, 2010-2023

| File | Original path (`sources/files/...`) | Size | Rows x cols |
|---|---|---|---|
| Animals involved | `Practice Questions/pca-human-wildlife-coexistence-animals-involved-detailed-records-2010-2023.csv` | 17,961,433 B | 103,310 x 14 |
| Incidents | `Practice Questions/pca-human-wildlife-coexistence-incidents-detailed-records-2010-2023.csv` | 14,031,720 B | 87,789 x 10 |

- Provenance: Parks Canada Agency (prefix `pca-`) open data on human-wildlife coexistence incidents in national
  parks and other protected heritage areas (publisher inferred from file name and values; not stated on the page).
- Course use: [Exam Practice](../course-pages/exam-practice.md) "Practice R Exam - Human wildlife incidents"
  (`Practice Questions/ENVRSUST 9014 R Practice Exam.pdf`). The exam sheet: "Each row in the [animals] dataset is a
  recorded incident with a different species"; the incidents file "has staff hours across years according to incident
  type". Questions in [../course/assessments.md](../course/assessments.md#practice-r-exam-human-wildlife-incidents).

## Animals-involved file

| Column | dtype | Non-null | Unique | Example values | Notes |
|---|---|---|---|---|---|
| `Incident Number` | object | 103,310 | 87,068 | `BAN2010-0003` | repeats when several species are involved |
| `Incident Date` | object | 103,310 | 5,036 | `2010-01-01` | ISO `YYYY-MM-DD` |
| `Field Unit` | object | 103,310 | 32 | `Banff Field Unit`, `Jasper Field Unit` | |
| `Protected Heritage Area` | object | 103,310 | 68 | `Banff National Park of Canada` | |
| `Incident Type` | object | 103,310 | 9 | `Human Wildlife Interaction`, `Rescued/Recovered/Found Wildlife`, `Attractant`, `Domestic Animal` | |
| `Species Common Name` | object | 101,040 | 358 | `Coyote`, `Elk`, `Wolf`, `Unknown`, `unknown duck` | 2,270 blank |
| `Sum of Number of Animals` | int64 | 103,310 | 122 | 2, 1, 0 | 0-2,001 |
| `Animal Health Status` | object | 53,738 | 10 | `Healthy`, `Dead`, `Not Located`, `Injured` | |
| `Cause of Animal Health Status` | object | 18,485 | 18 | `Predation`, `Collision` | |
| `Animal Behaviour` | object | 63,966 | 26 | `Avoidance`, `Physical or Aggressive Display` | |
| `Reason for Animal Behaviour` | object | 40,988 | 21 | `Surprise`, `Habituation` | |
| `Animal Attractant` | object | 35,961 | 22 | `Prey animal (natural)`, `Human food` | |
| `Deterrents Used` | object | 27,335 | 31 | `Presence of Officer/Person`, `Lethal Round - Rimfire` | blank = none recorded |
| `Animal Response to Deterrents` | object | 19,092 | 10 | `Retreat - Run`, `Indifferent` | |

## Incidents file

| Column | dtype | Non-null | Unique | Example values | Notes |
|---|---|---|---|---|---|
| `Incident Number` | object | 87,789 | 87,789 | `BAN2010-0003` | unique key |
| `Incident Date` | object | 87,789 | 5,041 | `1/1/2010` | US `M/D/YYYY` - different from the animals file |
| `Field Unit` | object | 87,789 | 32 | | |
| `Protected Heritage Area` | object | 87,789 | 68 | | |
| `Public Latitude`, `Public Longitude` | float64 | 86,869 | ~80,000 | 51.170147, -115.590447 | some invalid (lat -0.011) |
| `In Park` | object | 87,789 | 2 | `Within the Park`, `Outside the Park` | |
| `Incident Type` | object | 87,789 | 9 | | |
| `Sum of Total Staff Involved` | float64 | 87,778 | 24 | 1.0 | |
| `Sum of Total Staff Hours` | float64 | 87,789 | 1,253 | 2.33 | max 2,400 (outlier) |

## Data-quality issues

1. **"Unknown" vs "unknown <taxon>"**: the exam says remove `Unknown` but keep names like `unknown duck`,
   `unknown mollusk` - filter with exact equality (`Species Common Name != "Unknown"`), not pattern matching, and
   also drop blanks if required.
2. **Different date formats** between the two files: `ymd()` for animals, `mdy()` for incidents; derive `year` with
   `year()`.
3. **Duplicate incident numbers** in the animals file (one row per species) - count incidents with
   `n_distinct(\`Incident Number\`)` when the question is about incidents.
4. **Wide years:** Q3 pivots years to columns (headers such as `2013` need backticks in R).
5. **Headers with spaces** - use backticks or `clean_names()`.
6. Coordinates with near-zero/invalid values; filter before mapping.

## Course procedures that use it

R: `read_csv`, `filter`, `mutate(year(...))`, `group_by`/`summarize`, `arrange`/`head` (top five species),
`%in%`, `pivot_wider`/`pivot_longer`, `ggplot` (`geom_col`, `geom_line`), `ggsave`.
