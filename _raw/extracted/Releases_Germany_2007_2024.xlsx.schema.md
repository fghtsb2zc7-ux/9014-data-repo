# Releases_Germany_2007_2024.xlsx

Sheets: ['Releases_Germany_2007_2024']


## Sheet: Releases_Germany_2007_2024

rows: 79844  columns: 34

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| Releases_202610011155.ID1 | int64 | 79844 | 79844 | 1, 2, 3, 4 |
| Releases_202610011155.id | int64 | 79844 | 79844 | 1, 2, 3, 4 |
| facility_id | int64 | 79844 | 29558 | 62, 63, 64, 65 |
| Releases_202610011155.inspire_id | object | 79844 | 2960 | DE.BW/00093.FACILITY, DE.BW/00094.FACILITY, DE.BW/00099.FACILITY, DE.BW/00101.FACILITY |
| Releases_202610011155.year | int64 | 79844 | 18 | 2007, 2008, 2009, 2010 |
| compartment | object | 79844 | 3 | Water, Air, Land |
| annual_load | float64 | 79811 | 9413 | 53600.0, 114000.0, 51100.0, 103000.0 |
| annual_load_accident | float64 | 52430 | 512 | 0.0, 3160.0, 10.0, 664000.0 |
| unit | object | 79844 | 1 | kg/a |
| pollutant_name | object | 79811 | 74 | Total organic carbon (TOC), Total nitrogen, Carbon monoxide (CO), Arsenic and compounds (as As) |
| pollutant_group | object | 79811 | 7 | Other organic substances, Inorganic substances, Other gases, Heavy metals |
| pollutant_casnumber | object | 28739 | 40 | 630-08-0, 124-38-9, 1336-36-3, 7664-41-7 |
| pollutant_threshold | object | 79811 | 43 | 50 000 kg/year (Water), 500 000 kg/year (Air), 5 kg/year (Water), 20 kg/year (Water) |
| determination_method | object | 79811 | 3 | Measured (M), Calculated (C), Estimated (E) |
| determination_procedure | object | 79257 | 24 | OTH (M), INT (M) CEN/ISO, INT (C) IPCC, OTH (C) |
| Facilities_202610011143.ID1 | int64 | 79844 | 29558 | 62, 63, 64, 65 |
| Facilities_202610011143.id | int64 | 79844 | 29558 | 62, 63, 64, 65 |
| Facilities_202610011143.inspire_id | object | 79844 | 2960 | DE.BW/00093.FACILITY, DE.BW/00094.FACILITY, DE.BW/00099.FACILITY, DE.BW/00101.FACILITY |
| Facilities_202610011143.year | int64 | 79844 | 18 | 2007, 2008, 2009, 2010 |
| name | object | 79790 | 5725 | GKA Baden-Baden-Sinzheim Stadt Baden-Bad, GKA Baden-Baden-Sinzheim, KLA GKA BADEN-BADEN-SINZHEIM, KA Wendlingen a. N. |
| administrative_number | object | 79808 | 2918 | 06-08-2165100000006, 06-08-2328739, 06-08-34077528, 06-08-34077594 |
| ETRS89_x | float64 | 79808 | 6658 | 8.160969879, 9.381331366, 7.711587268, 7.582668552 |
| ETRS89_y | float64 | 79808 | 6659 | 48.78353209, 48.68495646, 48.18757234, 47.61490405 |
| street | object | 79675 | 3198 | Im GÃ¤bele, VorstadtstraÃŸe, Zum KlÃ¤rwerk, Alte StraÃŸe |
| house_number | object | 73643 | 535 | ohne, keine, 101, 120 |
| postcode | float64 | 79761 | 1731 | 76547.0, 73240.0, 79362.0, 79576.0 |
| city | object | 79761 | 1906 | Baden-Baden, Sinzheim, Wendlingen, Forchheim |
| federal_state | object | 79840 | 16 | bw, by, nw, bb |
| river_basin_district | object | 79418 | 10 | Rhein, Donau, Maas, Oder |
| parent_company | object | 79268 | 4887 | EB Umwelttechnik Stadt Baden-Baden Stadt, EB Umwelttechnik Stadt Baden-Baden, Zweckverband GKW Wendlingen, AZV Breisgauer Bucht |
| operating_hours | float64 | 1977 | 206 | 4000.0, 8760.0, 5832.0, 8784.0 |
| prtr_info | object | 860 | 174 | Homepage: http://www.gkw-wendlingen.de/s, keine, Die Deponie "Nevern" ist seit 1993 gesch, Die LMS Agrarberatung GmbH wurde mit der |
| nace_code | float64 | 79844 | 154 | 37.0, 16.21, 35.3, 35.11 |
| nace_text | object | 79844 | 142 | Sewerage, Manufacture of veneer sheets and wood-ba, Steam and air conditioning supply, Production of electricity |

Numeric summary:
```
                                count          mean           std       min        25%        50%         75%           max
Releases_202610011155.ID1     79844.0  3.992250e+04  2.304912e+04     1.000  19961.750  39922.500   59883.250  7.984400e+04
Releases_202610011155.id      79844.0  3.992250e+04  2.304912e+04     1.000  19961.750  39922.500   59883.250  7.984400e+04
facility_id                   79844.0  6.399592e+04  3.689211e+04    62.000  36373.000  67055.500   93682.000  1.292710e+05
Releases_202610011155.year    79844.0  2.015225e+03  5.130000e+00  2007.000   2011.000   2015.000    2020.000  2.024000e+03
annual_load                   79811.0  1.020967e+08  8.940830e+08     0.000    355.000  25500.000  313000.000  3.330000e+10
annual_load_accident          52430.0  4.948415e+03  4.011907e+05     0.000      0.000      0.000       0.000  6.990000e+07
Facilities_202610011143.ID1   79844.0  4.750369e+04  2.582343e+04    62.000  29418.000  50310.500   66839.000  9.410500e+04
Facilities_202610011143.id    79844.0  6.399592e+04  3.689211e+04    62.000  36373.000  67055.500   93682.000  1.292710e+05
Facilities_202610011143.year  79844.0  2.015225e+03  5.130000e+00  2007.000   2011.000   2015.000    2020.000  2.024000e+03
ETRS89_x                      79808.0  9.474000e+00  2.287000e+00     6.090      7.426      8.983      11.491  1.500100e+01
ETRS89_y                      79808.0  5.109100e+01  1.560000e+00    47.548     49.981     51.372      52.155  5.481400e+01
postcode                      79761.0  4.715424e+04  2.602797e+04  1067.000  27211.000  47166.000   66399.000  9.999800e+04
operating_hours                1977.0  8.733521e+03  4.556138e+03     0.000   8760.000   8760.000    8760.000  7.405000e+04
nace_code                     79844.0  2.852900e+01  1.238900e+01     1.460     20.140     35.110      37.000  9.609000e+01
```

First 5 rows:
```
   Releases_202610011155.ID1  Releases_202610011155.id  facility_id Releases_202610011155.inspire_id  Releases_202610011155.year compartment  annual_load  annual_load_accident  unit              pollutant_name           pollutant_group pollutant_casnumber     pollutant_threshold determination_method determination_procedure  Facilities_202610011143.ID1  Facilities_202610011143.id Facilities_202610011143.inspire_id  Facilities_202610011143.year                                                 name administrative_number  ETRS89_x   ETRS89_y      street house_number  postcode         city federal_state river_basin_district                                        parent_company  operating_hours prtr_info  nace_code nace_text
0                          1                         1           62             DE.BW/00093.FACILITY                        2007       Water      53600.0                   0.0  kg/a  Total organic carbon (TOC)  Other organic substances                 NaN  50 000 kg/year (Water)         Measured (M)                 OTH (M)                           62                          62               DE.BW/00093.FACILITY                          2007  GKA Baden-Baden-Sinzheim Stadt Baden-Baden-Sinzheim   06-08-2165100000006   8.16097  48.783532  Im GÃ¤bele          NaN   76547.0  Baden-Baden            bw                Rhein  EB Umwelttechnik Stadt Baden-Baden Stadt Baden-Baden              NaN       NaN       37.0  Sewerage
1                          2                         2           62             DE.BW/00093.FACILITY                        2007       Water     114000.0                   0.0  kg/a              Total nitrogen      Inorganic substances                 NaN  50 000 kg/year (Water)         Measured (M)                 OTH (M)                           62                          62               DE.BW/00093.FACILITY                          2007  GKA Baden-Baden-Sinzheim Stadt Baden-Baden-Sinzheim   06-08-2165100000006   8.16097  48.783532  Im GÃ¤bele          NaN   76547.0  Baden-Baden            bw                Rhein  EB Umwelttechnik Stadt Baden-Baden Stadt Baden-Baden              NaN       NaN       37.0  Sewerage
2                          3                         3           63             DE.BW/00093.FACILITY                        2008       Water      51100.0                   0.0  kg/a  Total organic carbon (TOC)  Other organic substances                 NaN  50 000 kg/year (Water)         Measured (M)                 OTH (M)                           63                          63               DE.BW/00093.FACILITY                          2008  GKA Baden-Baden-Sinzheim Stadt Baden-Baden-Sinzheim   06-08-2165100000006   8.16097  48.783532  Im GÃ¤bele         ohne   76547.0     Sinzheim            bw                Rhein  EB Umwelttechnik Stadt Baden-Baden Stadt Baden-Baden              NaN       NaN       37.0  Sewerage
3                          4                         4           63             DE.BW/00093.FACILITY                        2008       Water     103000.0                   0.0  kg/a              Total nitrogen      Inorganic substances                 NaN  50 000 kg/year (Water)         Measured (M)                 OTH (M)                           63                          63               DE.BW/00093.FACILITY                          2008  GKA Baden-Baden-Sinzheim Stadt Baden-Baden-Sinzheim   06-08-2165100000006   8.16097  48.783532  Im GÃ¤bele         ohne   76547.0     Sinzheim            bw                Rhein  EB Umwelttechnik Stadt Baden-Baden Stadt Baden-Baden              NaN       NaN       37.0  Sewerage
4                          5                         5           64             DE.BW/00093.FACILITY                        2009       Water      92200.0                   0.0  kg/a              Total nitrogen      Inorganic substances                 NaN  50 000 kg/year (Water)         Measured (M)         INT (M) CEN/ISO                           64       
```