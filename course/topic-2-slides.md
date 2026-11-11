# Topic 2 slides ("02 - Topic 2") - transcription

- Source: `sources/files/02 - Topic 2.pdf` (12 pages, image-only), posted in module "Unit 1 Classes: Core Technical
  Skills > Class 2 - Animals on the Move: Tracking Animal Movement Across Seascapes" (manifest topic 3962804).
  Transcribed from page images `_raw/pdf_pages/02 - Topic 2/p-01.jpg` ... `p-12.jpg`.
- Class: Class 2 (Sept 14, 2026) - lecture "Animals on the Move" plus review of Topic 1 and sourcing open data. See
  [classes.md](classes.md#class-2).
- Descriptions of pictures are in square brackets; on-slide text is quoted as written.

## Slide 1 - Title

"ENVRSUST 9014" / "Environmental Data Analysis and Visualization" / "Dr Paul Mensink". [Same clip-art title slide
as Class 1: butterfly, container ship, factory, trees, shark.]

## Slide 2 - Workflow diagram

[R for Data Science workflow: "Program" box with "Import" -> "Tidy" -> "Transform"; "Explore" loop "Transform" ->
"Visualise" -> "Model"; then "Communicate"; "Data collection" box with dashed arrow into Import.] Numbered circles:
1 (grey) on Import, 2 (blue) on Tidy, 3 (red) on Transform/Explore, 4 (red) on Data collection. Footer: "ENVRSUST
9014"; credit "R for Data Science https://r4ds.had.co.nz/index.html".

## Slide 3 - Section divider

"Take-up and review Topic 1"

## Slide 4 - Section divider

"Sourcing open data"

## Slide 5 - Basking shark tracks (research example)

[Four map panels "Shark 1" ... "Shark 4" of the NE Atlantic showing tracks coloured by month (legend "Month": Jul,
Aug, Sep, Oct, Nov, Dec), "Maximum likelihood track", "50% probability density", "95% probability density"; scale
bars. Shark 1 travels from Scotland south to about 15 N off West Africa; Shark 2 from Ireland to Iberia/NW Africa;
Shark 3 stays NW of Ireland/Scotland; Shark 4 around Ireland and the Irish Sea.]
Paper header shown: Environ Biol Fish, https://doi.org/10.1007/s10641-021-01202-8, "Cool runnings: behavioural
plasticity and the realised thermal niche of basking sharks", E. M. Johnston, J. D. R. Houghton, P. A. Mayo,
G. K. F. Hatten, A. P. Klimley, P. J. Mensink.

## Slide 6 - Latitude, depth and temperature profiles

[Three rows x four columns of time-series plots (Aug-Jan), one column per shark.]
- Row 1 "Latitude": coloured by month (Jul, Aug, Sept, Oct, Nov, Dec).
- Row 2 "Depth (m)" 0-1200: legend "Min depth", "Max depth", "Min depth (MA)", "Max depth (MA)".
- Row 3 "Temperature (°C)": legend "Min temp", "Max temp", "Min temp (MA)", "Max temp (MA)".
(MA = moving average.) Sharks 1 and 2 dive to 600-1,000+ m during southward migration; sharks 3 and 4 stay shallow.

## Slide 7 - Diel vertical movement

[Two panels "Shark 1" (Aug 25 06:00 - Aug 31 18:00) and "Shark 2" (Sep 13 06:00 - Sep 18 18:00), y-axis "Depth
(m)" 0-1250; green line (minimum depth) and blue line (maximum depth) alternating every 12 h between near-surface
and about 500-750 m; inset shows the highlighted window within the full record.]

## Slide 8 - Step 1: Collect data and assign states

"1" - "Collect data on depth profiles using time-depth recorders (n=13 sharks)" [depth trace 0-60 m over
"Time (minutes)", 08-Aug 11:19 to 09-Aug 15:44, with shaded periods]. "Assign states based on relevant threats":
"S1" (red) "Vulnerable to ship strikes"; "S2" (blue) "Safe from ship strikes". [Cross-section diagram of the water
column: "Surface", "<2m Leisure and small commercial craft strike zone", "< 5m Drift net and large commercial
craft strike zone", "Mid water trawl zone", "Bottom set gill net zone", "Bottom trawl zone", "Sea Bed".]

## Slide 9 - Step 2: Model state transitions against irradiance

"2" - "Conceptualize a 2-state semi-Markov model": S1 <-> S2 with "Transition intensities (time spent in current
state and probability of next state occurring)".
"Obtain irradiance data for the time-depth recorder deployments" [photos: sunny sea, overcast sea]; "Weather data
can be easily obtained and downloaded retrospectively for previous time-depth recorder deployments from Met
Éireann and other data sources".
"Condition transition intensities on irradiance": [sun] "More likely to be at the surface under high irradiance" -
"Hazard ratio from state 2 to state 1: 12.01 (95% CI = 10.39, 13.88)"; [cloud] "Less likely to be at the surface
when irradiance is low" - "Hazard ratio from state 2 to state 1: 4.31 (95% CI = 3.76, 4.93)".

## Slide 10 - Step 3: Simulate and deploy

"3" - "Simulate the proportion of time spent in a vulnerable state" [histogram "Count" vs "Proportion of time spent
in vulnerable state (near surface)" 0.1-0.8, legend "Irradiance": Night, F = 1, F = 2, F = 3; note "(60 minute
period, N_sims = 1000)"; night near 0.1, higher irradiance shifts to 0.4-0.7].
"Provide adaptive and dynamic real-time management for stakeholders": [cloud] "Likelihood of boat strike low";
[sun] "Likelihood of boat strike high, reduce boat speed and avoid known hotspots"; [computer/cloud] "Predictions can
update with real-time changes in weather".
"Deploy information through phone app and website": "Inform recreational boat users about high risk"; "Instruct
commercial vessels to reduce speed"; "Suggest set times for fishing nets"; "Recommend preferred times for shoreline
ecotourism".

## Slide 11 - Capture, Mark & Recapture (CMR)

"Capture, Mark & Recapture (CMR)"
- "Animal captures & ID tag attached"
- "Recaptured at later date & ID noted"
- "Two known points of information"
- "CMR can identify:" "- site fidelity (to some extent)", "- long distance movement", "- mortality rates &
  population counts" (with "population counts" boxed).
[Photos: a gull with a leg band held in hand; a sea turtle with a tag.]

## Slide 12 - CMR example: Marine Sportfish tagging

"Capture, Mark & Recapture (CMR)" / "Marine Sportfish tagging system"
- "“Over 40,000 individual fish have been caught, measured, tagged and released over 50 years with over 3,000
  recaptures.”"
[Map of the North Atlantic (60 N - 30 N, 80 W - 10 E) with two blue circles (off Ireland and off Nova Scotia/NAFO
area labels 5Y, 5Ze, 4X, 4W); photo of a person holding a porbeagle shark on a boat; paper header: ICES Journal of
Marine Science (2019), 76(6), 1581-1590, doi:10.1093/icesjms/fsz046, Original Article "Population structure and
spatial distribution of porbeagles (Lamna nasus) in Irish waters", Luke W. J. Cameron, William K. Roche, Jonathan
D. R. Houghton, and Paul J. Mensink.]

Links this lecture to the [Irish Marine Sportfish Tagging Programme dataset](../datasets/irish-marine-sportfish-tagging.md)
used in the Class 2/3 case study, and to the basking-shark tag data in
[Class 2.zip](../datasets/class-2-basking-shark-tag-data.md).
