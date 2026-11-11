# PWQMN_Stations.csv

rows: 2198  columns: 10

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| STATION | int64 | 2198 | 2188 | 3007703502, 3007703602, 3007703802, 3007703902 |
| NAME | object | 2198 | 842 | Uxbirdge Brook, Hawkestone Creek, Black River, Holland River |
| DESCRIPTION | object | 2198 | 2138 | Davis Drive,  Uxbridge Twp,, 11Th Ln,  Hawkestone,, High St,  Sutton,, Yonge St,  Holland Landing, |
| LATITUDE | float64 | 2198 | 2173 | 44.13775764, 44.49636189, 44.30473701, 44.09483164 |
| LONGITUDE | float64 | 2198 | 2170 | -79.11259961, -79.46684923, -79.36042573, -79.48995273 |
| STATUS | object | 2198 | 2 | A, I |
| FIRST_YEAR | int64 | 2198 | 55 | 2002, 1966, 1965, 1967 |
| LAST_YEAR | int64 | 2198 | 58 | 2021, 2002, 1991, 1995 |
| TOTAL_YEARS | int64 | 2198 | 58 | 20, 29, 26, 30 |
| MISS_YEARS | float64 | 2196 | 43 | 0.0, 8.0, 24.0, 1.0 |

Numeric summary:
```
              count          mean           std           min           25%           50%           75%           max
STATION      2198.0  1.067270e+10  5.997311e+09  1.000000e+09  6.007600e+09  9.000902e+09  1.700210e+10  1.900640e+10
LATITUDE     2198.0  4.489500e+01  1.902000e+00  4.201200e+01  4.367600e+01  4.429800e+01  4.583300e+01  5.465400e+01
LONGITUDE    2198.0 -8.029700e+01  3.231000e+00 -9.459200e+01 -8.128900e+01 -7.994900e+01 -7.896100e+01 -7.409400e+01
FIRST_YEAR   2198.0  1.977610e+03  1.275700e+01  1.964000e+03  1.968000e+03  1.973000e+03  1.983000e+03  2.022000e+03
LAST_YEAR    2198.0  1.991975e+03  6.256300e+01  0.000000e+00  1.979000e+03  1.995000e+03  2.005000e+03  2.021000e+03
TOTAL_YEARS  2198.0  1.450000e+01  1.452700e+01  1.000000e+00  3.000000e+00  9.000000e+00  2.100000e+01  5.800000e+01
MISS_YEARS   2196.0  2.679000e+00  6.043000e+00  0.000000e+00  0.000000e+00  0.000000e+00  2.000000e+00  4.500000e+01
```

First 5 rows:
```
      STATION              NAME                  DESCRIPTION   LATITUDE  LONGITUDE STATUS  FIRST_YEAR  LAST_YEAR  TOTAL_YEARS  MISS_YEARS
0  3007703502    Uxbirdge Brook  Davis Drive,  Uxbridge Twp,  44.137758 -79.112600      A        2002       2021           20         0.0
1  3007703602  Hawkestone Creek        11Th Ln,  Hawkestone,  44.496362 -79.466849      A        2002       2021           20         0.0
2  3007703802       Black River            High St,  Sutton,  44.304737 -79.360426      A        2002       2021           20         0.0
3  3007703902     Holland River  Yonge St,  Holland Landing,  44.094832 -79.489953      A        2002       2021           20         0.0
4  3007704002   Pefferlaw Brook    Pineview Crt,  Pefferlaw,  44.316734 -79.201379      A        2002       2021           20         0.0
```