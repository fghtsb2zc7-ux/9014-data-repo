---
title: "QGIS - Case when for multiple conditions"
tool: qgis
duration: "04:10"
content_id: e34bef19-bc0c-451e-84a5-135fae66e441
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 3: Conditional logic, conditional calculations, and deterministic modelling"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=e34bef19-bc0c-451e-84a5-135fae66e441&revisionId=latest
---

# QGIS - Case when for multiple conditions — transcript

Duration 04:10. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:22]** NPRI geolocation points (grey) over "ESRI Gray (light)"; layer "NPRI-INRP_GeolocationsGeoloca...".
- **[00:32]** Pointer on the Field Calculator button (abacus icon) on the Attributes toolbar, immediately right of the Identify Features button (top toolbar row).
- **[00:42]** "NPRI-INRP_GeolocationsGeolocalisation_1993-present — Field Calculator": "Create virtual field" ticked/greyed; Output field name "Split latitudes"; Output field type "123 Integer (32 bit)" (not yet changed); length 10; message "This layer does not support adding new provider fields. You can only add virtual fields."
- **[00:52]** Output field type now "abc Text (string)"; "Conditionals" group expanded: CASE, coalesce, if, nullif, regexp_match, try.
- **[01:02]** CASE inserted as template:
  `CASE` / `WHEN condition THEN result` / (blank line) / `END` — hovering shows "Eval Error: Field 'condition' not found"; Preview "Expression is invalid".
- **[01:22]** `WHEN  "Latitude / Latitude" >55 THEN result` (field picked from Fields and Values, Latitude / Latitude).
- **[01:42]** Three WHEN lines copied: `> 55 THEN 'Far North'`, `> 50 THEN 'Far North'` (being edited), `> 55 THEN 'Far North'`; Preview 'Far North'.
- **[02:02]** `WHEN "Latitude / Latitude" > 55 THEN 'Far North'` / `WHEN "Latitude / Latitude" > 50 THEN 'North'` / `WHEN "Latitude / Latitude" > 45 THEN 'South'`.
- **[02:22]** `ELSE 'Unknown'` added before END; Preview momentarily "Expression is invalid" while typing.
- **[02:42]** Final expression (line breaks as shown):
  `CASE` / `WHEN "Latitude / Latitude" > 55 THEN 'Far North'` / `WHEN "Latitude / Latitude" > 50 THEN 'North'` / `WHEN "Latitude / Latitude" > 45 THEN 'South'` / `ELSE 'Unknown'` / `END`; Preview 'Far North'; OK.
- **[03:02]** Attribute table "Features Total: 24552, Filtered: 24552, Selected: 0" with columns "...tude_measurem..." (North/South), "Split", "Split latitudes" (South / Unknown / North values).
- **[03:22]** "Layer Properties ... — Symbology": "Categorized", Value "abc Split latitudes", Color ramp "Random colors", Classify button being clicked (list empty before classify).
- **[03:42]** Map coloured into 4 classes; legend Far North (yellow), North (pink), South (purple), Unknown (green — southern Ontario below 45°N), plus blank all-other-values.

## Transcript

**[00:06]** All right, so this is just a quick follow on from that if statement we used in the field calculator. Now we're going to use um something called a case when. Uh, so this happens in QJS and also in R, when you're trying to break up these multiple categories and how you can split those up. So, let's go into the uh vector, sorry, the fields calculator again for vector data. Um, we're going to create another column this time. It's going to be kind of what's called split latitudes. We're going to use latitude again, um, just

**[00:44]** because it's handy, but again, you'd probably be doing this on something else. OK, so we'll go into our conditional statements here and we're going to use something called case. Kind of gives us the layout of what that will look like, and we're just going to break this up a little bit. Easier to read, then we're going to create a few different conditions. So this basically in the case when this condition is met, and this condition is going to be fulfilled by looking at our fields and values and our latitude. So when latitude is greater than 55, we're going to say that this is called Far

**[01:28]** North. Ah, we're just gonna copy, oh oops, we're gonna copy that down. OK, ah, let's say when it's uh 50, we're gonna call it. North, let's say when it's um greater than 45, we're gonna call that. South, OK, so it's gonna be anything that's greater than 55, anything that's greater than 50, anything that's greater than 45, um, now we can end

**[02:04]** with something called an L statement. So it said everything else, anything else we're just gonna throw into this bin. So in this case we're gonna say anything else is just gonna be, um, you know, well, let's call it unknown for now, um, OK. Um, and it will break everything down, so this kind of case starts up at the top, we have these 3 kind of when statements that split up our data, and then we have this unknown if if it doesn't fall into those categories, so

**[02:37]** in this case if it's kind of. Further south than 45, it'll be kind of an unknown category in this case. Um, so let's just see if that works, so we're just gonna click apply, uh, we've changed this to a text string, we've called split latitudes, we apply. OK. Uh, and let's go into the attributes table. Let's slide over to the side. OK, cool. We've got our south, we've got unknown, we've got north. OK, great. So that seems to have worked, so that's good for us. Um, let's go into our symbology again. Uh, we're going to do categorize,

**[03:18]** so this time we're going to pick our split latitudes, which we just made. We're going to click classify. It's got all of our different categories there. OK, and now we can see that's all been split up. So again, you might do this for something like emissions quantity or let's say ones that are over a particular amount of releases over some sort of set provincial thresholds. There's lots of use cases for kind of split. up that continuous data. So this is just one way to try and try and do that as well. And again, you could do

**[03:54]** that for categorical variables as well. It's not just continuous, but this is often pretty handy to break up continuous data into categories that are easily interpretable within different contexts.
