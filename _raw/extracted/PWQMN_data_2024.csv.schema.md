# PWQMN_data_2024.csv

rows: 112392  columns: 15

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| _id | int64 | 112392 | 112392 | 1, 2, 3, 4 |
| Year | int64 | 112392 | 1 | 2024 |
| Collection Site | int64 | 112392 | 435 | 13000300102, 13001100202, 13001101002, 8012305202 |
| Analyte | object | 112392 | 55 | Potassium, Molybdenum, Bismuth, Chromium |
| Collected | object | 112392 | 168 | 08/14/2024, 05/09/2024, 05/16/2024, 04/11/2024 |
| Collection_Time | object | 112392 | 522 | 13:12:00, 14:37:00, 14:56:00, 11:41:00 |
| Lab Workorder ID | int64 | 112392 | 537 | 16860, 15342, 15449, 14979 |
| Lab Sample ID | int64 | 112392 | 3713 | 16860001, 16860003, 16860004, 15342003 |
| Results | object | 112392 | 5229 | 0.54, <2, <5, <1 |
| Units | object | 108723 | 8 | mg/L, µg/L, mg/L as CaCO3, µS/cm |
| Result Call | object | 112392 | 2 | Detected, BDL |
| Detection Limit | float64 | 108506 | 50 | 0.02, 2.0, 5.0, 1.0 |
| Method | object | 112392 | 17 | E3497, E3218, E3364, E3558 |
| Value Qualifier | object | 30119 | 1 | < |
| Remark Code | object | 297 | 12 | X5, RRV, X2, AHS |

Numeric summary:
```
                     count          mean           std           min           25%           50%           75%           max
_id               112392.0  5.619650e+04  3.244492e+04  1.000000e+00  2.809875e+04  5.619650e+04  8.429425e+04  1.123920e+05
Year              112392.0  2.024000e+03  0.000000e+00  2.024000e+03  2.024000e+03  2.024000e+03  2.024000e+03  2.024000e+03
Collection Site   112392.0  1.016775e+10  5.798760e+09  1.010400e+09  6.002400e+09  8.012303e+09  1.700210e+10  1.900640e+10
Lab Workorder ID  112392.0  1.641172e+04  1.212982e+03  1.394100e+04  1.540600e+04  1.633400e+04  1.744000e+04  1.880100e+04
Lab Sample ID     112392.0  1.641173e+07  1.212982e+06  1.394100e+07  1.540600e+07  1.633401e+07  1.744000e+07  1.880100e+07
Detection Limit   108506.0  1.500000e+00  3.502000e+00  1.000000e-03  5.000000e-02  5.000000e-01  2.000000e+00  1.800000e+02
```

First 5 rows:
```
   _id  Year  Collection Site     Analyte   Collected Collection_Time  Lab Workorder ID  Lab Sample ID Results Units Result Call  Detection Limit Method Value Qualifier Remark Code
0    1  2024      13000300102   Potassium  08/14/2024        13:12:00             16860       16860001    0.54  mg/L    Detected             0.02  E3497             NaN         NaN
1    2  2024      13000300102  Molybdenum  08/14/2024        13:12:00             16860       16860001      <2  µg/L         BDL             2.00  E3497               <         NaN
2    3  2024      13001100202     Bismuth  08/14/2024        14:37:00             16860       16860003      <5  µg/L         BDL             5.00  E3497               <         NaN
3    4  2024      13001100202    Chromium  08/14/2024        14:37:00             16860       16860003      <1  µg/L         BDL             1.00  E3497               <         NaN
4    5  2024      13001101002      Copper  08/14/2024        14:56:00             16860       16860004       1  µg/L    Detected             0.50  E3497             NaN         NaN
```