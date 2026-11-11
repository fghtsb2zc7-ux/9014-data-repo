---
title: "QGIS - Merging vector layers and features"
tool: qgis
duration: "04:07"
content_id: 20878b22-2b5a-437b-930e-43e382fa7c61
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 7"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=20878b22-2b5a-437b-930e-43e382fa7c61&revisionId=latest
---

# QGIS - Merging vector layers and features — transcript

Duration 04:07. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:22]** Layer `municlow` (Ontario lower-tier municipalities, gold) loaded; status bar `EPSG:4269`; white holes visible.
- **[00:42]** Identify on London: `NAME` CITY OF LONDON, `DESCR` Single Tier Municipality, `MUNID` 39036, `MAH_CODE` 59101, ... ; small white holes = First Nation reserves (e.g. Chippewas of the Thames).
- **[01:02-01:12]** Layer `indianre` (First Nation reserves, green) added above `municlow`; reserves fill the holes.
- **[01:22]** Dialog "Vector General - Merge Vector Layers" (from `Vector > Data Management Tools > Merge Vector Layers...`): Input layers `0 input(s) selected` (then both layers ticked via the `...` button); Destination CRS [optional] empty; `Add source layer information (layer name and path)` checked; Merged `[Create temporary layer]`; Open output file checked. Help text: "...combines multiple vector layers of the same geometry type into a single one... If fields with the same name but different types are found then the exported field will be automatically converted into a string type field... If [Destination CRS] is not set, the CRS will be taken from the first input layer. All layers will all be reprojected to match this CRS."
- **[01:32]** New layer `Merged` (brown) above `indianre` and `municlow`; no holes.
- **[01:42-01:52]** Identify on `Merged` (London): municipality fields plus two new fields `layer` = municlow and `path` = C:/Users/... (source information). `Merged`, `indianre`, `municlow` selected for removal.
- **[02:12]** Layer `wtrshter` (Ontario tertiary watersheds, red) loaded, `EPSG:4269`.
- **[02:32]** Identify: `NAME` Lower Thames, `DESCR` "Watershed, Tertiary", `GUT_NUMBER` 1271, `IDENT` 02GE, `LABEL` Lower Thames.
- **[02:52]** Toggle Editing on (`wtrshter` shows pencil icon); "Select Features by area or single click" tool; status "1 feature selected on layer wtrshter (Lower Thames)."
- **[03:02]** Upper Thames and Lower Thames both selected (yellow), Shift-click.
- **[03:12]** Cursor on the Advanced Digitizing toolbar button tooltip "...Merge Selected Features".
- **[03:22]** Dialog "Merge Features": rows Id 36 (Upper Thames, 02GD) and 37 (Lower Thames, 02GE) and a "Merge" row; each column has a drop-down (`Feature 36`, `Manual Value`, ...); LABEL set to Manual Value and being edited; buttons "Take attributes from selected feature", "Take attributes from feature with the largest area", "Skip all fields", "Remove feature from selection"; OK / Cancel.
- **[03:32-03:42]** Merge row values: `LABEL` "...r Watershed" (Thames River Watershed), `IDENT` `02GD-2` (Manual Value), `NAME` "Thames Riv..." being typed (Manual Value); other columns keep `Feature 36` values (e.g. `GUT_NUMBER` 1271, `AVG_USE` Low). OK.
- **[03:52-04:02]** One click selects the whole merged watershed: status bar "1 feature selected on layer wtrshter (Thames River Watershed)." Layer is still in edit mode (edits not yet saved; course page note: uncheck the pencil to save).

## Transcript

**[00:06]** All right, so in this video we're going to talk about merging vector layers and merging features within vector layers. So, uh, first thing we're going to do is we're going to load up our municipality data set again. OK. I'm just going to zoom in on that. OK. You can see there are kind of gaps in that vector layer for the municipalities, and that is because, um, these are First Nation reserves here. So when we click on our identified features here, here's London, and just

**[00:42]** to the sort of southwest of us is where we went to Chippewa, the Thames. So we do have another vector layer that I've given you that actually has information about where the reserves are located. OK. Um, and that's added in there. So now we can see the gold is our municipalities, the green is where the First Nation communities are located. So in this case, we, let's say we were doing a big analysis, um, across our all of our locations here. We want to combine. these together. Well, we can easily do that by just merging vector

**[01:16]** layers. So we go to vector, data management tools, we go to merge vector layers. We simply go and select the two vector layers that we have currently in the data set, click run. Great, and then hit close. OK, so now we have a new layer that has information from both of those vector layers within it. So now we have that, um, we've got London there as well, so you can see that now that's all been put into a single um vector layer for us to try and do processing on later. OK. Uh, OK, so now I want to show you how we can merge vector features. So

**[01:54]** I'm just going to get rid of the layers that we just created there. And now we're going to upload um watershed data. So this is all of the watersheds, you know, you've talked about this in within ecosystem health a lot. Um, so we'll just zoom back in here, you can see that where London is, uh, is where we have the uh Upper Thames River watershed, and then down here we have the uh Lower Thames River watershed there. Sorry, just selecting multiple features on me there. As the Lower Thames River watershed. So what we

**[02:29]** might want to do is actually combine these two, together, so we kind of have the Thames River watershed completely. And so these are separated right now. What we want to do is try to combine those. So we're just going to click on this. We're going to click edit. We are going to use a selection feature tool here. Yeah. That's the lower Thames and I'm just gonna hold shift here and select Upper Thames.

**[03:02]** Now we've got both of them selected. So once we've got the editing feature on there, what we can do is we can go to this button here which is merge selected features. OK, we'll bring up this pop-up box where, OK, here are the IDs of the two features, Upper Thames, Lower Thames, uh, what do we want it to actually be named, we can actually rename it here. OK, so we can actually rename it there, OK, uh, we can give it a new ID if we want, OK, and um we can give it our new name.

**[03:44]** OK, so we can put, we can put all that in there, click OK. All right, so now when we go to select that layer. It will select the entire watershed, OK? So that's really cool, so that allows us to kind of merge these vector features uh together within one layer.
