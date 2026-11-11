# 04 - Lesson 4/Pre-class work/Power_Plants.csv

rows: 12008  columns: 34

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| X | float64 | 12008 | 11726 | -160.497222000225, -87.3568230001965, -88.0103000003302, -86.2830559999325 |
| Y | float64 | 12008 | 11657 | 55.3397220001981, 33.4586650002074, 31.0069000003425, 32.5838890002322 |
| OBJECTID | int64 | 12008 | 12008 | 11570, 11571, 11572, 11573 |
| Plant_Code | int64 | 12008 | 12008 | 1, 2, 3, 4 |
| Plant_Name | object | 12008 | 11985 | Sand Point, Bankhead Dam, Barry, Walter Bouldin Dam |
| Utility_ID | int64 | 12008 | 5123 | 63560, 195, 5701, 29305 |
| Utility_Name | object | 12004 | 5108 | TDX Sand Point Generating, LLC, Alabama Power Co, El Paso Electric Co, City of Madelia - (MN) |
| sector_name | object | 12008 | 7 | Electric Utility, IPP Non-CHP, Commercial Non-CHP, IPP CHP |
| Street_Address | object | 11920 | 11192 | 100 Power Plant Way, 19001 Lock 17 Road, North Highway 43, 750 Bouldin Dam Road |
| City | object | 11986 | 4870 | Sand Point, Northport, Bucks, Wetumpka |
| County | object | 11965 | 1440 | Aleutians East, Tuscaloosa, Mobile, Elmore |
| State | object | 12008 | 52 | Alaska, Alabama, Texas, Minnesota |
| Zip | float64 | 11990 | 6636 | 99661.0, 35476.0, 36512.0, 36092.0 |
| PrimSource | object | 12008 | 12 | petroleum, hydroelectric, natural gas, nuclear |
| source_desc | object | 12008 | 3952 | Petroleum = 1.3 MW, Wind = 0.4 MW, Hydroelectric = 53 MW, Coal = 1118.5 MW, Natural Gas = 1296.2 M, Hydroelectric = 224.1 MW |
| tech_desc | object | 12008 | 154 | Petroleum Liquids; Onshore Wind Turbine;, Conventional Hydroelectric, Conventional Steam Coal; Natural Gas Fir, Natural Gas Fired Combustion Turbine |
| Install_MW | float64 | 12008 | 2163 | 3.7, 53.9, 2569.5, 225.0 |
| Total_MW | float64 | 12008 | 2044 | 1.7, 53.0, 2414.7, 224.1 |
| Bat_MW | float64 | 461 | 113 | 25.0, 400.0, 18.9, 12.6 |
| Bio_MW | float64 | 657 | 246 | 50.0, 52.0, 17.7, 60.0 |
| Coal_MW | float64 | 237 | 220 | 1118.5, 832.0, 100.0, 296.0 |
| Geo_MW | float64 | 67 | 57 | 644.0, 31.7, 50.0, 9.0 |
| Hydro_MW | float64 | 1451 | 492 | 53.0, 224.1, 71.1, 48.0 |
| HydroPS_MW | float64 | 40 | 40 | 199.8, 119.0, 57.3, 30.0 |
| NG_MW | float64 | 2083 | 1122 | 1296.2, 63.0, 1256.1, 1020.0 |
| Nuclear_MW | float64 | 54 | 54 | 3661.7, 1065.0, 1225.0, 1151.0 |
| Crude_MW | float64 | 1112 | 333 | 1.3, 16.0, 10.6, 8.1 |
| Solar_MW | float64 | 5195 | 392 | 0.2, 19.8, 0.9, 0.3 |
| Wind_MW | float64 | 1320 | 592 | 0.4, 1.8, 5.5, 6.2 |
| Other_MW | float64 | 92 | 78 | 128.0, 0.9, 37.0, 18.8 |
| Source | object | 12008 | 1 | EIA-860, EIA-860M and EIA-923 |
| Period | int64 | 12008 | 1 | 202305 |
| Longitude | float64 | 12008 | 11726 | -160.497222, -87.356823, -88.0103, -86.283056 |
| Latitude | float64 | 12008 | 11657 | 55.339722, 33.458665, 31.0069, 32.583889 |

Numeric summary:
```
              count        mean        std         min         25%         50%         75%         max
X           12008.0     -93.559     18.403    -171.712    -106.506     -90.204     -77.942     -65.280
Y           12008.0      38.855      5.667      17.947      35.047      39.638      42.502      71.292
OBJECTID    12008.0   17573.500   3466.555   11570.000   14571.750   17573.500   20575.250   23577.000
Plant_Code  12008.0   47521.294  23578.130       1.000   50737.500   58686.500   62264.250   66730.000
Utility_ID  12008.0   43510.846  23632.798       7.000   16558.000   58158.000   61651.250   65738.000
Zip         11990.0   51843.394  32187.815     603.000   24184.500   54751.000   82163.500   99929.000
Install_MW  12008.0     105.567    312.174       0.300       2.100       6.300      57.725    6809.000
Total_MW    12008.0      97.685    290.287       0.000       2.000       6.000      52.500    7079.000
Bat_MW        461.0      21.115     47.681       0.200       1.900       4.500      14.000     409.000
Bio_MW        657.0      18.566     24.418       0.600       3.100       6.400      24.500     128.600
Coal_MW       237.0     787.795    734.294       0.000     131.300     561.600    1243.000    3200.000
Geo_MW         67.0      39.904     78.106       1.800      14.200      21.900      47.500     644.000
Hydro_MW     1451.0      55.238    243.906       0.000       2.300       6.600      30.150    6765.000
HydroPS_MW     40.0     579.162    672.728       8.500     110.750     324.000     843.750    3003.000
NG_MW        2083.0     242.942    380.088       0.000       6.000      55.000     328.100    3777.000
Nuclear_MW     54.0    1754.952    710.828     580.200    1166.375    1802.500    2274.375    3937.000
Crude_MW     1112.0      29.441    103.356       0.100       2.400       5.850      14.625    1613.000
Solar_MW     5195.0      14.853     38.079       0.100       1.700       3.000       5.200     585.900
Wind_MW      1320.0     109.475    111.005       0.100      14.300      90.000     175.850    1027.000
Other_MW       92.0      34.242     43.765       0.700       5.225      19.550      45.700     250.000
Period      12008.0  202305.000      0.000  202305.000  202305.000  202305.000  202305.000  202305.000
Longitude   12008.0     -93.559     18.403    -171.712    -106.506     -90.204     -77.942     -65.280
Latitude    12008.0      38.855      5.667      17.947      35.047      39.638      42.502      71.292
```

First 5 rows:
```
            X          Y  OBJECTID  Plant_Code          Plant_Name  Utility_ID                    Utility_Name       sector_name        Street_Address        City          County    State      Zip     PrimSource                                source_desc                                                                             tech_desc  Install_MW  Total_MW  Bat_MW  Bio_MW  Coal_MW  Geo_MW  Hydro_MW  HydroPS_MW   NG_MW  Nuclear_MW  Crude_MW  Solar_MW  Wind_MW  Other_MW                         Source  Period   Longitude   Latitude
0 -160.497222  55.339722     11570           1          Sand Point       63560  TDX Sand Point Generating, LLC  Electric Utility   100 Power Plant Way  Sand Point  Aleutians East   Alaska  99661.0      petroleum          Petroleum = 1.3 MW, Wind = 0.4 MW                                              Petroleum Liquids; Onshore Wind Turbine;         3.7       1.7     NaN     NaN      NaN     NaN       NaN         NaN     NaN         NaN       1.3       NaN      0.4       NaN  EIA-860, EIA-860M and EIA-923  202305 -160.497222  55.339722
1  -87.356823  33.458665     11571           2        Bankhead Dam         195                Alabama Power Co  Electric Utility    19001 Lock 17 Road   Northport      Tuscaloosa  Alabama  35476.0  hydroelectric                      Hydroelectric = 53 MW                                                            Conventional Hydroelectric        53.9      53.0     NaN     NaN      NaN     NaN      53.0         NaN     NaN         NaN       NaN       NaN      NaN       NaN  EIA-860, EIA-860M and EIA-923  202305  -87.356823  33.458665
2  -88.010300  31.006900     11572           3               Barry         195                Alabama Power Co  Electric Utility      North Highway 43       Bucks          Mobile  Alabama  36512.0    natural gas  Coal = 1118.5 MW, Natural Gas = 1296.2 MW  Conventional Steam Coal; Natural Gas Fired Combined Cycle; Natural Gas Steam Turbine      2569.5    2414.7     NaN     NaN   1118.5     NaN       NaN         NaN  1296.2         NaN       NaN       NaN      NaN       NaN  EIA-860, EIA-860M and EIA-923  202305  -88.010300  31.006900
3  -86.283056  32.583889     11573           4  Walter Bouldin Dam         195                Alabama Power Co  Electric Utility  750 Bouldin Dam Road    Wetumpka          Elmore  Alabama  36092.0  hydroelectric                   Hydroelectric = 224.1 MW                                                            Conventional Hydroelectric       225.0     224.1     NaN     NaN      NaN     NaN     224.1         NaN     NaN         NaN       NaN       NaN      NaN       NaN  EIA-860, EIA-860M and EIA-923  202305  -86.283056  32.583889
4 -106.375000  31.756900     11574           9              Copper        5701             El Paso Electric Co  Electric Utility     651 Hawkins Blvd.     El Paso         El Paso    Texas  79915.0    natural gas                        Natural Gas = 63 MW                                                  Natural Gas Fired Combustion Turbine        86.9      63.0     NaN     NaN      NaN     NaN       NaN         NaN    63.0         NaN       NaN       NaN      NaN       NaN  EIA-860, EIA-860M and EIA-923  202305 -106.375000  31.756900
```