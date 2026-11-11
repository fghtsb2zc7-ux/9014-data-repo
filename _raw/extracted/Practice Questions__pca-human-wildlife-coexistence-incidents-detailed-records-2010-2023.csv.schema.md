# Practice Questions/pca-human-wildlife-coexistence-incidents-detailed-records-2010-2023.csv

rows: 87789  columns: 10

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| Incident Number | object | 87789 | 87789 | BAN2010-0003, JNP2010-0011, JNP2010-0015, JNP2010-0023 |
| Incident Date | object | 87789 | 5041 | 1/1/2010, 1/2/2010, 1/3/2010, 1/4/2010 |
| Field Unit | object | 87789 | 32 | Banff Field Unit, Jasper Field Unit, Lake Louise, Yoho and Kootenay Field Uni, Coastal British Columbia Field Unit |
| Protected Heritage Area | object | 87789 | 68 | Banff National Park of Canada, Jasper National Park of Canada, Pacific Rim National Park Reserve of Can, Prince Albert National Park of Canada |
| Public Latitude | float64 | 86869 | 79547 | 51.170147, 53.145774, 53.050538, 52.872375 |
| Public Longitude | float64 | 86869 | 81409 | -115.590447, -117.987138, -118.069145, -118.086049 |
| In Park | object | 87789 | 2 | Within the Park, Outside the Park |
| Incident Type | object | 87789 | 9 | Human Wildlife Interaction, Rescued/Recovered/Found Wildlife, Attractant, Domestic Animal |
| Sum of Total Staff Involved | float64 | 87778 | 24 | 1.0, 2.0, 3.0, 4.0 |
| Sum of Total Staff Hours | float64 | 87789 | 1253 | 2.33, 1.0, 2.5, 3.0 |

Numeric summary:
```
                               count     mean     std      min      25%      50%      75%       max
Public Latitude              86869.0   51.440   2.091   -0.011   51.164   51.313   52.873    81.814
Public Longitude             86869.0 -113.903  11.842 -140.456 -118.065 -116.183 -115.544   -52.605
Sum of Total Staff Involved  87778.0    1.468   1.006    0.000    1.000    1.000    2.000    32.000
Sum of Total Staff Hours     87789.0    2.282  12.587    0.000    0.500    1.000    2.000  2400.000
```

First 5 rows:
```
  Incident Number Incident Date         Field Unit         Protected Heritage Area  Public Latitude  Public Longitude          In Park                     Incident Type  Sum of Total Staff Involved  Sum of Total Staff Hours
0    BAN2010-0003      1/1/2010   Banff Field Unit   Banff National Park of Canada        51.170147       -115.590447  Within the Park        Human Wildlife Interaction                          1.0                      2.33
1    JNP2010-0011      1/1/2010  Jasper Field Unit  Jasper National Park of Canada        53.145774       -117.987138  Within the Park  Rescued/Recovered/Found Wildlife                          1.0                      1.00
2    JNP2010-0015      1/1/2010  Jasper Field Unit  Jasper National Park of Canada        53.050538       -118.069145  Within the Park                        Attractant                          1.0                      2.50
3    JNP2010-0023      1/1/2010  Jasper Field Unit  Jasper National Park of Canada        52.872375       -118.086049  Within the Park  Rescued/Recovered/Found Wildlife                          1.0                      3.00
4    JNP2010-0016      1/2/2010  Jasper Field Unit  Jasper National Park of Canada        52.861034       -118.111339  Within the Park  Rescued/Recovered/Found Wildlife                          1.0                      0.50
```