# TPM practice exam.zip (zip, 9 entries)

| member | bytes |
|---|---|
| can_ppp_2020_1km_Aggregated.tif | 42577344 |
| ELC/ELC of Ontario.pdf | 1632167 |
| ELC/ELC.dbf | 8265635 |
| ELC/ELC.prj | 167 |
| ELC/ELC.qix | 320120 |
| ELC/ELC.shp | 44526788 |
| ELC/ELC.shx | 230492 |
| ELC/readme.txt | 364 |
| particulate_matter_ON.csv | 667690 |

## ELC/ELC.prj
```
GEOGCS["GCS_North_American_1983",DATUM["D_North_American_1983",SPHEROID["GRS_1980",6378137.0,298.257222101]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]]
```

## ELC/readme.txt
```
List of Files enclosed in Zip:
1. readme.txt
2. ELC.shp
3. ELC of Ontario.pdf

Description of Attributes:

Ecozone: First tier of ELC Classification; Name of Ecozone

Ecoregion: Second tier of ELC Classification; Ecoregion code 
Ecorg_name: Name of Ecoregion

Ecodist: Third tier of ELC Classification; Ecodistrict code
Edist_name: Name of Ecodistrict
```

## particulate_matter_ON.csv
rows: 3094  columns: 15

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| Year | int64 | 3094 | 5 | 2024, 2023, 2022, 2021 |
| NPRI_ID | int64 | 3094 | 321 | 161, 327, 344, 444 |
| Company_Name | object | 3094 | 221 | Bunge Canada, Bunge Canada , Irving Consumer Products Limited, Chemtrade Logistics Inc. |
| Facility_Name | object | 3094 | 342 | BUNGE CANADA - HAMILTON, Irving Consumer Products Limited, Irving Tissue Corporation, Chemtrade - Thorold |
| NAICS | int64 | 3094 | 88 | 311224, 322121, 325999, 331410 |
| NAICS Title EN | object | 3094 | 90 | Oilseed processing, Paper (except newsprint) mills, All other miscellaneous chemical product, Non-ferrous metal (except aluminum) smel |
| PROVINCE | object | 3094 | 1 | ON |
| CAS_Number | object | 3094 | 1 | NA - M08 |
| Substance Name (English) / Nom de substance (Anglais) | object | 3094 | 1 | Total particulate matter |
| Group (English) / Groupe (Anglais) | object | 3094 | 1 | Releases to Air |
| Quantity | float64 | 3094 | 2800 | 3.794, 26.13, 3.16, 26.24 |
| Units | object | 3094 | 1 | tonnes |
| Estimation_Method / M�thode_d�estimation | object | 3070 | 8 | O - Engineering Estimates, C - Mass Balance, E1 - Site Specific Emission Factors, M3 - Source Testing |
| latitude | float64 | 3094 | 319 | 43.27022, 43.69374, 43.1101, 46.4786 |
| longitude | float64 | 3094 | 320 | -79.84949, -79.50446, -79.2092, -81.0553 |

Numeric summary:
```
            count        mean         std         min         25%         50%         75%         max
Year       3094.0    2021.956       1.418    2020.000    2021.000    2022.000    2023.000    2024.000
NPRI_ID    3094.0   10491.444    7916.439     161.000    5732.000   10139.000   11542.000   35281.000
NAICS      3094.0  303959.200  123234.319  211110.000  212315.000  311211.000  327410.000  911910.000
Quantity   3094.0      54.465     254.738       0.000       1.698      12.303      37.585    8176.530
latitude   3094.0      45.024       2.244      42.095      43.260      44.071      46.475      52.819
longitude  3094.0     -80.959       3.603     -94.361     -81.768     -80.160     -79.337     -74.591
```

First 5 rows:
```
   Year  NPRI_ID  Company_Name            Facility_Name   NAICS      NAICS Title EN PROVINCE CAS_Number Substance Name (English) / Nom de substance (Anglais) Group (English) / Groupe (Anglais)  Quantity   Units Estimation_Method / M�thode_d�estimation  latitude  longitude
0  2024      161  Bunge Canada  BUNGE CANADA - HAMILTON  311224  Oilseed processing       ON   NA - M08                              Total particulate matter                    Releases to Air     3.794  tonnes                O - Engineering Estimates  43.27022  -79.84949
1  2024      161  Bunge Canada  BUNGE CANADA - HAMILTON  311224  Oilseed processing       ON   NA - M08                              Total particulate matter                    Releases to Air    26.130  tonnes                O - Engineering Estimates  43.27022  -79.84949
2  2023      161  Bunge Canada  BUNGE CANADA - HAMILTON  311224  Oilseed processing       ON   NA - M08                              Total particulate matter                    Releases to Air     3.160  tonnes                O - Engineering Estimates  43.27022  -79.84949
3  2023      161  Bunge Canada  BUNGE CANADA - HAMILTON  311224  Oilseed processing       ON   NA - M08                              Total particulate matter                    Releases to Air    26.240  tonnes                O - Engineering Estimates  43.27022  -79.84949
4  2022      161  Bunge Canada  BUNGE CANADA - HAMILTON  311224  Oilseed processing       ON   NA - M08                              Total particulate matter                    Releases to Air     3.780  tonnes                O - Engineering Estimates  43.27022  -79.84949
```