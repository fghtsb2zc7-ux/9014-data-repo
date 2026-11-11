# Practice sets/OBIS - North Atlantic Right Whale reduced.csv

rows: 8793  columns: 15

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| id | object | 8793 | 8793 | 071fb69d-84ea-41d9-a71d-6a607d027086, 96e01174-5a11-432c-9dc9-8797fd751e36, e5c1afcf-398f-40eb-badd-e1202ae741aa, 0634ab89-6a81-403e-91da-fcd8297d0ac0 |
| areas | object | 8793 | 39 | [266, 272, 40006, 31912], [266, 272, 40007], [266, 272, 40007, 31912], [266, 272, 31912] |
| bathymetry | float64 | 8793 | 433 | 34.0, 2.0, 14.0, -3.0 |
| behavior | object | 35 | 11 | PORPOISING, BLOWING, FEEDING, SWIMMING |
| decimalLatitude | float64 | 8793 | 7028 | 30.047163, 37.24609, 37.9638, 36.788 |
| decimalLongitude | float64 | 8793 | 6960 | -80.697271, -75.80589, -75.29271, -75.8405 |
| eventDate | object | 8784 | 2720 | 2010-03-20, 2005-03-03, 2001-03-17, 2004-02-07 |
| eventDate_standard | object | 8784 | 2585 | 2010-03-20, 2005-03-03, 2001-03-17, 2004-02-07 |
| year | float64 | 8792 | 73 | 2010.0, 2005.0, 2001.0, 2004.0 |
| identifiedBy | object | 45 | 15 | David Walker, NJM, HFG, MCM/DAB |
| identifiedByID | float64 | 0 | 0 |  |
| individualCount | float64 | 4445 | 55 | 2.0, 1.0, 6.0, 5.0 |
| institutionCode | object | 4475 | 27 | DON, Virginia Aquarium Stranding Response Pro, NEFSC, SEFSC |
| institutionID | object | 8 | 2 | http://www.seadatanet.org/urnurl/SDN:EDM, http://www.seadatanet.org/urnurl/SDN:EDM |
| species | object | 8793 | 1 | Eubalaena glacialis |

Numeric summary:
```
                   count      mean      std       min       25%       50%       75%      max
bathymetry        8793.0   126.186  160.144  -114.000    66.000   104.000   177.000  5185.00
decimalLatitude   8793.0    43.836    3.913   -33.883    41.959    44.281    46.927    71.38
decimalLongitude  8793.0   -67.052    6.495   -97.369   -69.256   -66.623   -64.243   153.56
year              8792.0  2008.539   14.385  1900.000  2002.000  2010.000  2019.000  2024.00
identifiedByID       0.0       NaN      NaN       NaN       NaN       NaN       NaN      NaN
individualCount   4445.0     3.686    6.165     1.000     1.000     2.000     3.000   100.00
```

First 5 rows:
```
                                     id                     areas  bathymetry behavior  decimalLatitude  decimalLongitude   eventDate eventDate_standard    year identifiedBy  identifiedByID  individualCount                               institutionCode institutionID              species
0  071fb69d-84ea-41d9-a71d-6a607d027086  [266, 272, 40006, 31912]        34.0      NaN        30.047163        -80.697271  2010-03-20         2010-03-20  2010.0          NaN             NaN              2.0                                           DON           NaN  Eubalaena glacialis
1  96e01174-5a11-432c-9dc9-8797fd751e36         [266, 272, 40007]         2.0      NaN        37.246090        -75.805890  2005-03-03         2005-03-03  2005.0          NaN             NaN              1.0  Virginia Aquarium Stranding Response Program           NaN  Eubalaena glacialis
2  e5c1afcf-398f-40eb-badd-e1202ae741aa  [266, 272, 40007, 31912]         2.0      NaN        37.963800        -75.292710  2001-03-17         2001-03-17  2001.0          NaN             NaN              1.0  Virginia Aquarium Stranding Response Program           NaN  Eubalaena glacialis
3  0634ab89-6a81-403e-91da-fcd8297d0ac0  [266, 272, 40007, 31912]        14.0      NaN        36.788000        -75.840500  2004-02-07         2004-02-07  2004.0          NaN             NaN              1.0  Virginia Aquarium Stranding Response Program           NaN  Eubalaena glacialis
4  ec8ad1ef-be25-4a5c-b4e4-70bde4817341         [266, 272, 31912]        -3.0      NaN        36.300770        -75.800240  2004-11-24         2004-11-24  2004.0          NaN             NaN              1.0  Virginia Aquarium Stranding Response Program           NaN  Eubalaena glacialis
```