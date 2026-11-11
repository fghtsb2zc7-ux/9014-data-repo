# NPRI data.zip — corrected schema profiles

Encodings and line endings detected with `file`. The Windows-encoded files are cp1252 with a few stray undefined bytes, so read them with `encoding="cp1252", encoding_errors="replace"` (pandas ≥1.3) or `encoding="latin-1"` as profiled here; in R use `read_csv(..., locale = locale(encoding = "windows-1252"))`. Geolocations and Data 2024 use CR-only (classic Mac) line endings. Profiles from up to 200,000 rows (row count is exact).



## NPRI-INRP_ReleasesRejets_1993-present.csv

read with: `pd.read_csv(..., encoding='utf-8-sig')`  
rows: 1,048,575  columns: 18

| # | column (exact header) | dtype | non-null (sample) | unique (sample) | examples |
|---|---|---|---|---|---|
| 1 | Reporting_Year / Année | int64 | 200000 | 4 | 2024, 2023, 2022 |
| 2 | NPRI_ID / No_INRP | int64 | 200000 | 9172 | 1, 11, 15 |
| 3 | Company_Name / Dénomination_sociale_de_l'entreprise | object | 200000 | 2428 | Alberta-Pacific Forest Industries I, Hexion Canada Inc., Dofasco Inc., Stelco Inc. |
| 4 | Facility_Name / Installation | object | 199972 | 9736 | Alberta-Pacific Forest Industries I, Hexion Canada Inc.- Edmonton Facili, Baycoat |
| 5 | NAICS / Code_SCIAN | int64 | 200000 | 298 | 322112, 325210, 332810 |
| 6 | NAICS Title EN / Titre Code SCIAN EN | object | 199994 | 299 | Chemical pulp mills, Resin and synthetic rubber manufact, Coating, engraving, cold and heat t |
| 7 | NAICS Title FR / Titre Code SCIAN FR | object | 199994 | 299 | Usines de pâte chimique, Fabrication de résines et de caoutc, Revêtement, gravure, traitement the |
| 8 | PROVINCE | object | 199861 | 13 | AB, ON, QC |
| 9 | CAS_Number / No_CAS | object | 200000 | 196 | 100-42-5, 108-10-1, 11104-93-1 |
| 10 | Substance Name (English) / Nom de substance (Anglais) | object | 200000 | 197 | Styrene, Methyl isobutyl ketone, Nitrogen oxides (expressed as nitro |
| 11 | Substance Name (French) / Nom de substance (Français) | object | 200000 | 197 | Styrène, Méthylisobutylcétone, Oxydes d'azote (exprimés en dioxyde |
| 12 | Group (English) / Groupe (Anglais) | object | 200000 | 4 | Releases to Air, Releases to Land, Releases to Water Bodies |
| 13 | Group (French) / Groupe (Français) | object | 200000 | 4 | Rejets à l'air, Rejets dans le sol, Rejets dans l'eau |
| 14 | Category (English) / Catégorie (Anglais) | object | 200000 | 10 | Stack / Point, Fugitive, Spills |
| 15 | Category (French) / Catégorie (Français) | object | 200000 | 10 | Rejets de cheminée ou ponctuels, Émissions fugitives, Déversements |
| 16 | Quantity / Quantité | float64 | 200000 | 98393 | 1.24, 0.364, 1.615 |
| 17 | Units / Unités | object | 200000 | 4 | tonnes, grams, kg |
| 18 | Estimation_Method / Méthode_d’estimation | object | 194222 | 9 | E2 - Published Emission Factors, M3 - Source Testing, C - Mass Balance |

## NPRI-INRP_GeolocationsGeolocalisation_1993-present.csv

read with: `pd.read_csv(..., encoding='latin-1', lineterminator='\r')`  
rows: 24,554  columns: 39

| # | column (exact header) | dtype | non-null (sample) | unique (sample) | examples |
|---|---|---|---|---|---|
| 1 | Year of last filed report / Année de déclaration la plus récente | object | 24554 | 34 | 
1994, 
2015, 
1993 |
| 2 | NPRI ID / ID INRP | float64 | 24552 | 24543 | 4636.0, 4638.0, 4572.0 |
| 3 | Company Name / Raison Sociale | object | 24552 | 6034 | ICI SUPERIOR EXPLOSIVES - CONISTON , Teledyne Harfac, EDC INC.(EASTERN DIE CASTING INC.) |
| 4 | Facility Name / Nom de l'installation | object | 24137 | 23657 | Centrale de réserve de Scheffervill, Cynthia 07-19, Usine Atwater |
| 5 | Address line 1 / Première ligne dadresse | object | 13388 | 12651 | CONISTON HYDRO ROAD, 15 Brydon Drive, 2020 PLACE THIMENS |
| 6 | Address line 2 / Deuxième ligne dadresse | object | 457 | 417 | P.O. Box 2087, Box 402, L.C.D. #1, 2306 - 8 St. |
| 7 | City / Ville | object | 14679 | 4271 | CONISTON, REXDALE, ST.LAURENT |
| 8 | Province / Province | object | 24551 | 13 | ON, QC, AB |
| 9 | Postal Code / Code postal | object | 11011 | 7905 | P0M1M0, M9W4M8, H4R1L1 |
| 10 | Physical Land Survey Description / Description de l'arpentage | object | 18208 | 16182 | 15-14-067-21-E8, 07-19-049-10-W5, 04-15-055-02-W5 |
| 11 | National Topographical Description / Description topographique nationale | object | 24543 | 21683 | C-067-K/041-I-7, C-056-I/030-M-12, B-016-B/031-H-12 |
| 12 | Latitude / Latitude | float64 | 24552 | 21843 | 46.4731, 43.7134, 45.5105 |
| 13 | Longitude / Longitude | float64 | 24552 | 22875 | -80.8313, -79.5709, -73.6941 |
| 14 | Datum / Datum | float64 | 24552 | 1 | 1983.0 |
| 15 | NAICS / Code SCIAN | float64 | 24552 | 391 | 325920.0, 332619.0, 331490.0 |
| 16 | NAICS Code Title (English) / Titre Code SCIAN (Anglais) | object | 24488 | 673 | Explosives Manufacturing, Other Fabricated Wire Product Manuf, Non-Ferrous Metal (except Copper an |
| 17 | NAICS Code Title (French) / Titre Code SCIAN (Francais) | object | 24441 | 420 | Fabrication d'explosifs, Fabrication d'autres produits en fi, Laminage, étirage, extrusion et all |
| 18 | Key Industrial Sector Code / Code des Secteurs industriels clés | float64 | 24552 | 20 | 3.0, 11.0, 7.0 |
| 19 | Key Industrial Sector (English) / Secteurs industriels clés (Anglais) | object | 24489 | 19 | Chemicals, Other Manufacturing, Metals (Except Aluminum and Iron an |
| 20 | Key Industrial Sector (French) / Secteurs industriels clés (Français) | object | 24489 | 19 | Produits chimiques
, Autres fabrication
, Métaux (sauf aluminium et fer et ac |
| 21 | Census Division (CD) Unique ID / No unique de la Division de recensement (DR) | float64 | 24534 | 292 | 3553.0, 3520.0, 2466.0 |
| 22 | Census Division (CD) Name / Nom de la Division de recensement (DR) | object | 24534 | 237 | Greater Sudbury / Grand Sudbury, Toronto, Montréal |
| 23 | Census Sub Division (CSD) Unique ID / No unique de la Subdivision de recensement (SDR) | float64 | 24534 | 1655 | 3553005.0, 3520005.0, 2466023.0 |
| 24 | Census Sub Division (CSD) Name / Nom de la Subdivision de recensement (SDR) | object | 24534 | 1626 | Greater Sudbury / Grand Sudbury, Toronto, Montréal |
| 25 | Census Metropolitan Area (CMA) Unique ID / No unique de la Région métropolitaine de recensement (RMR) | float64 | 8099 | 149 | 580.0, 535.0, 462.0 |
| 26 | Census Metropolitan Area (CMA) Name / Nom de la Région métropolitaine de recensement (RMR) | object | 24534 | 153 | Greater Sudbury / Grand Sudbury, Toronto, Montréal |
| 27 | Economic Region (ER) Unique ID / No unique de la Région économique (RE) | float64 | 24534 | 76 | 3590.0, 3530.0, 2440.0 |
| 28 | Economic Region (ER) Name / Nom de la Région économique (RE) | object | 24534 | 75 | Northeast / Nord-est, Toronto, Montréal |
| 29 | Forward Sortation Area (FSA) / Région de tri d'acheminement (RTA) | object | 24551 | 1210 | P0M, M9W, H4R |
| 30 | Ecozone Unique ID / No unique de lécozone | float64 | 24551 | 16 | 6.0, 8.0, 5.0 |
| 31 | English Ecozone Name / Nom anglais de lécozone | object | 24551 | 16 | Boreal Shield, Mixedwood Plain, Taiga Shield |
| 32 | French Ecozone Name / Nom français de lécozone | object | 24551 | 16 | Bouclier boréal, Plaines à forêts mixtes, Taïga du Bouclier |
| 33 | Unique ID of the Major Drainage Area from the Water Survey of Canada (WSC) / No unique de laire de drainage principale des Relevés hydrologiques du Canada (RHC) | float64 | 24547 | 12 | 2.0, 3.0, 7.0 |
| 34 | Major Drainage Area English Name / Nom anglais de laire de drainage principale | object | 24547 | 12 | St. Lawrence Drainage Area, Northern Québec and Labrador Draina, Great Slave Lake Drainage Area |
| 35 | Major Drainage Area French Name / Nom français de laire de drainage principale | object | 24547 | 12 | Aire de drainage du Saint-Laurent, Aire de drainage du Nord du Québec , Aire de drainage du Grand lac des E |
| 36 | Sulphur Oxide Management Area (SOMA) / Zone de gestion des oxydes de soufre (ZGOS) | float64 | 24552 | 2 | 1.0, 0.0 |
| 37 | Ontario Pollution Emission Management Area (PEMA) / Zone de gestion des émission de polluants (ZGEP) de l'Ontario | float64 | 24552 | 2 | 1.0, 0.0 |
| 38 | Quebec Pollution Emission Management Area (PEMA) / Zone de gestion des émission de polluants (ZGEP) du Québec | float64 | 24552 | 2 | 0.0, 1.0 |
| 39 | Quebec City-Windsor Corridor / Corridor Québec-Windsor | float64 | 24552 | 2 | 0.0, 1.0 |

## NPRI-INRP_IndustryIndustrie_Air_2015-2024.csv

read with: `pd.read_csv(..., encoding='latin-1')`  
rows: 1,322  columns: 6

| # | column (exact header) | dtype | non-null (sample) | unique (sample) | examples |
|---|---|---|---|---|---|
| 1 | Industry (English) / Industrie (Anglais) | object | 1322 | 147 | Aerospace product and parts manufac, Agricultural supplies merchant whol, Agricultural, construction and mini |
| 2 | Industry (French) / Industrie (Français) | object | 1322 | 147 | Fabrication de produits aérospatiau, Grossistes-marchands de fournitures, Fabrication de machines pour l'agri |
| 3 | Year / Année | int64 | 1322 | 10 | 2019, 2018, 2021 |
| 4 | NAICS Number / Numéro SCIAN | int64 | 1322 | 147 | 3364, 4183, 3331 |
| 5 | Total - Releases to Air (tonnes) / Total - Rejets dans l'air (tonnes) | float64 | 1322 | 1288 | 1056.15044824, 1023.8397498, 729.27763481 |
| 6 | Facility Count / Nombres d'installations | int64 | 1322 | 147 | 36, 37, 34 |

## NPRI-INRP_CommentsCommentaires_1997-present.csv

read with: `pd.read_csv(..., encoding='latin-1')`  
rows: 423,112  columns: 14

| # | column (exact header) | dtype | non-null (sample) | unique (sample) | examples |
|---|---|---|---|---|---|
| 1 | Reporting_Year / Année | int64 | 200000 | 9 | 2024, 2023, 2022 |
| 2 | NPRI_ID / No_INRP | int64 | 200000 | 8925 | 1, 279, 442 |
| 3 | Company_Name / Dénomination_sociale_de_l'entreprise | object | 200000 | 3243 | Alberta-Pacific Forest Industries I, Kraft Nordic, s.e.c., Imperial Oil Resources Limited |
| 4 | Facility_Name / Installation | object | 199943 | 10437 | Alberta-Pacific Forest Industries I, Kraft Nordic, s.e.c. - Usine de pât, Cold Lake |
| 5 | NAICS / Code_SCIAN | int64 | 200000 | 323 | 322112, 211141, 331410 |
| 6 | NAICS Title EN / Titre Code SCIAN EN | object | 199353 | 327 | Chemical pulp mills, In-situ oil sands extraction, Non-ferrous metal (except aluminum) |
| 7 | NAICS Title FR / Titre Code SCIAN FR | object | 199353 | 326 | Usines de pâte chimique, Extraction in situ de sables bitumi, Fonte et affinage de métaux non fer |
| 8 | PROVINCE | object | 199751 | 13 | AB, QC, ON |
| 9 | CAS_Number / No_CAS | object | 200000 | 216 | 108-10-1, 120-80-9, 50-00-0 |
| 10 | Substance Name (English) / Nom de substance (Anglais) | object | 200000 | 217 | Methyl isobutyl ketone, Catechol, Formaldehyde |
| 11 | Substance Name (French) / Nom de substance (Français) | object | 200000 | 217 | Méthylisobutylcétone, Catéchol, Formaldéhyde |
| 12 | Comment_Type_Name (English) Type_de_commentaire (Anglais) | object | 200000 | 8 | On-site releases comment, Reason why substance was added to t, Recycling comment |
| 13 | Comment_Type_Name (French) Type_de_commentaire (Français) | object | 200000 | 8 | Commentaire sur les rejets sur le s, Raison pour laquelle la substance a, Commentaire sur le recyclage  |
| 14 | Comment / Commentaires | object | 197465 | 71279 | Changed estimation method for 2024,, Estimated quantity "released to lan, Changed estimation method for 2024, |

## NPRI-INRP_DataDonnées_2024.csv

read with: `pd.read_csv(..., encoding='latin-1', lineterminator='\r')`  
rows: 59,557  columns: 77

| # | column (exact header) | dtype | non-null (sample) | unique (sample) | examples |
|---|---|---|---|---|---|
| 1 | Année / Year | object | 59557 | 2 | 
2024, 
 |
| 2 | ID INRP / NPRI ID | float64 | 59555 | 7738 | 1.0, 11.0, 15.0 |
| 3 | Entreprise / Company Name | object | 59555 | 2301 | Alberta-Pacific Forest Industries I, Hexion Canada Inc., Dofasco Inc., Stelco Inc. |
| 4 | Nom de l'installation / Facility Name | object | 59539 | 7622 | Alberta-Pacific Forest Industries I, Hexion Canada Inc.- Edmonton Facili, Baycoat |
| 5 | Ville / City | object | 43090 | 1732 | County of Athabasca, Edmonton, Hamilton |
| 6 | SDR / CSD | object | 59413 | 1147 | Athabasca County, Edmonton, Hamilton |
| 7 | AR ou RMR / CA or CMA | object | 59413 | 142 |  , Edmonton, Hamilton |
| 8 | Région économique / Economic Region | object | 59413 | 75 | Athabasca--Grande Prairie--Peace Ri, Edmonton, Hamilton--Niagara Peninsula |
| 9 | Province / Province | object | 59453 | 13 | AB, ON, QC |
| 10 | Code postal / Postal Code | object | 38085 | 3561 | T0A 0M0, T5V 1E1, L8N 3K7 |
| 11 | Écozone terrestre (Anglais) / Terrestrial ecozone (English) | object | 59453 | 16 | Boreal Plain, Prairie, Mixedwood Plain |
| 12 | Écozone terrestre (Français) / Terrestrial Ecozone (French) | object | 59453 | 16 | Plaines boréales, Prairies, Plaines à forêts mixtes |
| 13 | Bassin hydrographique (Anglais) / Watershed (English) | object | 59447 | 12 | Great Slave Lake Drainage Area, Nelson River Drainage Area, St. Lawrence Drainage Area |
| 14 | Bassin hydrographique (Français) / Watershed (French) | object | 59447 | 12 | Aire de drainage du Grand lac des E, Aire de drainage du fleuve Nelson, Aire de drainage du Saint-Laurent |
| 15 | Latitude / Latitude | float64 | 59485 | 7563 | 54.923116, 53.5823, 43.24119 |
| 16 | Longitude / Longitude | float64 | 59485 | 7610 | -112.861867, -113.5886, -79.74945 |
| 17 | SCIAN 4 chiffres / NAICS 4 Code | float64 | 59555 | 144 | 3221.0, 3252.0, 3328.0 |
| 18 | Nom de secteur SCIAN 4 (Anglais) / NAICS 4 Sector Name (English) | object | 59555 | 144 | Pulp, paper and paperboard mills, Resin, synthetic rubber, and artifi, Coating, engraving, cold and heat t |
| 19 | Nom de secteur SCIAN 4 (Français) / NAICS 4 Sector Name (French) | object | 59555 | 144 | Usines de pâte à papier, de papier , Fabrication de résines, de caoutcho, Revêtement, gravure, traitement the |
| 20 | SCIAN 6 chiffres / NAICS 6 Code | float64 | 59555 | 312 | 322112.0, 325210.0, 332810.0 |
| 21 | Nom de secteur SCIAN 6 (Anglais) / NAICS 6 Sector Name (English) | object | 59555 | 312 | Chemical pulp mills, Resin and synthetic rubber manufact, Coating, engraving, cold and heat t |
| 22 | Nom de secteur SCIAN 6 (Français) / NAICS 6 Sector Name (French) | object | 59555 | 312 | Usines de pâte chimique, Fabrication de résines et de caoutc, Revêtement, gravure, traitement the |
| 23 | No CAS / CAS Number | object | 59555 | 247 | 129-00-0, NA - M09, NA - M14 |
| 24 | Nom de substance (Anglais) / Substance Name (English) | object | 59555 | 265 | Pyrene, PM10 - Particulate Matter <= 10 Mic, Total reduced sulphur (expressed as |
| 25 | Nom de substance (Français) / Substance Name (French) | object | 59555 | 265 | Pyrène, PM10 - Matière particulaire <= 10 m, Soufre réduit total (exprimé sous f |
| 26 | Unités / Units | object | 59555 | 4 | kg, tonnes, g TEQ |
| 27 | Émissions à l'air - Émissions de cheminées / Air Emissions - Stack Emissions | float64 | 30726 | 19826 | 111.07, 25.73, 1.25 |
| 28 | Émissions à l'air - Stockage / manutention / Air Emissions - Storage / Handling | float64 | 4983 | 3434 | 0.38, 2.3143, 0.5005 |
| 29 | Émissions à l'air - Émissions fugitives / Air Emissions - Fugitive Emissions | float64 | 7555 | 5720 | 0.296, 6.11, 0.364 |
| 30 | Émissions à l'air - Déversements / Air Emissions - Spills | float64 | 579 | 215 | 3.59, 0.01, 0.3 |
| 31 | Émissions à l'air - Autres / Air Emissions - Other | float64 | 982 | 653 | 0.005565, 5e-06, 2e-06 |
| 32 | Émissions à l'air - Totale / Air Emissions - Total | float64 | 51196 | 32309 | 111.366, 31.84, 1.25 |
| 33 | Rejets à l'eau - Évacuations directes / Water Releases - Direct Discharge | float64 | 2474 | 2148 | 0.19, 2.77, 6.75 |
| 34 | Rejets à l'eau - Déversements / Water Releases - Spills | float64 | 137 | 126 | 0.2, 0.1522, 0.242 |
| 35 | Rejets à l'eau - Fuites / Water Releases - Leaks | float64 | 48 | 46 | 0.343, 0.02012, 0.0655 |
| 36 | Rejets à l'eau - Totale / Water Releases - Total | float64 | 2536 | 2197 | 0.19, 2.77, 6.75 |
| 37 | Rejets à l'eau - Plan d'eau récepteur (Anglais) / Water Releases - Receiving Waterbody (English) | object | 2618 | 317 | Athabasca River, Ruisseau Dormenan, Otonabee River |
| 38 | Rejets à l'eau - Plan d'eau récepteur (Français) / Water Releases - Receiving Waterbody (French) | object | 2618 | 317 | Athabasca River, Ruisseau Dormenan, Otonabee River |
| 39 | Rejets au sol - Déversements / Land Releases - Spills | float64 | 215 | 176 | 0.071, 0.0006, 0.0606 |
| 40 | Rejets au sol - Fuites / Land Releases - Leaks | float64 | 19 | 11 | 0.0, 34.766, 124.471 |
| 41 | Rejets au sol - Autres / Land Releases - Other | float64 | 161 | 149 | 116.43, 192.17, 35.46 |
| 42 | Rejets au sol - Totalee / Land Releases - Total | float64 | 383 | 330 | 0.071, 0.0006, 0.0606 |
| 43 | Rejets totaux - Rejets totaux (excluant les poussières de routes) / Total Releases - Total Releases (Excluding Road Dust) | float64 | 37612 | 24781 | 111.366, 31.84, 1.25 |
| 44 | Rejets totaux - Émissions de poussières de routes / Total Releases - Road Dust Emissions | float64 | 2038 | 1795 | 6.765, 25.629, 0.677 |
| 45 | Rejets totaux - Rejets totaux incluant les poussières de routes / Total Releases - Total Releases Including Road Dust | float64 | 42799 | 25128 | 0.0, 118.131, 31.84 |
| 46 | Élimination sur le site - Enfouissement / On-Site Disposal - Land Fill | float64 | 737 | 683 | 0.32, 0.007419, 54.47 |
| 47 | Élimination sur le site - Épandage / On-Site Disposal - Land Treatment | float64 | 178 | 138 | 0.3107, 14.29, 28.29 |
| 48 | Élimination sur le site - Injections souterraines / On-Site Disposal - Underground Injection | float64 | 513 | 484 | 2.695636, 0.0099, 0.0252 |
| 49 | Élimination sur le site - Résidus miniers / On-Site Disposal - Tailings | float64 | 1164 | 1116 | 61.47, 959.47, 226929.22 |
| 50 | Élimination sur le site - Stériles / On-Site Disposal - Waste Rock | float64 | 383 | 363 | 1.09, 44.3, 2690.06 |
| 51 | Élimination sur le site - Totale sur le site / On-Site Disposal - Total On-Site | float64 | 2577 | 2436 | 0.32, 0.007419, 54.47 |
| 52 | Élimination hors site - Confinement, enfouissement / Off-Site Disposal - Land Fill | float64 | 2542 | 2244 | 0.0504, 0.0076, 2.7936 |
| 53 | Élimination hors site - Épandage / Off-Site Disposal - Land Treatment | float64 | 602 | 587 | 0.000637, 2.85, 0.06 |
| 54 | Élimination hors site - Injections souterraines / Off-Site Disposal - Underground Injection | float64 | 493 | 442 | 54.109419, 0.075068, 0.062784 |
| 55 | Élimination hors site - Confinement, autre stockage / Off-Site Disposal - Storage | float64 | 541 | 506 | 0.0003, 0.0798, 258.9 |
| 56 | Élimination hors site - Résidus miniers / Off-Site Disposal - Tailings | float64 | 37 | 36 | 0.3, 227.0, 1.0 |
| 57 | Élimination hors site - Stériles / Off-Site Disposal - Waste Rock | float64 | 7 | 7 | 25412.7, 46.44, 0.787 |
| 58 | Élimination hors site - Totale hors site / Off-Site Disposal - Total Off-Site | float64 | 3674 | 3235 | 0.000637, 2.85, 0.06 |
| 59 | Transferts pour traitement - Traitement physique / Transfers for Treatment - Physical Treatment | float64 | 604 | 567 | 0.399856, 2.06244, 0.668575 |
| 60 | Transferts pour traitement - Traitement chimique / Transfers for Treatment - Chemical Treatment | float64 | 666 | 627 | 1.27, 43.79, 10226.0 |
| 61 | Transferts pour traitement - Traitement biologique / Transfers for Treatment - Biological Treatment | float64 | 137 | 131 | 0.11757, 5.53661, 1.5733 |
| 62 | Transferts pour traitement - Incinération / Transfers for Treatment - Incineration | float64 | 830 | 729 | 0.63, 3.62, 0.01 |
| 63 | Transferts pour traitement - Transfert aux usines municipales d'épuration / Transfers for Treatment - Transfer to a Municipal Sewage Treatment Plant | float64 | 602 | 527 | 0.003281, 0.0421, 0.000111 |
| 64 | Transferts pour traitement - Totale / Transfers for Treatment - Total | float64 | 2439 | 2101 | 0.003281, 0.0421, 0.000111 |
| 65 | Élimination sur le site, hors site et pour traitement totale - Totale  / Total On-Site, Off-Site and Treatment Disposal - Total | float64 | 6923 | 6104 | 0.32, 0.008056, 57.32 |
| 66 | Transferts pour recyclage - Récupération d'énergie / Transfers for Recycling - Energy Recovery | float64 | 369 | 335 | 0.85, 0.04, 0.09 |
| 67 | Transferts pour recyclage - Récupération de solvants / Transfers for Recycling - Solvent Recovery | float64 | 367 | 333 | 8.7112, 107.257, 48.674 |
| 68 | Transferts pour recyclage - Récupération de substances organiques / Transfers for Recycling - Organic Compound Recovery | float64 | 504 | 464 | 2.536, 1.465, 0.153858 |
| 69 | Transferts pour recyclage - Récupération de métaux / Transfers for Recycling - Metal Recovery | float64 | 1099 | 1041 | 179.9, 55.6, 6.74 |
| 70 | Transferts pour recyclage - Récupération des matières inorganiques / Transfers for Recycling - Inorganic Compound Recovery | float64 | 78 | 71 | 9.6659, 3.948, 7.6 |
| 71 | Transferts pour recyclage - Récupération des acides et des bases  / Transfers for Recycling - Acid or Base Recovery | float64 | 28 | 28 | 3929.144, 14.91, 2.2864 |
| 72 | Transferts pour recyclage - Récupération des catalyseurs / Transfers for Recycling - Catalyst Recovery | float64 | 59 | 56 | 1238.336, 684.18064, 260.05056 |
| 73 | Transferts pour recyclage - Récupération des résidus de dépollution / Transfers for Recycling - Pollution Abatement Residue Recovery | float64 | 103 | 102 | 18.37, 2.609, 14.39 |
| 74 | Transferts pour recyclage - Raffinage ou réutilisation des huiles usées / Transfers for Recycling - Used Oil Recovery | float64 | 468 | 430 | 4e-05, 0.000333, 9.8e-05 |
| 75 | Transferts pour recyclage - Autres / Transfers for Recycling - Other | float64 | 553 | 499 | 35.89, 18.9, 0.0193 |
| 76 | Transferts pour recyclage - Totale / Transfers for Recycling - Total | float64 | 3004 | 2707 | 2.536, 1.465, 8.7112 |
| 77 | Grand Total - Totale des rejets, éliminations et transferts pour recyclage / Grand Total - Total Releases | float64 | 59555 | 37801 | 0.0, 118.131, 31.84 |
