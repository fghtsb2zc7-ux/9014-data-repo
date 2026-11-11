# Practice sets/Practice set #2/Nombre_crabe_crab_number.csv

rows: 1755  columns: 16

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| date | object | 1755 | 202 | 1997-09-04, 1997-09-13, 1997-09-11, 1997-09-07 |
| st | object | 1755 | 56 | 5, 2, 16, 34 |
| tr | int64 | 1755 | 4 | 1, 2, 3, 4 |
| bat | object | 1755 | 3 | C, L, M |
| com | float64 | 1663 | 98 | 34.0, 40.0, 35.0, 41.0 |
| non.com | float64 | 1647 | 165 | 14.0, 15.0, 24.0, 18.0 |
| m50 | float64 | 944 | 79 | 0.0, 4.0, 3.0, 8.0 |
| m.tot | float64 | 1755 | 231 | 67.0, 40.0, 59.0, 58.0 |
| f | float64 | 848 | 172 | 242.0, 532.0, 144.0, 133.0 |
| f50 | float64 | 832 | 70 | 0.0, 5.0, 3.0, 1.0 |
| f.tot | float64 | 1754 | 271 | 180.0, 246.0, 220.0, 254.0 |
| ind | float64 | 749 | 2 | 0.0, 1.0 |
| ind50 | float64 | 752 | 7 | 0.0, 1.0, 2.0, 74.0 |
| n.tot | float64 | 1755 | 385 | 247.0, 286.0, 279.0, 312.0 |
| comm | object | 834 | 73 | une femelle oeuvee dans les femelles, 1 crabe araignée, mesure, mesure; une femelle oeuvée dans le f |
| comm_EN | object | 834 | 71 | a berried female in the females, 1 spider crab, measure, measure; a female berried in the f |

Numeric summary:
```
          count     mean      std  min   25%   50%    75%     max
tr       1755.0    1.329    0.501  1.0   1.0   1.0    2.0     4.0
com      1663.0   24.978   19.101  0.0  10.0  22.0   35.0   162.0
non.com  1647.0   30.810   68.992  0.0   5.0  16.0   36.5  2255.0
m50       944.0    9.399   21.820  0.0   0.0   2.0    9.0   325.0
m.tot    1755.0   60.926   79.595  0.0  21.0  45.0   78.0  2310.0
f         848.0   37.455   66.969  0.0   2.0  10.0   40.0   533.0
f50       832.0    7.373   21.080  0.0   0.0   1.0    5.0   279.0
f.tot    1754.0   58.030   79.166  0.0   5.0  25.0   83.0   732.0
ind       749.0    0.003    0.052  0.0   0.0   0.0    0.0     1.0
ind50     752.0    0.245    3.595  0.0   0.0   0.0    0.0    74.0
n.tot    1755.0  119.029  127.728  0.0  34.0  85.0  167.0  2480.0
```

First 5 rows:
```
         date  st  tr bat  com  non.com  m50  m.tot   f  f50  f.tot  ind  ind50  n.tot                                  comm                          comm_EN
0  1997-09-04   5   1   C  NaN      NaN  NaN   67.0 NaN  NaN  180.0  NaN    NaN  247.0                                   NaN                              NaN
1  1997-09-04   5   2   C  NaN      NaN  NaN   40.0 NaN  NaN  246.0  NaN    NaN  286.0                                   NaN                              NaN
2  1997-09-04   2   1   C  NaN      NaN  NaN   59.0 NaN  NaN  220.0  NaN    NaN  279.0                                   NaN                              NaN
3  1997-09-04   2   2   C  NaN      NaN  NaN   58.0 NaN  NaN  254.0  NaN    NaN  312.0  une femelle oeuvee dans les femelles  a berried female in the females
4  1997-09-04  16   1   C  NaN      NaN  NaN   50.0 NaN  NaN  183.0  NaN    NaN  233.0                                   NaN                              NaN
```