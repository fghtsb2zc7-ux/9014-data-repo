# Class 1/NPRI data.zip (zip, 5 entries)

| member | bytes |
|---|---|
| NPRI-INRP_ReleasesRejets_1993-present.csv | 363063258 |
| NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv | 13651974 |
| NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv | 160114 |
| NPRI-INRP_CommentsCommentaires_1997-present.csv | 163830689 |
| NPRI-INRP_DataDonnées_2024.csv | 38762396 |

## NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv
rows: 23568  columns: 24

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| old and silver ore mining" | object | 23568 | 664 | Gold and silver ore mining, Butter, cheese, and dry and condensed da, Conventional oil and gas extraction, Granite mining and quarrying |
| Extraction de minerais d'or et d'argent | object | 23521 | 418 | Extraction de minerais d'or et d'argent, Fabrication de beurre, de fromage et de , Extraction de pétrole et de gaz par des , Extraction de granite |
| 8 | int64 | 23568 | 19 | 8, 11, 4, 15 |
| Mining and Quarrying | object | 23568 | 19 | Mining and Quarrying, Other Manufacturing, Conventional Oil and Gas extraction, Transportation Equipment Mfg. |
| Extraction minière et exploitation en carrière
 | object | 23568 | 19 | Extraction minière et exploitation en ca, Autres fabrication
, Extraction de pétrole par des méthodes c, Fabrication de matériel de transport
 |
| 4718 | float64 | 23550 | 292 | 4718.0, 4603.0, 4808.0, 1209.0 |
| Division No. 18 | object | 23550 | 237 | Division No. 18, Division No.  3, Division No.  8, Halifax |
| 4718090 | float64 | 23550 | 1623 | 4718090.0, 4603050.0, 4808038.0, 1209034.0 |
| Division No. 18, Unorganized | object | 23550 | 1595 | Division No. 18, Unorganized, Winkler, Ponoka County, Halifax |
| Unnamed: 9 | float64 | 7664 | 149 | 603.0, 205.0, 535.0, 835.0 |
|   | object | 23550 | 153 |  , Winkler, Halifax, Toronto |
| 4760 | float64 | 23550 | 76 | 4760.0, 4620.0, 4850.0, 1250.0 |
| Northern / Nord | object | 23550 | 75 | Northern / Nord, South Central / Centre sud, Red Deer, Halifax |
| S0J | object | 23567 | 1197 | S0J, R6W, T0C, B3T |
| 6 | float64 | 23567 | 16 | 6.0, 10.0, 9.0, 7.0 |
| Boreal Shield | object | 23567 | 16 | Boreal Shield, Prairie, Boreal Plain, Atlantic Maritime |
| Bouclier boréal | object | 23567 | 16 | Bouclier boréal, Prairies, Plaines boréales, Maritime de l'Atlantique |
| 6.1 | float64 | 23563 | 12 | 6.0, 5.0, 1.0, 7.0 |
| Western and Northern Hudson Bay Drainage Area | object | 23563 | 12 | Western and Northern Hudson Bay Drainage, Nelson River Drainage Area, Maritime Provinces Drainage Area, Great Slave Lake Drainage Area |
| Aire de drainage de l'ouest et du nord de la baie d'Hudson | object | 23563 | 12 | Aire de drainage de l'ouest et du nord d, Aire de drainage du fleuve Nelson, Aire de drainage des provinces Maritimes, Aire de drainage du Grand lac des Esclav |
| 0 | int64 | 23568 | 2 | 0, 1 |
| 0.1 | int64 | 23568 | 2 | 0, 1 |
| 0.2 | int64 | 23568 | 2 | 0, 1 |
| 0.3 | int64 | 23568 | 2 | 0, 1 |

Numeric summary:
```
              count         mean         std        min        25%        50%        75%        max
8           23568.0        6.947       4.968        1.0        4.0        4.0       11.0       19.0
4718        23550.0     4436.873     948.862     1001.0     3556.0     4805.0     4814.0     6208.0
4718090     23550.0  4436905.228  948858.791  1001234.0  3556043.5  4805031.0  4814003.0  6208098.0
Unnamed: 9   7664.0      623.878     180.443        1.0      535.0      541.0      806.0      995.0
4760        23550.0     4461.096     956.607     1010.0     3590.0     4820.0     4870.0     6210.0
6           23567.0        9.069       1.546        1.0        8.0        9.0       10.0       16.0
6.1         23563.0        4.962       2.086        1.0        3.0        5.0        7.0       12.0
0           23568.0        0.246       0.431        0.0        0.0        0.0        0.0        1.0
0.1         23568.0        0.165       0.371        0.0        0.0        0.0        0.0        1.0
0.2         23568.0        0.051       0.221        0.0        0.0        0.0        0.0        1.0
0.3         23568.0        0.206       0.404        0.0        0.0        0.0        0.0        1.0
```

First 5 rows:
```
                                                                                                                                                                                                                           old and silver ore mining"                                       Extraction de minerais d'or et d'argent   8                 Mining and Quarrying     Extraction minière et exploitation en carrière\r\n    4718  Division No. 18    4718090  Division No. 18, Unorganized  Unnamed: 9             4760                      Northern / Nord  S0J     6      Boreal Shield           Bouclier boréal  6.1  Western and Northern Hudson Bay Drainage Area  Aire de drainage de l'ouest et du nord de la baie d'Hudson  0  0.1  0.2  0.3
2013 25159 Golden Band Resources Inc.    Jolu Mill Site  2911 - D Cleveland Avenue North NaN SAKATOON SK S7K8A9 01-09-081-15-W2 B-003-C/074-A-1  56.003100 -104.281880 1983 212220                                         Gold and silver ore mining                                       Extraction de minerais d'or et d'argent   8                 Mining and Quarrying     Extraction minière et exploitation en carrière\r\n  4718.0  Division No. 18  4718090.0  Division No. 18, Unorganized         NaN           4760.0                      Northern / Nord  S0J   6.0      Boreal Shield           Bouclier boréal  6.0  Western and Northern Hudson Bay Drainage Area  Aire de drainage de l'ouest et du nord de la baie d'Hudson  0    0    0    0
     5576  Saputo Foods Ltd.             Winkler         235 Manitoba Road               NaN WINKLER  MB R6W4B2 09-33-002-04-W1 D-005-L/062-H-4  49.173100 -97.930800  1983 311515  Butter, cheese, and dry and condensed dairy product manufacturing  Fabrication de beurre, de fromage et de produits laitiers secs et concentrés  11                  Other Manufacturing                                 Autres fabrication\r\n  4603.0  Division No.  3  4603050.0                       Winkler       603.0  Winkler  4620.0           South Central / Centre sud  R6W  10.0            Prairie                  Prairies  5.0                     Nelson River Drainage Area                           Aire de drainage du fleuve Nelson  0    0    0    0
     19078 Suncor Energy E&P Partnership 07-02-043-05W5M NaN                             NaN BLUFFTON AB T0C0M0 02-02-043-05-W5 D-010-I/083-B-10 52.671900 -114.615300 1983 211113                                Conventional oil and gas extraction                   Extraction de pétrole et de gaz par des méthodes classiques   4  Conventional Oil and Gas extraction  Extraction de pétrole par des méthodes classiques\r\n  4808.0  Division No.  8  4808038.0                 Ponoka County         NaN           4850.0                             Red Deer  T0C   9.0       Boreal Plain          Plaines boréales  5.0                     Nelson River Drainage Area                           Aire de drainage du fleuve Nelson  0    0    0    0
     6099  GATEWAY MATERIALS LTD.        Quarry          160 Kearney Lake Road           NaN HALIFAX  NS B3M3P1 NaN             B-015-J/011-D-12 44.679062 -63.681752  1983 212314                                       Granite mining and quarrying                                                         Extraction de granite   8                 Mining and Quarrying     Extraction minière et exploitation en carrière\r\n  1209.0          Halifax  1209034.0                       Halifax       205.0  Halifax  1250.0                              Halifax  B3T   7.0  Atlantic Maritime  Maritime de l'Atlantique  1.0               Maritime Provinces Drainage Area                    Aire de drainage des provinces Maritimes  1    0    0    0
     16121 SemCams ULC                   Obed Battery    NaN                             NaN EDSON    AB NaN    05-31-054-22-W5 D-050-J/083-F-11 53.706600 -117.241000 1983 211113                                Conventional oil and gas extraction                   Extraction de pétrole et de gaz par des méthod
```

## NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv
(could not parse: No columns to parse from file)

## NPRI-INRP_DataDonnées_2024.csv
rows: 58780  columns: 66

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| ines à forêts mixtes" | object | 58678 | 16 | Plaines à forêts mixtes, Bouclier boréal, Prairies, Cordillère montagnarde |
| St. Lawrence Drainage Area | object | 58672 | 12 | St. Lawrence Drainage Area, Nelson River Drainage Area, Pacific Drainage Area, Great Slave Lake Drainage Area |
| Aire de drainage du Saint-Laurent | object | 58672 | 12 | Aire de drainage du Saint-Laurent, Aire de drainage du fleuve Nelson, Aire de drainage du Pacifique, Aire de drainage du Grand lac des Esclav |
| 43.758880000 | float64 | 58710 | 7519 | 43.75888, 45.0467, 43.6683, 49.9302 |
| -79.549430000 | float64 | 58710 | 7565 | -79.54943, -77.8322, -79.4444, -97.0258 |
| 3314 | int64 | 58780 | 144 | 3314, 3211, 3255, 3371 |
| Non-ferrous metal (except aluminum) production and processin | object | 58780 | 144 | Non-ferrous metal (except aluminum) prod, Sawmills and wood preservation, Paint, coating and adhesive manufacturin, Household and institutional furniture an |
| Production et transformation de métaux non ferreux (sauf l'a | object | 58780 | 144 | Production et transformation de métaux n, Scieries et préservation du bois, Fabrication de peintures, de revêtements, Fabrication de meubles de maison et d'ét |
| 331410 | int64 | 58780 | 312 | 331410, 321114, 325510, 337110 |
| Non-ferrous metal (except aluminum) smelting and refining | object | 58780 | 312 | Non-ferrous metal (except aluminum) smel, Wood preservation, Paint and coating manufacturing, Wood kitchen cabinet and counter top man |
| Fonte et affinage de métaux non ferreux (sauf l'aluminium) | object | 58780 | 312 | Fonte et affinage de métaux non ferreux , Préservation du bois, Fabrication de peintures et de revêtemen, Fabrication d'armoires et de comptoirs d |
| NA - D/F | object | 58780 | 246 | NA - 06, NA - M09, NA - M10, NA - 11 |
| Dioxins and furans - total | object | 58780 | 264 | Copper (and its compounds), PM10 - Particulate Matter <= 10 Micromet, PM2.5 - Particulate Matter <= 2.5 Microm, Nickel (and its compounds) |
| Dioxines et furannes - totales | object | 58780 | 264 | Cuivre (et ses composés), PM10 - Matière particulaire <= 10 microm, PM2,5 - Matière particulaire <= 2,5 micr, Nickel (et ses composés) |
| g TEQ | object | 58780 | 4 | tonnes, kg, grams, g TEQ |
| 0.000864000 | float64 | 30225 | 19497 | 5.371, 6.244, 5.631, 0.026 |
| Unnamed: 16 | float64 | 4881 | 3362 | 0.0, 1.7, 1.71, 0.012229 |
| Unnamed: 17 | float64 | 7393 | 5605 | 2.92, 2.6784, 0.02, 0.2998 |
| Unnamed: 18 | float64 | 569 | 207 | 0.0, 0.0223, 0.001904, 0.734 |
| Unnamed: 19 | float64 | 949 | 624 | 2.53, 0.05, 0.04, 1.91 |
| 0.000864000.1 | float64 | 50647 | 31994 | 5.371, 6.244, 5.631, 0.026 |
| Unnamed: 21 | float64 | 2409 | 2103 | 0.0105, 6.5673, 7.0824, 0.6439 |
| Unnamed: 22 | float64 | 137 | 126 | 0.2, 0.1522, 0.242, 0.0164 |
| Unnamed: 23 | float64 | 48 | 46 | 0.343, 0.02012, 0.0655, 0.615 |
| Unnamed: 24 | float64 | 2471 | 2152 | 0.0105, 6.5673, 7.0824, 0.6439 |
| Unnamed: 25 | object | 2553 | 313 | Fraser River, St. Lawrence River, Saint Lawrence River, Detroit River |
| Unnamed: 26 | object | 2553 | 313 | Fraser River, St. Lawrence River, Saint Lawrence River, Detroit River |
| Unnamed: 27 | float64 | 204 | 167 | 0.0, 0.003018, 0.003261, 0.006047 |
| Unnamed: 28 | float64 | 19 | 11 | 0.0, 34.766, 124.471, 3.388 |
| Unnamed: 29 | float64 | 161 | 149 | 116.43, 192.17, 35.46, 141.89 |
| Unnamed: 30 | float64 | 372 | 321 | 116.43, 192.17, 35.46, 141.89 |
| 0.000864000.2 | float64 | 36971 | 24377 | 5.371, 6.244, 5.631, 0.026 |
| Unnamed: 32 | float64 | 2008 | 1766 | 21.38, 79.21, 2.14, 0.3462 |
| 0.000864000.3 | float64 | 42024 | 24722 | 5.371, 6.244, 5.631, 0.026 |
| Unnamed: 34 | float64 | 679 | 627 | 33.3662, 6.0415, 4.2084, 26.7635 |
| Unnamed: 35 | float64 | 177 | 137 | 14.29, 28.29, 71.09, 7.45 |
| Unnamed: 36 | float64 | 484 | 456 | 0.032367, 60513.512476, 251.90432, 0.021822 |
| Unnamed: 37 | float64 | 1151 | 1103 | 737.4, 159.8, 798.86, 0.064 |
| Unnamed: 38 | float64 | 370 | 351 | 1215.331, 9635.985, 7304.365, 146.5 |
| Unnamed: 39 | float64 | 2494 | 2359 | 33.3662, 6.0415, 4.2084, 26.7635 |
| Unnamed: 40 | float64 | 2456 | 2180 | 1.23, 0.124331, 16.33, 0.0642 |
| Unnamed: 41 | float64 | 588 | 575 | 44.143, 4.7272, 7.1654, 13.4153 |
| Unnamed: 42 | float64 | 470 | 419 | 0.0006, 0.00036, 0.00099, 4.102 |
| Unnamed: 43 | float64 | 520 | 485 | 3.352, 2.623, 5.936, 2.249 |
| Unnamed: 44 | float64 | 37 | 36 | 0.3, 227.0, 1.0, 0.748374 |
| Unnamed: 45 | float64 | 7 | 7 | 25412.7, 46.44, 0.787, 1.29 |
| Unnamed: 46 | float64 | 3553 | 3139 | 44.143, 1.23, 0.124331, 3.352 |
| Unnamed: 47 | float64 | 590 | 554 | 0.010649, 0.006425, 0.017689, 0.003 |
| Unnamed: 48 | float64 | 642 | 605 | 0.407516, 0.171177, 0.207856, 0.00245 |
| Unnamed: 49 | float64 | 132 | 126 | 0.36, 0.3, 5.1, 29.8 |
| Unnamed: 50 | float64 | 790 | 701 | 0.882, 0.125, 0.031, 0.82 |
| Unnamed: 51 | float64 | 575 | 502 | 19.712, 7.88, 77.5244, 1e-05 |
| Unnamed: 52 | float64 | 2331 | 2015 | 0.882, 0.125, 0.031, 0.82 |
| Unnamed: 53 | float64 | 6688 | 5915 | 0.882, 0.125, 0.031, 0.82 |
| Unnamed: 54 | float64 | 344 | 312 | 388.0, 72.0, 5.494, 188.94167 |
| Unnamed: 55 | float64 | 331 | 301 | 0.4409, 8.5, 5.7, 26.3 |
| Unnamed: 56 | float64 | 483 | 445 | 71.4, 0.005476, 0.003305, 0.009097 |
| Unnamed: 57 | float64 | 1067 | 1014 | 158.176, 1.295, 38018.58, 274.484 |
| Unnamed: 58 | float64 | 77 | 70 | 3.948, 7.6, 22.8, 28.9 |
| Unnamed: 59 | float64 | 17 | 17 | 661.08, 0.37, 56.439, 10931.0 |
| Unnamed: 60 | float64 | 56 | 53 | 4.9545, 1284.5, 4.5875, 0.1805 |
| Unnamed: 61 | float64 | 103 | 102 | 18.37, 2.609, 14.39, 2.94 |
| Unnamed: 62 | float64 | 455 | 419 | 0.04121, 0.024865, 0.068454, 36.0 |
| Unnamed: 63 | float64 | 537 | 484 | 5.04, 4.2, 2.652, 6.92 |
| Unnamed: 64 | float64 | 2896 | 2617 | 158.176, 1.295, 38018.58, 274.484 |
| 0.000864000.4 | float64 | 58780 | 37303 | 163.547, 6.244, 5.631, 1.321 |

Numeric summary:
```
                 count        mean          std         min         25%         50%         75%           max
43.758880000   58710.0      50.951        4.439      42.036      47.894      51.800      54.275  8.249900e+01
-79.549430000  58710.0    -102.758       18.454    -140.884    -116.087    -111.642     -81.076 -4.813400e+01
3314           58780.0    2715.970      948.668    1111.000    2111.000    2111.000    3251.000  9.139000e+03
331410         58780.0  271615.899    94871.018  111120.000  211110.000  211141.000  325189.000  9.139100e+05
0.000864000    30225.0      71.842      954.962       0.000       0.244       1.645      18.000  8.261329e+04
Unnamed: 16     4881.0      19.316      134.195       0.000       0.002       0.245       3.860  6.079360e+03
Unnamed: 17     7393.0      47.442      470.339       0.000       0.021       0.537       5.940  1.898472e+04
Unnamed: 18      569.0       0.722        4.634       0.000       0.000       0.000       0.008  5.849800e+01
Unnamed: 19      949.0      23.664      159.844       0.000       0.004       0.410       4.164  3.588797e+03
0.000864000.1  50647.0      55.706      789.128       0.000       0.143       1.562      11.245  8.427691e+04
Unnamed: 21     2409.0     157.039     2633.342       0.000       0.072       2.289      21.690  1.251594e+05
Unnamed: 22      137.0       9.266       25.638       0.000       0.074       0.608       4.149  1.930300e+02
Unnamed: 23       48.0       2.115       13.523       0.000       0.001       0.006       0.034  9.375800e+01
Unnamed: 24     2471.0     153.654     2600.304       0.000       0.059       2.096      20.958  1.251594e+05
Unnamed: 27      204.0       0.284        1.482       0.000       0.000       0.002       0.032  1.717100e+01
Unnamed: 28       19.0      13.463       29.335       0.000       0.000       0.002      16.169  1.244710e+02
Unnamed: 29      161.0     771.730     2280.353       0.000       1.565      37.000     192.170  1.417611e+04
Unnamed: 30      372.0     334.845     1545.534       0.000       0.001       0.069      27.174  1.417611e+04
0.000864000.2  36971.0      85.035     1147.955       0.000       0.210       1.798      20.145  1.251688e+05
Unnamed: 32     2008.0     161.582     1180.037       0.000       0.483       3.572      20.431  2.720141e+04
0.000864000.3  42024.0      82.531     1121.743       0.000       0.030       1.090      15.646  1.251688e+05
Unnamed: 34      679.0    9385.890   135933.038       0.000       0.698      13.240      96.320  3.386282e+06
Unnamed: 35      177.0     236.248     1078.739       0.000       0.249      19.607      56.015  1.162621e+04
Unnamed: 36      484.0     767.810     5760.811       0.000       0.301      13.059      76.152  9.934217e+04
Unnamed: 37     1151.0   49940.406   501917.607  -38843.441      63.150     480.314    4625.084  1.427743e+07
Unnamed: 38      370.0   88204.969   773256.889 -305917.944      37.258     673.000    6275.688  1.374524e+07
Unnamed: 39     2494.0   38854.732   576296.356  -72258.444       8.570      83.060    1036.548  2.047723e+07
Unnamed: 40     2456.0    1284.699    23732.804       0.000       0.061       1.270      14.245  1.087515e+06
Unnamed: 41      588.0     114.517     1034.964       0.000       2.812      13.501      47.840  2.420000e+04
Unnamed: 42      470.0     370.572     6876.164       0.000       0.023       0.406       4.647  1.486738e+05
Unnamed: 43      520.0      89.392      915.485       0.000       0.020       0.225       4.965  1.993240e+04
Unnamed: 44       37.0   13883.669    65365.689       0.010       1.000      32.080     314.620  3.930420e+05
Unnamed: 45        7.0    3643.977     9599.127       0.568       1.038       2.193      45.150  2.541270e+04
Unnamed: 46     3553.0    1120.859    21034.036       0.000       0.100       2.090      23.136  1.087515e+06
Unnamed: 47      590.0     779.979    12293.467       0.000       0.019       0.322       4.230  2.910892e+05
Unnamed: 48      642.0    1186.785    13926.105       0.000       0.063       0.958      15.838  2.984058e+05
Unnamed: 49      132.0      72.690      561.199       0.000       0.206       1.522      12.266  6.368608e+03
Unnamed: 50      790.0     435.988     4702.115       0.000       0.107       2.261      18.996  1.197140e+05
Unnamed: 51      575.0     170.125     2624.632       0.000       0.015       0.442      20.662  6.150533e+04
Unnamed: 52     2331.0     718.126    10345.945       0.000       0.052       0.976      17.934  2.984058e+05
Unnamed: 53     6688.0   15334.938   352738.607  -72258.444       0.520      12.970     128.932  2.047723e+07
Unnamed: 54      344.0      35.930      143.151       0.000       0.054       1.231       9.978  1.392132e+03
Unnamed: 55      331.0      36.597      228.290       0.000       0.396       2.692      11.060  2.976768e+03
Unnamed: 56      483.0     163.732     1485.492       0.000       0.010       0.478      12.612  2.193284e+04
Unnamed: 57     1067.0   35143.902  1041882.650       0.000       2.384      12.266      74.058  3.401670e+07
Unnamed: 58       77.0     244.805      985.900       0.000       0.011       0.523      28.900  7.010000e+03
Unnamed: 59       17.0    8155.832    15474.199       0.370      56.439     405.000   10931.000  4.925200e+04
Unnamed: 60       56.0     273.480      617.120       0.001       0.177       9.620     166.331  3.728909e+03
Unnamed: 61      103.0      29.271       81.619       0.002       1.627       7.040      22.757  7.562270e+02
Unnamed: 62      455.0     123.058      764.242       0.000       0.272       5.720      43.339  1.508097e+04
Unnamed: 63      537.0     381.553     5593.201       0.000       0.029       0.502      16.000  1.288400e+05
Unnamed: 64     2896.0   13134.949   632456.969       0.000       0.649       7.218      43.820  3.401670e+07
0.000864000.4  58780.0    2454.052   184093.998  -72249.919       0.124       1.860      17.699  3.401670e+07
```

First 5 rows:
```
                                                                                                                       ines à forêts mixtes"  St. Lawrence Drainage Area  Aire de drainage du Saint-Laurent  43.758880000  -79.549430000  3314  Non-ferrous metal (except aluminum) production and processing  Production et transformation de métaux non ferreux (sauf l'aluminium)  331410  Non-ferrous metal (except aluminum) smelting and refining  Fonte et affinage de métaux non ferreux (sauf l'aluminium)  NA - D/F                     Dioxins and furans - total                   Dioxines et furannes - totales   g TEQ  0.000864000  Unnamed: 16  Unnamed: 17  Unnamed: 18  Unnamed: 19  0.000864000.1  Unnamed: 21  Unnamed: 22  Unnamed: 23  Unnamed: 24 Unnamed: 25 Unnamed: 26  Unnamed: 27  Unnamed: 28  Unnamed: 29  Unnamed: 30  0.000864000.2  Unnamed: 32  0.000864000.3  Unnamed: 34  Unnamed: 35  Unnamed: 36  Unnamed: 37  Unnamed: 38  Unnamed: 39  Unnamed: 40  Unnamed: 41  Unnamed: 42  Unnamed: 43  Unnamed: 44  Unnamed: 45  Unnamed: 46  Unnamed: 47  Unnamed: 48  Unnamed: 49  Unnamed: 50  Unnamed: 51  Unnamed: 52  Unnamed: 53  Unnamed: 54  Unnamed: 55  Unnamed: 56  Unnamed: 57  Unnamed: 58  Unnamed: 59  Unnamed: 60  Unnamed: 61  Unnamed: 62  Unnamed: 63  Unnamed: 64  0.000864000.4
2024 455 Ingot Metal Co. Ltd. INGOT METAL COMPANY LIMITED Weston Toronto Toronto Toronto ON M9L 1M3 Mixedwood Plain  Plaines à forêts mixtes  St. Lawrence Drainage Area  Aire de drainage du Saint-Laurent      43.75888      -79.54943  3314  Non-ferrous metal (except aluminum) production and processing  Production et transformation de métaux non ferreux (sauf l'aluminium)  331410  Non-ferrous metal (except aluminum) smelting and refining  Fonte et affinage de métaux non ferreux (sauf l'aluminium)   NA - 06                     Copper (and its compounds)                         Cuivre (et ses composés)  tonnes        5.371          NaN          NaN          NaN          NaN          5.371          NaN          NaN          NaN          NaN         NaN         NaN          NaN          NaN          NaN          NaN          5.371          NaN          5.371          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN      158.176          NaN          NaN          NaN          NaN          NaN          NaN      158.176        163.547
                                                                                                    Mixedwood Plain  Plaines à forêts mixtes  St. Lawrence Drainage Area  Aire de drainage du Saint-Laurent      43.75888      -79.54943  3314  Non-ferrous metal (except aluminum) production and processing  Production et transformation de métaux non ferreux (sauf l'aluminium)  331410  Non-ferrous metal (except aluminum) smelting and refining  Fonte et affinage de métaux non ferreux (sauf l'aluminium)  NA - M09    PM10 - Particulate Matter <= 10 Micrometers    PM10 - Matière particulaire <= 10 micromètres  tonnes        6.244          NaN          NaN          NaN          NaN          6.244          NaN          NaN          NaN          NaN         NaN         NaN          NaN          NaN          NaN          NaN          6.244          NaN          6.244          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          NaN          6.244
                                                                                                    Mixedwood Plain  Plaines à forêts mixtes  St. Lawre
```