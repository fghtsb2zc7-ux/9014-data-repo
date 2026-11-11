# Practice sets/Practice set #2/Information_stations.csv

rows: 2012  columns: 23

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| st | object | 2012 | 57 | 10, 11, 12, 13 |
| tr | int64 | 2012 | 4 | 1, 2, 3, 4 |
| an | int64 | 2012 | 28 | 2020, 2001, 2000, 2016 |
| bat | object | 2012 | 3 | L, C, M |
| date | object | 2012 | 231 | 2020-09-10, 2001-09-03, 2000-09-05, 2016-09-08 |
| long.ddec | object | 2012 | 1666 | -61.53093333, -61.53141667, -61.52545, -61.51833167 |
| lat.ddec | float64 | 2009 | 1531 | 47.50681667, 47.50865, 47.50618333, 47.50686667 |
| long.fdec | object | 2012 | 1644 | -61.5241, -61.54468333, -61.51188333, -61.5318 |
| lat.fdec | float64 | 1988 | 1552 | 47.50675, 47.50706667, 47.50663333, 47.5068 |
| dist | float64 | 2012 | 1980 | 514.8337597, 1014.792206, 1023.258571, 1014.645723 |
| heure.d | object | 2006 | 553 | 8:37, 15:47, 13:48, 11:15 |
| heure.f | object | 1961 | 545 | 8:43, 15:58, 14:00, 11:28 |
| prof.m | float64 | 2010 | 215 | 15.8, 13.0, 13.3, 13.1 |
| vit.nd | float64 | 1872 | 17 | 2.5, 2.9, 2.6, 2.8 |
| cable.m | float64 | 1926 | 44 | 150.0, 100.0, 200.0, 80.0 |
| comm.entete | object | 170 | 134 | mesure 1 homard sur 2, Positions sur feuilles erronées. Lat_dm , Vents tres legers, trait effectué est-ouest par erreur |
| comm_heading_EN | object | 170 | 136 | measures 1 out of 2 lobsters, Wrong positions on sheet. Lat_dm and lat, Very light winds, line made east-west by mistake |
| moy.t3t10 | float64 | 1972 | 612 | 9.6, 7.1, 8.775, 9.2 |
| moy.t1tn | float64 | 1998 | 1038 | 9.7, 6.98, 8.60833333, 9.10833333 |
| comm.ouverture | object | 80 | 76 | bcp d'algues, les portes ne mordaient pa, d'autres valeurs d'ouverture sont inscri, d'autres valeurs d'ouverture sont inscri, d'autres valeurs d'ouverture sont inscri |
| comm_opening_EN | object | 80 | 76 | lots of algae, the doors didn't bite wel, other opening values are written on the , other opening values are written on the , other opening values are written on the  |
| surf | float64 | 2001 | 2001 | 4015.703326, 7205.024663, 8979.093961, 7508.37835 |
| Strate | float64 | 1766 | 4 | 1.0, 3.0, 2.0, 4.0 |

Numeric summary:
```
            count      mean       std       min       25%       50%       75%        max
tr         2012.0     1.360     0.536     1.000     1.000     1.000     2.000      4.000
an         2012.0  2007.871     8.240  1995.000  2000.000  2008.000  2015.000   2022.000
lat.ddec   2009.0    47.457     0.064    47.263    47.422    47.472    47.507     47.565
lat.fdec   1988.0    47.457     0.065    47.263    47.421    47.473    47.507     47.566
dist       2012.0   894.032   212.612   173.469   862.222   990.952  1011.761   2620.946
prof.m     2010.0    16.363     4.538     4.900    13.400    16.000    19.000     35.000
vit.nd     1872.0     2.730     0.183     1.800     2.600     2.700     2.800      3.800
cable.m    1926.0   142.730    36.951    50.000   110.000   150.000   150.000    300.000
moy.t3t10  1972.0     8.186     1.777     3.000     6.925     7.806     9.488     16.350
moy.t1tn   1998.0     8.091     1.774     3.058     6.834     7.670     9.400     20.888
surf       2001.0  6821.912  1923.146   914.682  5759.904  7062.926  8016.555  17068.914
Strate     1766.0     2.109     0.843     1.000     1.000     2.000     3.000      4.000
```

First 5 rows:
```
   st  tr    an bat        date     long.ddec   lat.ddec     long.fdec   lat.fdec         dist heure.d heure.f  prof.m  vit.nd  cable.m comm.entete comm_heading_EN  moy.t3t10  moy.t1tn comm.ouverture comm_opening_EN         surf  Strate
0  10   1  2020   L  2020-09-10  -61.53093333  47.506817      -61.5241  47.506750   514.833760    8:37    8:43    15.8     2.5    150.0         NaN             NaN     9.6000  9.700000            NaN             NaN  4015.703326     1.0
1  10   1  2001   C  2001-09-03  -61.53141667  47.508650  -61.54468333  47.507067  1014.792206   15:47   15:58    13.0     2.5    150.0         NaN             NaN     7.1000  6.980000            NaN             NaN  7205.024663     1.0
2  10   1  2000   C  2000-09-05     -61.52545  47.506183  -61.51188333  47.506633  1023.258571   13:48   14:00    13.0     2.9    150.0         NaN             NaN     8.7750  8.608333            NaN             NaN  8979.093961     1.0
3  10   1  2016   L  2016-09-08  -61.51833167  47.506867      -61.5318  47.506800  1014.645723   11:15   11:28    13.3     2.6    150.0         NaN             NaN     9.2000  9.108333            NaN             NaN  7508.378350     1.0
4  10   1  2011   C  2011-09-07  -61.53086667  47.506817      -61.5179  47.506783   976.833920   15:21   15:33    13.1     2.8    150.0         NaN             NaN     8.3125  8.150000            NaN             NaN  8119.931959     1.0
```