# Class 2/Irish_Marine_Sports_Fish_Tagging_Programme_Dataset_Full.csv

rows: 47086  columns: 13

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| OBJECTID_1 | int64 | 47086 | 47086 | 1, 1075, 13561, 13990 |
| Tag Event ID | object | 47086 | 47086 | MSFTag_000001, MSFTag_001077, MSFTag_013586, MSFTag_014015 |
| TagType Num | object | 47086 | 47086 | D000001, J000013, J015757, J016262 |
| Tag Type | object | 47086 | 5 | D, J, P, R |
| Common Name | object | 47086 | 22 | Blue shark, Tope, Thornback ray, Porbeagle shark |
| Species Code | object | 47082 | 21 | PGB, GGT, THR, LNP |
| Latin name | object | 47086 | 22 | Prionace glauca, Galeorhinus galeus, Raja clavata, Lamna nasus |
| Tag Date | object | 46586 | 5455 | 1971-09-15 0:00, 1971-09-06 0:00, 1995-08-30 0:00, 1994-08-31 0:00 |
| Tag Year | int64 | 47086 | 50 | 1971, 1995, 1994, 1980 |
| Tagger ID | object | 47086 | 389 | MSFTagger_Unknown, MSFTagger_0155, MSFTagger_0382, MSFTagger_0225 |
| ICES Statistical SubRectangles | object | 47086 | 228 | 37D98, 32E24, 32E16, 39E31 |
| x | float64 | 47086 | 30 | -10.16666667, -7.5, -8.5, -6.833333333 |
| y | float64 | 47086 | 47 | 54.25, 51.91666667, 51.58333333, 55.41666667 |

Numeric summary:
```
              count       mean        std      min        25%        50%        75%        max
OBJECTID_1  47086.0  23552.553  13601.423     1.00  11775.250  23546.500  35340.750  47112.000
Tag Year    47086.0   1996.110     11.502  1970.00   1988.000   1996.000   2005.000   2019.000
x           47086.0     -8.702      1.434   -13.50     -9.833     -8.833     -8.167      1.833
y           47086.0     52.435      1.846    36.75     51.583     52.250     53.250     58.417
```

First 5 rows:
```
   OBJECTID_1   Tag Event ID TagType Num Tag Type    Common Name Species Code          Latin name         Tag Date  Tag Year          Tagger ID ICES Statistical SubRectangles          x      y
0           1  MSFTag_000001     D000001        D     Blue shark          PGB     Prionace glauca  1971-09-15 0:00      1971  MSFTagger_Unknown                          37D98 -10.166667  54.25
1        1075  MSFTag_001077     J000013        J           Tope          GGT  Galeorhinus galeus  1971-09-06 0:00      1971     MSFTagger_0155                          37D98 -10.166667  54.25
2       13561  MSFTag_013586     J015757        J     Blue shark          PGB     Prionace glauca  1995-08-30 0:00      1995     MSFTagger_0382                          37D98 -10.166667  54.25
3       13990  MSFTag_014015     J016262        J     Blue shark          PGB     Prionace glauca  1994-08-31 0:00      1994     MSFTagger_0382                          37D98 -10.166667  54.25
4       33478  MSFTag_033538    P000047a        P  Thornback ray          THR        Raja clavata  1980-09-02 0:00      1980     MSFTagger_0155                          37D98 -10.166667  54.25
```