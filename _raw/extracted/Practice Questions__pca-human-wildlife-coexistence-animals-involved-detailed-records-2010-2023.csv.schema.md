# Practice Questions/pca-human-wildlife-coexistence-animals-involved-detailed-records-2010-2023.csv

rows: 103310  columns: 14

| column | dtype | non-null | unique | example values |
|---|---|---|---|---|
| Incident Number | object | 103310 | 87068 | BAN2010-0003, JNP2010-0011, JNP2010-0015, JNP2010-0023 |
| Incident Date | object | 103310 | 5036 | 2010-01-01, 2010-01-02, 2010-01-03, 2010-01-04 |
| Field Unit | object | 103310 | 32 | Banff Field Unit, Jasper Field Unit, Lake Louise, Yoho and Kootenay Field Uni, Coastal British Columbia Field Unit |
| Protected Heritage Area | object | 103310 | 68 | Banff National Park of Canada, Jasper National Park of Canada, Pacific Rim National Park Reserve of Can, Prince Albert National Park of Canada |
| Incident Type | object | 103310 | 9 | Human Wildlife Interaction, Rescued/Recovered/Found Wildlife, Attractant, Domestic Animal |
| Species Common Name | object | 101040 | 358 | Coyote, Elk, Wolf, White-tailed Deer |
| Sum of Number of Animals | int64 | 103310 | 122 | 2, 1, 3, 0 |
| Animal Health Status | object | 53738 | 10 | Healthy, Dead, Not Located, Injured |
| Cause of Animal Health Status | object | 18485 | 18 | Predation, Collision, Unknown, Management Destruction |
| Animal Behaviour | object | 63966 | 26 | Avoidance, Physical or Aggressive Display, Contact-Property, Indifferent to People/Vehicles |
| Reason for Animal Behaviour | object | 40988 | 21 | Surprise, Unknown, Defence of Space, Habituation |
| Animal Attractant | object | 35961 | 22 | Prey animal (natural), Grain, Unknown, Human food |
| Deterrents Used | object | 27335 | 31 | Presence of Officer/Person, Lethal Round - Rimfire, Lethal Round - Centrefire, Other |
| Animal Response to Deterrents | object | 19092 | 10 | Retreat - Run, Retreat - Walk, Indifferent, Not Applicable |

Numeric summary:
```
                             count   mean     std  min  25%  50%  75%     max
Sum of Number of Animals  103310.0  2.664  14.007  0.0  1.0  1.0  1.0  2001.0
```

First 5 rows:
```
  Incident Number Incident Date         Field Unit         Protected Heritage Area                     Incident Type Species Common Name  Sum of Number of Animals Animal Health Status Cause of Animal Health Status Animal Behaviour Reason for Animal Behaviour      Animal Attractant             Deterrents Used Animal Response to Deterrents
0    BAN2010-0003    2010-01-01   Banff Field Unit   Banff National Park of Canada        Human Wildlife Interaction              Coyote                         2              Healthy                           NaN        Avoidance                    Surprise  Prey animal (natural)  Presence of Officer/Person                           NaN
1    BAN2010-0003    2010-01-01   Banff Field Unit   Banff National Park of Canada        Human Wildlife Interaction                 Elk                         1                 Dead                     Predation              NaN                         NaN                    NaN                         NaN                           NaN
2    BAN2010-0003    2010-01-01   Banff Field Unit   Banff National Park of Canada        Human Wildlife Interaction                Wolf                         3          Not Located                           NaN              NaN                         NaN  Prey animal (natural)                         NaN                           NaN
3    JNP2010-0011    2010-01-01  Jasper Field Unit  Jasper National Park of Canada  Rescued/Recovered/Found Wildlife   White-tailed Deer                         1                 Dead                     Collision              NaN                         NaN                    NaN                         NaN                           NaN
4    JNP2010-0015    2010-01-01  Jasper Field Unit  Jasper National Park of Canada                        Attractant                 NaN                         0                  NaN                           NaN              NaN                         NaN                  Grain                         NaN                           NaN
```