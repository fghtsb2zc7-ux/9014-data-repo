# 06 - Ecosystem services/SOLRIS 3.0.zip (zip, 7 entries)

| member | bytes |
|---|---|
| SOLRIS 3.0.cpg | 5 |
| SOLRIS 3.0.csv | 10456858 |
| SOLRIS 3.0.dbf | 46720670 |
| SOLRIS 3.0.prj | 499 |
| SOLRIS 3.0.qmd | 2110 |
| SOLRIS 3.0.shp | 27183972 |
| SOLRIS 3.0.shx | 558788 |

## SOLRIS 3.0.csv
rows: 69836  columns: 11

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| OBJECTID | int64 | 69836 | 69836 | 1, 2, 3, 4 |
| CHANGE_DIRECTION | object | 69836 | 114 | Woodland to Undifferentiated, Built Up Area-Impervious to Extraction-A, Woodland to Extraction-Aggregate, Extraction-Aggregate to Undifferentiated |
| CHANGE_TYPE | object | 69835 | 5 | Woodland Loss, Non-Vegetation Transition, Wetland Loss, Vegetation Transition |
| CHANGE_PERIOD | float64 | 69835 | 4 | 3.0, 1.0, 2.0, 0.0 |
| CHANGE_DATES | object | 69835 | 24 | 2011-2015, 2011-2016, 2010-2017, 2009-2015 |
| CHANGE_CAUSE | object | 69835 | 5 | Other-Anthropogenic, Cut, Weather, Other-Natural |
| CONFIDENCE_EXISTENCE | object | 69835 | 4 | High, Confirmed, Medium, Low |
| CONFIDENCE_CAUSE | object | 69835 | 4 | High, Low, Medium, Confirmed |
| VERIFICATION | object | 69836 | 1 | True Change |
| Shape_Length | float64 | 69836 | 2412 | 299.999999970198, 389.999999992549, 329.999999947846, 330.000000007451 |
| Shape_Area | float64 | 69836 | 10875 | 5399.99999910593, 5175.00000005588, 3599.99999955297, 4275.00000005588 |

Numeric summary:
```
                 count       mean        std    min       25%      50%       75%        max
OBJECTID       69836.0  34918.500  20160.061    1.0  17459.75  34918.5  52377.25    69836.0
CHANGE_PERIOD  69835.0      2.395      0.906    0.0      2.00      3.0      3.00        3.0
Shape_Length   69836.0    573.434    627.616   60.0    270.00    420.0    690.00    20610.0
Shape_Area     69836.0  11864.027  33490.607  225.0   2475.00   5400.0  11475.00  1542600.0
```

First 5 rows:
```
   OBJECTID                                  CHANGE_DIRECTION                CHANGE_TYPE  CHANGE_PERIOD CHANGE_DATES         CHANGE_CAUSE CONFIDENCE_EXISTENCE CONFIDENCE_CAUSE VERIFICATION  Shape_Length   Shape_Area
0         1                      Woodland to Undifferentiated              Woodland Loss            3.0    2011-2015  Other-Anthropogenic                 High             High  True Change         300.0  5399.999999
1         2  Built Up Area-Impervious to Extraction-Aggregate  Non-Vegetation Transition            3.0    2011-2015  Other-Anthropogenic                 High             High  True Change         390.0  5175.000000
2         3                  Woodland to Extraction-Aggregate              Woodland Loss            3.0    2011-2015  Other-Anthropogenic                 High             High  True Change         330.0  3600.000000
3         4                  Woodland to Extraction-Aggregate              Woodland Loss            3.0    2011-2015  Other-Anthropogenic                 High             High  True Change         330.0  4275.000000
4         5                  Woodland to Extraction-Aggregate              Woodland Loss            3.0    2011-2015  Other-Anthropogenic                 High             High  True Change         180.0  1800.000000
```

## SOLRIS 3.0.prj
```
PROJCS["NAD_1983_CSRS_Ontario_MNR_Lambert",GEOGCS["GCS_North_American_1983_CSRS",DATUM["D_North_American_1983_CSRS",SPHEROID["GRS_1980",6378137.0,298.257222101]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]],PROJECTION["Lambert_Conformal_Conic"],PARAMETER["False_Easting",930000.0],PARAMETER["False_Northing",6430000.0],PARAMETER["Central_Meridian",-85.0],PARAMETER["Standard_Parallel_1",44.5],PARAMETER["Standard_Parallel_2",53.5],PARAMETER["Latitude_Of_Origin",0.0],UNIT["Meter",1.0]]
```

## SOLRIS 3.0.qmd
```
<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.32.3-Lima">
  <identifier>SOLRIS_Version_3_0_Changes_2000to2015_LAMBERT</identifier>
  <parentidentifier></parentidentifier>
  <language>ENG</language>
  <type>dataset</type>
  <title>SOLRIS_Version_3_0_Changes_2000to2015_LAMBERT</title>
  <abstract></abstract>
  <links/>
  <dates/>
  <fees></fees>
  <encoding></encoding>
  <crs>
    <spatialrefsys nativeFormat="Wkt">
      <wkt>PROJCRS["NAD83(CSRS) / Ontario MNR Lambert",BASEGEOGCRS["NAD83(CSRS)",DATUM["NAD83 Canadian Spatial Reference System",ELLIPSOID["GRS 1980",6378137,298.257222101,LENGTHUNIT["metre",1]]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],ID["EPSG",4617]],CONVERSION["Ontario MNR Lambert",METHOD["Lambert Conic Conformal (2SP)",ID["EPSG",9802]],PARAMETER["Latitude of false origin",0,ANGLEUNIT["degree",0.0174532925199433],ID["EPSG",8821]],PARAMETER["Longitude of false origin",-85,ANGLEUNIT["degree",0.0174532925199433],ID["EPSG",8822]],PARAMETER["Latitude of 1st standard parallel",44.5,ANGLEUNIT["degree",0.0174532925199433],ID["EPSG",8823]],PARAMETER["Latitude of 2nd standard parallel",53.5,ANGLEUNIT["degree",0.0174532925199433],ID["EPSG",8824]],PARAMETER["Easting at false origin",930000,LENGTHUNIT["metre",1],ID["EPSG",8826]],PARAMETER["Northing at false origin",6430000,LENGTHUNIT["metre",1],ID["EPSG",8827]]],CS[Cartesian,2],AXIS["(E)",east,ORDER[1],LENGTHUNIT["metre",1]],AXIS["(N)",north,ORDER[2],LENGTHUNIT["metre",1]],USAGE[SCOPE["Province-wide spatial data management."],AREA["Canada - Ontario."],BBOX[41.67,-95.16,56.9,-74.35]],ID["EPSG",3162]]</wkt>
      <proj4>+proj=lcc +lat_0=0 +lon_0=-85 +lat_1=44.5 +lat_2=53.5 +x_0=930000 +y_0=6430000 +ellps=GRS80 +units=m +no_defs</proj4>
      <srsid>1122</srsid>
      <srid>3162</srid>
      <authid>EPSG:3162</authid>
      <description>NAD83(CSRS) / Ontario MNR Lambert</description>
      <projectionacronym>lcc</projectionacronym>
      <ellipsoidacronym>EPSG:7019</ellipsoidacronym>
      <geographicflag>false</geographicflag>
    </spatialrefsys>
  </crs>
  <extent/>
</qgis>

```