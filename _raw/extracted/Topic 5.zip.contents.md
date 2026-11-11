# Topic 5.zip (zip, 46 entries)

| member | bytes |
|---|---|
| Topic 5/ | 0 |
| Topic 5/1km17477047610SWOOP2015.img | 1054274 |
| Topic 5/aci_2018_on_v3/ | 0 |
| Topic 5/aci_2018_on_v3/aci_2018_on_v3.tif | 1688153198 |
| Topic 5/aci_2018_on_v3/aci_crop_classifications_iac_classifications_des_cultures.csv | 2790 |
| Topic 5/ANALYTE_PARM_LOOKUP_EN_2025.csv | 4770 |
| Topic 5/Buckthorn observations_0.csv | 12102 |
| Topic 5/buckthorn_updated/ | 0 |
| Topic 5/buckthorn_updated/buckthorn_updated.cpg | 5 |
| Topic 5/buckthorn_updated/buckthorn_updated.dbf | 144604 |
| Topic 5/buckthorn_updated/buckthorn_updated.prj | 424 |
| Topic 5/buckthorn_updated/buckthorn_updated.qmd | 2299 |
| Topic 5/buckthorn_updated/buckthorn_updated.shp | 1584 |
| Topic 5/buckthorn_updated/buckthorn_updated.shx | 524 |
| Topic 5/buckthorn_updated.csv | 22583 |
| Topic 5/EcoDistrict/ | 0 |
| Topic 5/EcoDistrict/EcoDistrict.cpg | 5 |
| Topic 5/EcoDistrict/EcoDistrict.dbf | 8867 |
| Topic 5/EcoDistrict/EcoDistrict.prj | 167 |
| Topic 5/EcoDistrict/EcoDistrict.shp | 2182992 |
| Topic 5/EcoDistrict/EcoDistrict.shx | 668 |
| Topic 5/EcoDistrict/EcoDistrict.xml | 33287 |
| Topic 5/Parking lot/ | 0 |
| Topic 5/Parking lot/Parking lot.cpg | 5 |
| Topic 5/Parking lot/Parking lot.dbf | 77 |
| Topic 5/Parking lot/Parking lot.prj | 145 |
| Topic 5/Parking lot/Parking lot.shp | 268 |
| Topic 5/Parking lot/Parking lot.shx | 108 |
| Topic 5/PWQMN-2000_2009.csv | 107495196 |
| Topic 5/PWQMN-2010_2018.csv | 103010018 |
| Topic 5/PWQMN_2010_2018_update5.csv | 103010018 |
| Topic 5/PWQMN_data_2024.csv | 11266830 |
| Topic 5/PWQMN_FieldData_2021-2022_Final.csv | 583391 |
| Topic 5/PWQMN_Stations.csv | 228661 |
| Topic 5/Sampling area/ | 0 |
| Topic 5/Sampling area/Sampling area.cpg | 5 |
| Topic 5/Sampling area/Sampling area.dbf | 77 |
| Topic 5/Sampling area/Sampling area.prj | 145 |
| Topic 5/Sampling area/Sampling area.shp | 316 |
| Topic 5/Sampling area/Sampling area.shx | 108 |
| Topic 5/Water_Edges/ | 0 |
| Topic 5/Water_Edges/Water_Edges.cpg | 5 |
| Topic 5/Water_Edges/Water_Edges.dbf | 2881477 |
| Topic 5/Water_Edges/Water_Edges.prj | 424 |
| Topic 5/Water_Edges/Water_Edges.shp | 16426296 |
| Topic 5/Water_Edges/Water_Edges.shx | 223884 |

## Topic 5/aci_2018_on_v3/aci_crop_classifications_iac_classifications_des_cultures.csv
(could not parse: No columns to parse from file)

## Topic 5/ANALYTE_PARM_LOOKUP_EN_2025.csv
rows: 85  columns: 4

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| CAS NUMBER | object | 71 | 64 | 7440-22-4, ALKT, 7429-90-5, 7440-38-2 |
| ANALYTE | object | 85 | 80 | Silver, Alkalinity, Aluminum, Arsenic |
| PARAMETER CODE | object | 84 | 83 | AGUT, ALKT, ALUT, ASUT |
| PARAMETER DESCRIPTION | object | 84 | 83 | SILVER,   UNFILTERED TOTAL, ALKALINITY, TOTAL, ALUMINIUM, UNFILTERED TOTAL, ARSENIC,    UNFILTERED TOTAL |

First 5 rows:
```
  CAS NUMBER     ANALYTE PARAMETER CODE         PARAMETER DESCRIPTION
0  7440-22-4      Silver           AGUT    SILVER,   UNFILTERED TOTAL
1       ALKT  Alkalinity           ALKT             ALKALINITY, TOTAL
2  7429-90-5    Aluminum           ALUT   ALUMINIUM, UNFILTERED TOTAL
3  7440-38-2     Arsenic           ASUT  ARSENIC,    UNFILTERED TOTAL
4  7440-39-3      Barium           BAUT     BARIUM,  UNFILTERED TOTAL
```

## Topic 5/Buckthorn observations_0.csv
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

## Topic 5/buckthorn_updated/buckthorn_updated.prj
```
PROJCS["NAD_1983_UTM_Zone_17N",GEOGCS["GCS_North_American_1983",DATUM["D_North_American_1983",SPHEROID["GRS_1980",6378137.0,298.257222101]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]],PROJECTION["Transverse_Mercator"],PARAMETER["False_Easting",500000.0],PARAMETER["False_Northing",0.0],PARAMETER["Central_Meridian",-81.0],PARAMETER["Scale_Factor",0.9996],PARAMETER["Latitude_Of_Origin",0.0],UNIT["Meter",1.0]]
```

## Topic 5/buckthorn_updated/buckthorn_updated.qmd
```
<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.44.13-Solothurn">
  <identifier></identifier>
  <parentidentifier></parentidentifier>
  <language></language>
  <type></type>
  <title></title>
  <abstract></abstract>
  <contact>
    <name></name>
    <organization></organization>
    <position></position>
    <voice></voice>
    <fax></fax>
    <email></email>
    <role></role>
  </contact>
  <links/>
  <dates/>
  <fees></fees>
  <encoding></encoding>
  <crs>
    <spatialrefsys nativeFormat="Wkt">
      <wkt></wkt>
      <proj4></proj4>
      <srsid>0</srsid>
      <srid>0</srid>
      <authid></authid>
      <description></description>
      <projectionacronym></projectionacronym>
      <ellipsoidacronym></ellipsoidacronym>
      <geographicflag>false</geographicflag>
    </spatialrefsys>
  </crs>
  <extent>
    <spatial minx="179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368" maxx="-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368" maxy="-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368" minz="0" crs="" miny="179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368" dimensions="2" maxz="0"/>
    <temporal>
      <period>
        <start></start>
        <end></end>
      </period>
    </temporal>
  </extent>
</qgis>

```

## Topic 5/buckthorn_updated.csv
rows: 53  columns: 36

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
| Reproducing Buckthorn | bool | 53 | 2 | False, True |
| Notes | object | 14 | 14 | Honeysuckle is seedling value, No honeysuckle , 50% is in the creek , a lot of dead vegetation |
| Honeysuckle Percent | int64 | 53 | 8 | 0, 20, 100, 40 |
| x | float64 | 53 | 53 | -81.27139317589, -81.2715669909143, -81.2713628002569, -81.2715551079997 |
| y | float64 | 53 | 53 | 43.0048043684168, 43.0046229483682, 43.0048988165222, 43.0046607360168 |
| OBJECTID_2 | int64 | 53 | 1 | 255204 |
| Theme | object | 53 | 1 | Hydrography |
| Layer | object | 53 | 1 | Map 2D - Hydrography - Shoreline |
| FeatureCod | object | 53 | 1 | GA27110000 |
| WaterEdgeT | int64 | 53 | 1 | 2 |
| LastEditDa | object | 53 | 1 | 2025/07/31 |
| ShapeSTLen | float64 | 53 | 1 | 453.719233755766 |
| n | int64 | 53 | 1 | 1 |
| distance | float64 | 53 | 53 | 86.6293433832016, 77.6550483600749, 95.1461470634509, 80.2316900034449 |
| feature_x | float64 | 53 | 53 | 477880.907309467, 477866.675896474, 477883.416867582, 477867.657946487 |
| feature_y | float64 | 53 | 53 | 4761384.04351856, 4761363.94288013, 4761394.52383954, 4761368.13601017 |
| nearest_x | float64 | 53 | 17 | 477919.497, 477917.962, 477921.899, 477919.128248979 |
| nearest_y | float64 | 53 | 17 | 4761306.484, 4761305.633, 4761307.402, 4761306.27956539 |
| elevation1 | float64 | 53 | 51 | 237.802673339844, 238.449371337891, 238.248748779297, 238.633117675781 |

Numeric summary:
```
                                  count         mean     std          min          25%          50%          75%          max
OBJECTID                           53.0       27.000  15.443        1.000       14.000       27.000       40.000       53.000
Quadrat ID                         53.0        3.189   1.570        1.000        2.000        3.000        5.000        6.000
Distance along transect            53.0       26.887  18.965        0.000       10.000       25.000       40.000       77.500
Buckthorn Percent                  53.0       25.491  17.748        0.000       15.000       20.000       35.000       80.000
Sapling Percent                    53.0       51.566  37.909        0.000       10.000       50.000       90.000      100.000
Bare Soil Percent                  53.0       38.811  26.524        0.000       15.000       30.000       60.000       90.000
Adult Percent                      53.0       17.113  25.663        0.000        0.000        5.000       25.000       95.000
Non-buckthorn Vegetation Percent   53.0       41.528  27.700        5.000       15.000       38.000       70.000       95.000
Canopy Cover                       53.0       65.226  22.911        3.000       50.000       70.000       80.000       97.000
Honeysuckle Percent                53.0        3.981  15.230        0.000        0.000        0.000        0.000      100.000
x                                  53.0      -81.271   0.000      -81.272      -81.271      -81.271      -81.271      -81.270
y                                  53.0       43.005   0.000       43.004       43.005       43.005       43.005       43.005
OBJECTID_2                         53.0   255204.000   0.000   255204.000   255204.000   255204.000   255204.000   255204.000
WaterEdgeT                         53.0        2.000   0.000        2.000        2.000        2.000        2.000        2.000
ShapeSTLen                         53.0      453.719   0.000      453.719      453.719      453.719      453.719      453.719
n                                  53.0        1.000   0.000        1.000        1.000        1.000        1.000        1.000
distance                           53.0       58.380  21.231       18.745       41.056       59.698       74.510       95.955
feature_x                          53.0   477905.888  23.389   477866.676   477888.211   477905.050   477924.431   477956.840
feature_y                          53.0  4761362.952  17.861  4761325.797  4761352.020  4761363.325  4761376.086  4761397.249
nearest_x                          53.0   477931.861  22.013   477917.962   477919.497   477921.899   477923.678   477983.287
nearest_y                          53.0  4761313.515  14.868  4761305.633  4761306.484  4761307.402  4761307.882  4761354.896
elevation1                         53.0      236.154   1.162      234.308      235.312      235.903      236.308      238.633
```

First 5 rows:
```
   OBJECTID                              GlobalID          CreationDate                   Creator              EditDate                    Editor    Section  Group members Transect ID  Quadrat ID  Distance along transect  Buckthorn Percent  Sapling Percent  Bare Soil Percent  Adult Percent  Non-buckthorn Vegetation Percent  Canopy Cover  Reproducing Buckthorn                          Notes  Honeysuckle Percent          x          y  OBJECTID_2        Theme                             Layer  FeatureCod  WaterEdgeT  LastEditDa  ShapeSTLen  n   distance      feature_x     feature_y   nearest_x    nearest_y  elevation1
0         1  ac78f0eb-17c6-42f2-8203-359008042825  9/21/2026 1:45:11 PM  hfishma2@uwo.ca_westernu  9/21/2026 2:15:40 PM  hfishma2@uwo.ca_westernu  Section 1        Sickies         001           1                      5.0                 20              100                 80              0                                70            80                  False                            NaN                    0 -81.271393  43.004804      255204  Hydrography  Map 2D - Hydrography - Shoreline  GA27110000           2  2025/07/31  453.719234  1  86.629343  477880.907309  4.761384e+06  477919.497  4761306.484  237.802673
1         2  719fc132-3d86-4dbd-87b5-2a812952931d  9/21/2026 1:48:41 PM    rlynn7@uwo.ca_westernu  9/21/2026 1:48:41 PM    rlynn7@uwo.ca_westernu  Section 1  Bucky Busters           1           1                      0.0                  0                0                 70              0                                30            97                  False                            NaN                    0 -81.271567  43.004623      255204  Hydrography  Map 2D - Hydrography - Shoreline  GA27110000           2  2025/07/31  453.719234  1  77.655048  477866.675896  4.761364e+06  477917.962  4761305.633  238.449371
2         3  39ce9d7e-e2e5-41eb-b16d-add2f2d9e0fb  9/21/2026 1:53:14 PM   stripa4@uwo.ca_westernu  9/21/2026 1:53:14 PM   stripa4@uwo.ca_westernu  Section 1  Buck Thorns 1           1           1                      0.0                 40               70                 40             10                                20            90                   True  Honeysuckle is seedling value                   20 -81.271363  43.004899      255204  Hydrography  Map 2D - Hydrography - Shoreline  GA27110000           2  2025/07/31  453.719234  1  95.146147  477883.416868  4.761395e+06  477919.497  4761306.484  238.248749
3         4  e0e7017f-f114-4c58-8c85-7a02337fd814  9/21/2026 1:54:06 PM  tdaviso7@uwo.ca_westernu  9/21/2026 1:54:06 PM  tdaviso7@uwo.ca_westernu  Section 1           BADT          30           1                      0.0                 10              100                 70              0                                20            85                  False                            NaN                    0 -81.271555  43.004661      255204  Hydrography  Map 2D - Hydrography - Shoreline  GA27110000           2  2025/07/31  453.719234  1  80.231690  477867.657946  4.761368e+06  477917.962  4761305.633  238.633118
4         5  0b642fc5-6d5e-4570-ad44-465af6c507d3  9/21/2026 1:56:05 PM  hsidhu65@uwo.ca_westernu  9/21/2026 1:56:05 PM  hsidhu65@uwo.ca_westernu  Section 1          majh           01           1                     25.0                 17              100                 20              0                                63            75                  False                            NaN                    0 -81.271514  43.004732      255204  Hydrography  Map 2D - Hydrography - Shoreline  GA27110000           2  2025/07/31  453.719234  1  84.671487  477870.998475  4.761376e+06  477917.962  4761305.633  238.506256
```

## Topic 5/EcoDistrict/EcoDistrict.prj
```
GEOGCS["GCS_North_American_1983",DATUM["D_North_American_1983",SPHEROID["GRS_1980",6378137.0,298.257222101]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]]
```

## Topic 5/EcoDistrict/EcoDistrict.xml
```
<?xml version="1.0" encoding="UTF-8"?><mdb:MD_Metadata xmlns:msr="http://standards.iso.org/iso/19115/-3/msr/1.0" xmlns:cit="http://standards.iso.org/iso/19115/-3/cit/1.0" xmlns:mex="http://standards.iso.org/iso/19115/-3/mex/1.0" xmlns:gcx="http://standards.iso.org/iso/19115/-3/gcx/1.0" xmlns:mmi="http://standards.iso.org/iso/19115/-3/mmi/1.0" xmlns:mac="http://standards.iso.org/iso/19115/-3/mac/1.0" xmlns:esri="http://www.esri.com/metadata/" xmlns:mdb="http://standards.iso.org/iso/19115/-3/mdb/1.0" xmlns:mda="http://standards.iso.org/iso/19115/-3/mda/1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:mpc="http://standards.iso.org/iso/19115/-3/mpc/1.0" xmlns:cat="http://standards.iso.org/iso/19115/-3/cat/1.0" xmlns:gco="http://standards.iso.org/iso/19115/-3/gco/1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:lan="http://standards.iso.org/iso/19115/-3/lan/1.0" xmlns:t="http://www.esri.com/xslt/translator" xmlns:mco="http://standards.iso.org/iso/19115/-3/mco/1.0" xmlns:mrs="http://standards.iso.org/iso/19115/-3/mrs/1.0" xmlns:dqc="http://standards.iso.org/iso/19157/-2/dqc/1.0" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:mrl="http://standards.iso.org/iso/19115/-3/mrl/1.0" xmlns:gex="http://standards.iso.org/iso/19115/-3/gex/1.0" xmlns:mdt="http://standards.iso.org/iso/19115/-3/mdt/1.0" xmlns:mri="http://standards.iso.org/iso/19115/-3/mri/1.0" xmlns:mas="http://standards.iso.org/iso/19115/-3/mas/1.0" xmlns:mds="http://standards.iso.org/iso/19115/-3/mds/1.0" xmlns:mcc="http://standards.iso.org/iso/19115/-3/mcc/1.0" xmlns:srv="http://standards.iso.org/iso/19115/-3/srv/2.0" xmlns:mdq="http://standards.iso.org/iso/19157/-2/mdq/1.0" xmlns:mrd="http://standards.iso.org/iso/19115/-3/mrd/1.0" xmlns:res="http://www.esri.com/metadata/res/" xmlns:mrc="http://standards.iso.org/iso/19115/-3/mrc/1.0">
    <mdb:metadataIdentifier>
        <mcc:MD_Identifier>
            <mcc:code>
                <gco:CharacterString>3a6aadb9595f4c6d86800b1ed0abf745</gco:CharacterString>
            </mcc:code>
        </mcc:MD_Identifier>
    </mdb:metadataIdentifier>
    <mdb:defaultLocale>
        <lan:PT_Locale>
            <lan:language>
                <lan:LanguageCode codeList="http://www.loc.gov/standards/iso639-2/php/code_list.php" codeListValue="eng">eng</lan:LanguageCode>
            </lan:language>
            <lan:characterEncoding>
                <lan:MD_CharacterSetCode codeList="standards.iso.org/19115/-3/lan/1.0/codelists.xml#MD_CharacterSetCode" codeListValue="utf8">utf8</lan:MD_CharacterSetCode>
            </lan:characterEncoding>
        </lan:PT_Locale>
    </mdb:defaultLocale>
    <mdb:metadataScope>
        <mdb:MD_MetadataScope>
            <mdb:resourceScope>
                <mcc:MD_ScopeCode codeList="standards.iso.org/19115/-3/lan/1.0/codelists.xml#MD_ScopeCode" codeListValue="dataset">dataset</mcc:MD_ScopeCode>
            </mdb:resourceScope>
        </mdb:MD_MetadataScope>
    </mdb:metadataScope>
    <mdb:contact>
        <cit:CI_Responsibility>
            <cit:role>
                <cit:CI_RoleCode codeList="standards.iso.org/19115/-3/lan/1.0/codelists.xml#CI_RoleCode" codeListValue="custodian">custodian</cit:CI_RoleCode>
            </cit:role>
            <cit:party>
                <cit:CI_Organisation>
                    <cit:name>
                        <gco:CharacterString>Ontario Ministry of Natural Resources and Forestry</gco:CharacterString>
                    </cit:name>
                    <cit:contactInfo>
                        <cit:CI_Contact>
                            <cit:phone>
                                <cit:CI_Telephone>
                                    <cit:number>
                                        <gco:CharacterString>1 (705) 755-5975</gco:CharacterString>
                                    </cit:number>
                                    <cit:numberType>
                                        <cit:CI_TelephoneTypeCode codeList="standards.iso.org/19115/-3/lan/1.0/codelists.xml#CI_TelephoneTypeCode" codeListValue="voice">voice</cit:CI_TelephoneTypeCode>
                                    </cit:numberType>
                                </cit:CI_Telephone>
                            </cit:phone>
                            <cit:address>
                                <cit:CI_Address>
                                    <cit:deliveryPoint>
                                        <gco:CharacterString>300 Water Street, 2nd floor, North Tower</gco:CharacterString>
                                    </cit:deliveryPoint>
                                    <cit:city>
                                        <gco:CharacterString>Peterborough</gco:CharacterString>
                                    </cit:city>
                                    <cit:administrativeArea>
                                        <gco:CharacterString>Ontario</gco:CharacterString>
                                    </cit:administrativeArea>
                                    <cit:postalCode>
                                        <gco:CharacterString>K9J 3C7</gco:CharacterString>
                                    </cit:postalCode>
                                    <cit:country>
                                        <lan:CountryCode codeList="http://www.iso.org/iso/country_codes/iso_3166_code_lists.htm" codeListValue="CA">CA</lan:CountryCode>
                                    </cit:country>
                                    <cit:electronicMailAddress>
                                        <gco:CharacterString>adam.hogg@ontario.ca</gco:CharacterString>
                                    </cit:electronicMailAddress>
                                </cit:CI_Address>
                            </cit:address>
                        </cit:CI_Contact>
                    </cit:contactInfo>
                    <cit:individual>
                        <cit:CI_Individual>
                            <cit:name>
                                <gco:CharacterString>Adam Hogg</gco:CharacterString>
                            </cit:name>
                            <cit:positionName>
                                <gco:CharacterString>Spatial Data Acquisition Specialist</gco:CharacterString>
                            </cit:positionName>
                        </cit:CI_Individual>
                    </cit:individual>
                </cit:CI_Organisation>
            </cit:party>
        </cit:CI_Responsibility>
    </mdb:contact>
    <mdb:dateInfo>
        <cit:CI_Date>
            <cit:date>
                <gco:DateTime>2021-03-08T00:00:00</gco:DateTime>
            </cit:date>
            <cit:dateType>
                <cit:CI_DateTypeCode codeList="standards.iso.org/19115/-3/lan/1.0/codelists.xml#CI_DateTypeCode" codeListValue="revision">revision</cit:CI_DateTypeCode>
            </cit:dateType>
        </cit:CI_Date>
    </mdb:dateInfo>
    <mdb:metadataStandard>
        <cit:CI_Citation>
            <cit:title>
                <gco:CharacterString>ISO 19115-3 Geographic Information - Metadata - Part 1: Fundamentals</gco:CharacterString>
            </cit:title>
            <cit:edition>
                <gco:CharacterString>2014</gco:CharacterString>
            </cit:edition>
        </cit:CI_Citation>
    </mdb:metadataStandard>
    <mdb:referenceSystemInfo>
        <mrs:MD_ReferenceSystem>
            <mrs:referenceSystemIdentifier>
                <mcc:MD_Identifier>
                    <mcc:code>
                        <gco:CharacterString>Grid CS = Geographic (Lat, Long); Map Proj = Not Applicable; Horiz. Datum = NAD83; Vert. Datum = Not Applicable</gco:CharacterString>
                    </mcc:code>
                </mcc:MD_Identifier>
            </mrs:referenceSystemIdentifier>
        </mrs:MD_ReferenceSystem>
    </mdb:referenceSystemInfo>
    <mdb:identificationInfo>
        <mri:MD_DataIdentification>
            <mri:citation>
                <cit:CI_Citation>
                    <cit:title>
                        <gco:CharacterString>Ecodistricts</gco:CharacterString>
                    </cit:title>
                    <cit:alternateTitle>
                        <gco:CharacterString>ECODISTR</gco:CharacterString>
                    </cit:alternateTitle>
                    <cit:date>
                        <cit:CI_Date>
                            <cit:date>
                                <gco:DateTime>2007-01-01T00:00:00</gco:DateTime>
                            </cit:date>
                            <cit:dateType>
                                <cit:CI_DateTypeCode codeList="standards.iso.org/19115/-3/lan/1.0/codelists.xml#CI_DateTypeCode" codeListValue="creation">creation</cit:CI_DateTypeCode>
                            </cit:dateType>
                        </cit:CI_Date>
                    </cit:date>
                    <cit:date>
                        <cit:CI_Date>
                            <cit:date>
                                <gco:DateTime>2018-10-25T07:38:43-05:00</gco:DateTime>
                            </cit:date>
                            <cit:dateType>
                                <cit:CI_DateTypeCode codeList="standards.iso.org/19115/-3/lan/1.0/codelists.xml#CI_DateTypeCode" codeListValue="revision">revision</cit:CI_DateTypeCode>
                            </cit:dateType>
                        </cit:CI_Date>
                    </cit:date>
                    <cit:identifier>
                        <mcc:MD_Identifier>
                            <mcc:authority>
                                <cit:CI_Citation>
                                    <cit:title>
                                        <gco:CharacterString>LIO Metadata Management Tool UUID</gco:CharacterString>
                                    </cit:title>
                                    <cit:date>
                                        <cit:CI_Date>
                                            <cit:date>
                                                <gco:DateTime>2019-04-11T14:52:57.122476</gco:DateTime>
                                            </cit:date>
                                            <cit:dateType>
                                                <cit:CI_DateTypeCode codeList="standards.iso.org/19115/-3/lan/1.0/codelists.xml#CI_DateTypeCode" codeListValue="publication">publication</cit:CI_DateTypeCode>
                                            </cit:dateType>
                                        </cit:CI_Date>
                                    </cit:date>
                                </cit:CI_Citation>
                            </mcc:authority>
                            <mcc:code>
                                <gco:CharacterString>948bfc19-33d9-4006-abe2-64a74786bc2e</gco:CharacterString>
                            </mcc:code>
                        </mcc:MD_Identifier>
                    </cit:identifier>
                    <cit:identifier>
                        <mcc:MD_Identifier>
                            <mcc:authority>
                                <cit:CI_Citation>
                                    <cit:title>
                                        <gco:CharacterString>LIO Concrete Class Short Name</gco:CharacterString>
                                    </cit:title>
                                    <cit:date>
                                        <cit:CI_Date>
                                            <cit:date>
                                                <gco:DateTime>2019-04-11T14:52:57.132470</gco:DateTime>
                                            </cit:date>
                                            <cit:dateType>
                                                <cit:CI_DateTypeCode codeList="standards.iso.org/19115/-3/lan/1.0/codelists.xml#CI_DateTypeCode" codeListValue="publication">publication</cit:CI_DateTypeCode>
                                            </cit:dateType>
                                        </cit:CI_Date>
                                    </cit:date>
                                </cit:CI_Citation>
                            </mcc:authority>
                            <mcc:code>
                                <gco:CharacterString>ECODISTR</gco:CharacterString>
                            </mcc:code>
                        </mcc:MD_Identifier>
                    </cit:identifier>
                    <cit:identifier>
                        <mcc:MD_Identifier>
                            <mcc:authority>
                                <cit:CI_Citation>
                                    <cit:title>
                                        <gco:CharacterString>Ontario GeoHub French Record ID</gco:CharacterString>
                                    </cit:title>
                                    <cit:date>
                                        <cit:CI_Date>
                                            <cit:date>
                                                <gco:DateTime>2020-01-02T16:12:04.189939</gco:DateTime>
                                            </cit:date>
                                            <cit:dateType>
                                                <cit:CI_DateTypeCode codeList="standards.iso.org/19115/-3/lan/1.0/codelists.xml#CI_DateTypeCode" codeListValue="publication">publication</cit:CI_DateTypeCode>
                                            </cit:dateType>
                                        </cit:CI_Date>
                                    </cit:date>
                                </cit:CI_Citation>
                            </mcc:authority>
                            <mcc:code>
                                <gco:CharacterString>735bf703bd354430aee37ea07ed74e23_15</gco:CharacterString>
                            </mcc:code>
                        </mcc:MD_Identifier>
                    </cit:identifier>
                    <cit:citedResponsibleParty>
                        <cit:CI_Responsibility>
                            <cit:role>
                                <cit:CI_RoleCode codeList="standards.iso.org/19115/-3/lan/1.0/codelists.xml#CI_RoleCode" codeListValue="publisher">publisher</cit:CI_RoleCode>
                            </cit:role>
                            <cit:party>
                                <cit:CI_Organisation>
                                    <cit:name>
                                        <gco:CharacterString>Ontario Ministry of Natural Resources and Forestry</gco:CharacterString>
                                    </cit:name>
                                </cit:CI_Organisation>
                            </cit:party>
                        </cit:CI_Responsibility>
                    </cit:citedResponsibleParty>
                    <cit:onlineResource>
                        <cit:CI_OnlineResource>
                            <cit:linkage>
                                <gco:CharacterString>https://www.gisapplication.lrc.gov.on.ca/fmedatadownload/Packages/fgdb/ECODISTR.zip</gco:CharacterString>
                            </cit:linkage>
                            <cit:protocol gco:nilReason="missing"/>
                            <cit:name>
                                <gco:CharacterString>Complete File Geodatabase</gco:CharacterString>
                            </cit:name>
                        </cit:CI_OnlineResource>
                    </cit:onlineResource>
                    <cit:onlineResource>
                        <cit:CI_OnlineResource>
                            <cit:linkage>
                                <gco:CharacterString>https://www.gisapplication.lrc.gov.on.ca/fmedatadownload/Packages/ECODISTR.zip</gco:CharacterString>
                            </cit:linkage>
                            <cit:protocol gco:nilReason="missing"/>
                            <cit:name>
                                <gco:CharacterString>Complete Shapefile</gco:CharacterString>
                            </cit:name>
                        </cit:CI_OnlineResource>
                    </cit:onlineResource>
                    <cit:onlineResource>
                        <cit:CI_OnlineResource>
                            <cit:linkage>
                                <gco:CharacterString>https://www.publicdocs.mnr.gov.on.ca/mirb/lio-open-qlr-eng/ecodistrict.qlr</gco:CharacterString>
                            </cit:linkage>
                            <cit:protocol gco:nilReason="missing"/>
                            <cit:name>
                                <gco:CharacterString>QGIS Layer Definition File (.qlr)</gco:CharacterString>
                            </cit:name>
                        </cit:CI_OnlineResource>
                    </cit:onlineResource>
                </cit:CI_Citation>
            </mri:citation>
            <mri:abstract>
                <gco:CharacterString>
This dataset is used to:
assess biodiversity levels
define seed zones
map ecosystem types
set targets for the identification of natural heritage systems
 
  
 Additional Documentation 

EcoDistrict - Documentation
EcoDistrict - Data Description
 
   Status Completed: production of the data has been completed     Maintenance and Update Frequency  As needed: data is updated as deemed necessary     Contact  Adam Hogg, adam.hogg@ontario.ca  </gco:CharacterString>
            </mri:abstract>
            <mri:purpose>
                <gco:CharacterString>Defines the ecodistricts in the province of Ontario.</gco:CharacterString>
            </mri:purpose>
            <mri:credit>
                <gco:CharacterString>Open Government Licence – Ontario</gco:CharacterString>
            </mri:credit>
            <mri:status>
                <mcc:MD_ProgressCode codeList="standards.iso.org/19115/-3/lan/1.0/codelists.xml#MD_ProgressCode" codeListValue="completed">completed</mcc:MD_ProgressCode>
            </mri:status>
            <mri:pointOfContact>
                <cit:CI_Responsibility>
                    <cit:role>
                        <cit:CI_RoleCode codeList="standards.iso.org/19115/-3/lan/1.0/codelists.xml#CI_RoleCode" codeListValue="publisher">publisher</cit:CI_RoleCode>
                    </cit:role>
                    <cit:party>
                        <cit:CI_Organisation>
                            <cit:name>
                                <gco:CharacterString>Ontario Ministry of Natural Resources and Forestry</gco:CharacterString>
                            </cit:name>
                            <cit:contactInfo>
                                <cit:CI_Contact>
                                    <cit:address>
                                        <cit:CI_Address>
                                            <cit:administrativeArea>
                                                <gco:CharacterString>Ontario</gco:CharacterString>
                                            </cit:administrativeArea>
                                            <cit:postalCode>
                                                <gco:CharacterString>P6A 2E5</gco:CharacterString>
                                            </cit:postalCode>
                                            <cit:country>
                                                <lan:CountryCode codeList="http://www.iso.org/iso/country_codes/iso_3166_code_lists.htm" codeListValue="CA">CA</lan:CountryCode>
                                            </cit:country>
                                            <cit:electronicMailAddress>
                                                <gco:CharacterString>adam.hogg@ontario.ca</gco:CharacterString>
                                            </cit:electronicMailAddress>
                                        </cit:CI_Address>
                                    </cit:address>
                                </cit:CI_Contact>
                            </cit:contactInfo>
                            <cit:individual>
                  
```

## Topic 5/Parking lot/Parking lot.prj
```
GEOGCS["GCS_WGS_1984",DATUM["D_WGS_1984",SPHEROID["WGS_1984",6378137.0,298.257223563]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]]
```

## Topic 5/PWQMN_data_2024.csv
rows: 107082  columns: 11

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| Unnamed: 0 | object | 107082 | 168 | 08/21/2024, 09/16/2024, 09/17/2024, 10/29/2024 |
| 7:20:00 | object | 107082 | 522 | 7:54:00, 12:53:00, 13:57:00, 9:22:00 |
| 16954 | int64 | 107082 | 537 | 16954, 17441, 18183, 14684 |
| 16954010 | int64 | 107082 | 3713 | 16954011, 17441005, 17441006, 17441007 |
| <2 | object | 107082 | 5198 | <1, 2.31, 30.5, 54.9 |
| µg/L | object | 103597 | 8 | µg/L, mg/L, µS/cm, mg/L as CaCO3 |
| BDL | object | 107082 | 2 | BDL, Detected |
| 2 | float64 | 103392 | 50 | 1.0, 0.02, 0.01, 0.5 |
| E3497 | object | 107082 | 17 | E3497, E3566, E3218, E3364 |
| < | object | 28689 | 1 | < |
| Unnamed: 10 | object | 288 | 12 | X2, RRV, X5, AHS |

Numeric summary:
```
             count          mean          std           min          25%         50%         75%         max
16954     107082.0  1.641064e+04     1218.403  1.394100e+04     15405.00     16334.0     17441.0     18801.0
16954010  107082.0  1.641065e+07  1218402.982  1.394100e+07  15405009.00  16334001.0  17441002.0  18801002.0
2         103392.0  1.503000e+00        3.539  1.000000e-03         0.05         0.5         2.0       180.0
```

First 5 rows:
```
                                Unnamed: 0   7:20:00  16954  16954010    <2  µg/L       BDL     2  E3497    < Unnamed: 10
5311 2024 6007605002 Zirconium  08/21/2024   7:54:00  16954  16954011    <1  µg/L       BDL  1.00  E3497    <         NaN
5312 2024 4001301702 Potassium  09/16/2024  12:53:00  17441  17441005  2.31  mg/L  Detected  0.02  E3497  NaN         NaN
5313 2024 4001301702 Magnesium  09/16/2024  12:53:00  17441  17441005  30.5  mg/L  Detected  0.01  E3497  NaN         NaN
5314 2024 4001301702 Manganese  09/16/2024  12:53:00  17441  17441005  54.9  µg/L  Detected  0.50  E3497  NaN         NaN
5315 2024 4001301702 Strontium  09/16/2024  12:53:00  17441  17441005   318  µg/L  Detected  0.30  E3497  NaN         NaN
```

## Topic 5/PWQMN_FieldData_2021-2022_Final.csv
rows: 6744  columns: 13

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| Year | int64 | 6744 | 2 | 2021, 2022 |
| Conservation Authority | object | 6744 | 84 |  Ausable Bayfield,  Cataraqui,  Catfish,  Central Lake Ont |
| Collection Site | int64 | 6744 | 446 | 8002201602, 8002100202, 8004000202, 8002202002 |
| Lab Workorder ID | int64 | 6744 | 924 | 1262, 1264, 1490, 1514 |
| Collection Date | object | 6744 | 285 | 04/20/2021, 05/17/2021, 05/18/2021, 06/13/2021 |
| Collection Time | object | 6744 | 578 | 8:00:00, 0:00:00, 9:30:00, 8:30:00 |
| Lab Sample ID | int64 | 6744 | 6627 | 1262001, 1262006, 1262003, 1262009 |
| Specific Conductance uS cm 1 | float64 | 5675 | 2487 | 542.0, 571.0, 577.0, 546.0 |
| Water Temperature C | float64 | 6645 | 453 | 8.6, 11.1, 7.1, 10.7 |
| Dissolved Oxygen mgl | float64 | 6544 | 1175 | 10.26, 10.61, 10.68, 11.02 |
| Field PH | float64 | 6331 | 399 | 9.48, 8.52, 8.49, 8.58 |
| Turb FNU | float64 | 6379 | 1692 | 6.94, 17.29, -0.53, 13.63 |
| Field Data Remark | object | 63 | 7 | No field data; equipment being repaired, Unreliable pH; equipment issues, Unreliable turbidity; equipment issues, pH probe removed due to low temperature |

Numeric summary:
```
                               count          mean           std           min           25%           50%           75%           max
Year                          6744.0  2.021512e+03  5.000000e-01  2.021000e+03  2.021000e+03  2.022000e+03  2.022000e+03  2.022000e+03
Collection Site               6744.0  1.023858e+10  5.783589e+09  1.010400e+09  6.001701e+09  8.012305e+09  1.601841e+10  1.900640e+10
Lab Workorder ID              6744.0  4.605433e+03  2.336678e+03  1.005000e+03  2.480000e+03  4.641500e+03  6.636000e+03  8.850000e+03
Lab Sample ID                 6744.0  4.605399e+06  2.336668e+06  1.005001e+06  2.480010e+06  4.641504e+06  6.636003e+06  8.850001e+06
Specific Conductance uS cm 1  5675.0  6.176690e+02  4.696690e+02  0.000000e+00  4.020000e+02  5.500000e+02  7.200000e+02  9.127000e+03
Water Temperature C           6645.0  1.407300e+01  7.169000e+00 -3.000000e+00  8.400000e+00  1.510000e+01  2.020000e+01  3.260000e+01
Dissolved Oxygen mgl          6544.0  1.007400e+01  2.558000e+00  1.000000e-02  8.500000e+00  1.000000e+01  1.181000e+01  2.763000e+01
Field PH                      6331.0  8.029000e+00  6.570000e-01  0.000000e+00  7.790000e+00  8.070000e+00  8.300000e+00  1.295000e+01
Turb FNU                      6379.0  1.169500e+01  3.843100e+01 -8.500000e+00  1.130000e+00  3.000000e+00  8.500000e+00  8.630000e+02
```

First 5 rows:
```
   Year Conservation Authority  Collection Site  Lab Workorder ID Collection Date Collection Time  Lab Sample ID  Specific Conductance uS cm 1  Water Temperature C  Dissolved Oxygen mgl  Field PH  Turb FNU Field Data Remark
0  2021       Ausable Bayfield       8002201602              1262      04/20/2021         8:00:00        1262001                         542.0                  8.6                 10.26      9.48      6.94               NaN
1  2021       Ausable Bayfield       8002100202              1262      04/20/2021         0:00:00        1262006                         571.0                 11.1                 10.61      8.52     17.29               NaN
2  2021       Ausable Bayfield       8004000202              1262      04/20/2021         9:30:00        1262003                         577.0                  7.1                 10.68      8.49     -0.53               NaN
3  2021       Ausable Bayfield       8002202002              1262      04/20/2021         0:00:00        1262009                         546.0                 10.7                 11.02      8.58     13.63               NaN
4  2021       Ausable Bayfield       8002201202              1262      04/20/2021         0:00:00        1262007                         538.0                  9.8                 11.05      8.57     25.51               NaN
```

## Topic 5/PWQMN_Stations.csv
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

## Topic 5/Sampling area/Sampling area.prj
```
GEOGCS["GCS_WGS_1984",DATUM["D_WGS_1984",SPHEROID["WGS_1984",6378137.0,298.257223563]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]]
```

## Topic 5/Water_Edges/Water_Edges.prj
```
PROJCS["NAD_1983_UTM_Zone_17N",GEOGCS["GCS_North_American_1983",DATUM["D_North_American_1983",SPHEROID["GRS_1980",6378137.0,298.257222101]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]],PROJECTION["Transverse_Mercator"],PARAMETER["False_Easting",500000.0],PARAMETER["False_Northing",0.0],PARAMETER["Central_Meridian",-81.0],PARAMETER["Scale_Factor",0.9996],PARAMETER["Latitude_Of_Origin",0.0],UNIT["Meter",1.0]]
```