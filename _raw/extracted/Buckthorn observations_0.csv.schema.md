# Buckthorn observations_0.csv

rows: 53  columns: 22

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| OBJECTID | int64 | 53 | 53 | 1, 2, 3, 4 |
| GlobalID | object | 53 | 53 | ac78f0eb-17c6-42f2-8203-359008042825, 719fc132-3d86-4dbd-87b5-2a812952931d, 39ce9d7e-e2e5-41eb-b16d-add2f2d9e0fb, e0e7017f-f114-4c58-8c85-7a02337fd814 |
| CreationDate | object | 53 | 53 | 9/21/2026 1:45:11 PM, 9/21/2026 1:48:41 PM, 9/21/2026 1:53:14 PM, 9/21/2026 1:54:06 PM |
| Creator | object | 53 | 19 | hfishma2@uwo.ca_westernu, rlynn7@uwo.ca_westernu, stripa4@uwo.ca_westernu, tdaviso7@uwo.ca_westernu |
| EditDate | object | 53 | 53 | 9/21/2026 2:15:40 PM, 9/21/2026 1:48:41 PM, 9/21/2026 1:53:14 PM, 9/21/2026 1:54:06 PM |
| Editor | object | 53 | 19 | hfishma2@uwo.ca_westernu, rlynn7@uwo.ca_westernu, stripa4@uwo.ca_westernu, tdaviso7@uwo.ca_westernu |
| Section | object | 53 | 2 | Section 1, Section 2 |
| Group members | object | 53 | 22 | Sickies, Bucky Busters, Buck Thorns 1, BADT |
| Transect ID | object | 53 | 18 | 001, 1, 30, 01 |
| Quadrat ID | int64 | 53 | 6 | 1, 2, 3, 4 |
| Distance along transect | float64 | 53 | 20 | 5.0, 0.0, 25.0, 17.5 |
| Buckthorn Percent | int64 | 53 | 20 | 20, 0, 40, 10 |
| Sapling Percent | int64 | 53 | 17 | 100, 0, 70, 25 |
| Bare Soil Percent | int64 | 53 | 20 | 80, 70, 40, 20 |
| Adult Percent | int64 | 53 | 15 | 0, 10, 5, 50 |
| Non-buckthorn Vegetation Percent | int64 | 53 | 25 | 70, 30, 20, 63 |
| Canopy Cover | int64 | 53 | 19 | 80, 97, 90, 85 |
| Reproducing Buckthorn | object | 53 | 2 | No, Yes |
| Notes | object | 14 | 14 | Honeysuckle is seedling value, No honeysuckle , 50% is in the creek , a lot of dead vegetation |
| Honeysuckle Percent | int64 | 53 | 8 | 0, 20, 100, 40 |
| x | float64 | 53 | 53 | -81.27139317589, -81.2715669909143, -81.2713628002569, -81.2715551079997 |
| y | float64 | 53 | 53 | 43.0048043684168, 43.0046229483682, 43.0048988165222, 43.0046607360168 |

Numeric summary:
```
                                  count    mean     std     min     25%     50%     75%      max
OBJECTID                           53.0  27.000  15.443   1.000  14.000  27.000  40.000   53.000
Quadrat ID                         53.0   3.189   1.570   1.000   2.000   3.000   5.000    6.000
Distance along transect            53.0  26.887  18.965   0.000  10.000  25.000  40.000   77.500
Buckthorn Percent                  53.0  25.491  17.748   0.000  15.000  20.000  35.000   80.000
Sapling Percent                    53.0  51.566  37.909   0.000  10.000  50.000  90.000  100.000
Bare Soil Percent                  53.0  38.811  26.524   0.000  15.000  30.000  60.000   90.000
Adult Percent                      53.0  17.113  25.663   0.000   0.000   5.000  25.000   95.000
Non-buckthorn Vegetation Percent   53.0  41.528  27.700   5.000  15.000  38.000  70.000   95.000
Canopy Cover                       53.0  65.226  22.911   3.000  50.000  70.000  80.000   97.000
Honeysuckle Percent                53.0   3.981  15.230   0.000   0.000   0.000   0.000  100.000
x                                  53.0 -81.271   0.000 -81.272 -81.271 -81.271 -81.271  -81.270
y                                  53.0  43.005   0.000  43.004  43.005  43.005  43.005   43.005
```

First 5 rows:
```
   OBJECTID                              GlobalID          CreationDate                   Creator              EditDate                    Editor    Section  Group members Transect ID  Quadrat ID  Distance along transect  Buckthorn Percent  Sapling Percent  Bare Soil Percent  Adult Percent  Non-buckthorn Vegetation Percent  Canopy Cover Reproducing Buckthorn                          Notes  Honeysuckle Percent          x          y
0         1  ac78f0eb-17c6-42f2-8203-359008042825  9/21/2026 1:45:11 PM  hfishma2@uwo.ca_westernu  9/21/2026 2:15:40 PM  hfishma2@uwo.ca_westernu  Section 1        Sickies         001           1                      5.0                 20              100                 80              0                                70            80                    No                            NaN                    0 -81.271393  43.004804
1         2  719fc132-3d86-4dbd-87b5-2a812952931d  9/21/2026 1:48:41 PM    rlynn7@uwo.ca_westernu  9/21/2026 1:48:41 PM    rlynn7@uwo.ca_westernu  Section 1  Bucky Busters           1           1                      0.0                  0                0                 70              0                                30            97                    No                            NaN                    0 -81.271567  43.004623
2         3  39ce9d7e-e2e5-41eb-b16d-add2f2d9e0fb  9/21/2026 1:53:14 PM   stripa4@uwo.ca_westernu  9/21/2026 1:53:14 PM   stripa4@uwo.ca_westernu  Section 1  Buck Thorns 1           1           1                      0.0                 40               70                 40             10                                20            90                   Yes  Honeysuckle is seedling value                   20 -81.271363  43.004899
3         4  e0e7017f-f114-4c58-8c85-7a02337fd814  9/21/2026 1:54:06 PM  tdaviso7@uwo.ca_westernu  9/21/2026 1:54:06 PM  tdaviso7@uwo.ca_westernu  Section 1           BADT          30           1                      0.0                 10              100                 70              0                                20            85                    No                            NaN                    0 -81.271555  43.004661
4         5  0b642fc5-6d5e-4570-ad44-465af6c507d3  9/21/2026 1:56:05 PM  hsidhu65@uwo.ca_westernu  9/21/2026 1:56:05 PM  hsidhu65@uwo.ca_westernu  Section 1          majh           01           1                     25.0                 17              100                 20              0                                63            75                    No                            NaN                    0 -81.271514  43.004732
```