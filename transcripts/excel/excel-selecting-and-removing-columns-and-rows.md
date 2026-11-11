---
title: "Excel - Selecting and removing columns and rows"
tool: excel
duration: "02:56"
content_id: 9c51baa5-97e6-4087-8fef-a283c9aa46b1
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 2: Transforming and wrangling data"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=9c51baa5-97e6-4087-8fef-a283c9aa46b1&revisionId=latest
---

# Excel - Selecting and removing columns and rows — transcript

Duration 02:56. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:32]** Data > From Text/CSV preview dialog "NPRI-INRP_DataDonnées_2024.csv" (File Origin "1252: Western European (Windows)", Delimiter "Comma", Data Type Detection "Based on first 200 rows"); Load / Transform Data / Cancel.
- **[00:42]** Power Query Editor (steps Source, Promoted Headers, Changed Type); pointer on `Home > Manage Columns > Choose Columns`.
- **[00:52]** "Choose Columns" dialog: "Choose the columns to keep", "Search Columns" box, sort button, checklist (scrolled to SCIAN 4 chiffres / NAICS 4 Code, Nom de secteur SCIAN 4..., SCIAN 6 chiffres / NAICS 6 Code, Nom de secteur SCIAN 6..., No CAS / CAS Number, Nom de substance (Anglais) / Substance Name..., Unités / Units, Émissions à l'air - ... / Air Emissions ..., Rejets à l'eau - ... / Water Releases ...); OK, Cancel.
- **[01:12]** Result: new step "Removed Other Columns"; formula `= Table.SelectColumns(#"Changed Type",{"Année / Year", "ID INRP / NPRI ID", "Ville / City", "Grand Total - Totale des rejets, éliminations et transferts pour recyclage / Grand Total - Total Releases"})`; only those 4 columns remain.
- **[01:22]** `Home > Reduce Rows > Remove Rows` dropdown: Remove Top Rows, Remove Bottom Rows, Remove Alternate Rows, Remove Duplicates, Remove Blank Rows, Remove Errors.
- **[01:32]** Tooltip on Remove Bottom Rows: "Remove the bottom N rows from ...".
- **[01:52]** "Remove Bottom Rows" dialog: "Specify how many rows to remove from the bottom."; field "Number of rows"; OK, Cancel (demonstration only - no step added).
- **[02:02]** Hovering "Remove Blank Rows" (tooltip "Remove all blank rows from this ...").
- **[02:12]** New step "Removed Blank Rows"; formula `= Table.SelectRows(#"Removed Other Columns", each not List.IsEmpty(List.RemoveMatchingItems(Record.FieldValues(_), {"", null})))`.
- **[02:22]** "Ville / City" column selected, then `Home > Manage Columns > Remove Columns`: new step "Removed Columns"; formula `= Table.RemoveColumns(#"Removed Blank Rows",{"Ville / City"})`; 3 columns remain (Année / Year, ID INRP / NPRI ID, Grand Total...).
- **[02:32]** Remove Rows dropdown again; tooltip on Remove Top Rows "Remove the top N rows from this ...".
- **[02:42]** Remove Rows menu shown with Remove Duplicates visible (narration only; no duplicates step applied in the frames).
- **[02:52]** Final APPLIED STEPS: Source, Promoted Headers, Changed Type, Removed Other Columns, Removed Blank Rows, Removed Columns.

## Transcript

**[00:05]** All right, in this video, we're gonna look at how we can manipulate things like the number of columns, the number of rows, how we remove blanks and things. So, it's very quick and easy within the Power Query editor, so that's where we're gonna get started. So we're gonna actually uh bring in our data here from Tech CSV again, as we've been doing, to the 2024 data again. Kind of a transform data and there's a whole panel in the ribbon at the top in order to be able to work with this. So we've got up here we've got managed

**[00:40]** columns, so we can choose the columns that we want to uh remove or include. So here we could go down and we could select all and we could choose maybe just some things that we're very interested in. So let's say we've got sort of our grand total from each of the facilities and maybe their location. So that will reduce and condense the data set um into something that's a little bit more manageable. Again, we lose some of the uh subtlety of the data here, so you'd want to be careful about reducing that, but that's

**[01:15]** something that is is very easy to do. Um, OK, so that's easy and then we want we can do remove rows. So, um, remove bottom rows is sometimes helpful. I was saying in another video there that at the bottom of data sets sometimes they'll include a bit of like almost like a metadata where it will be like. Hey, here this data was collected in this way. This was collected in this year by these it kind of gives a summary of the data set, but if you load that in for data analysis without removing that, so it, it causes the column data types to go all wonky. So here you could remove the bottom set of

**[01:49]** rows. So let's say it's the bottom 6 rows that contain that kind of metadata information. That would be easy to do here. Um, we can also remove any blank rows. So sometimes we might want to be like, OK, well let's get rid of any blanks or things that are missing. So we'll be able to do that, so that's no problem. So now we've got rid of that missing data, so we've just got a very complete data set that's in there. We can also remove rows very easily, so, uh sorry, remove columns, my apologies. Just like that. So all of these things you can kind of shape and crunch and and uh pick out the things that you want within your within your data set. Uh, within remove and keep rows, they

**[02:27]** both kind of got similar aspects. You can remove, let's say, the top rows, or sometimes there's a blank row before the column headers are there, so you can remove those. You can look for duplicates in the data, so you can remove any, uh, data points that may potentially be duplicates that are in there. So again. You know, a a few quick tools here on how to reshape and change your data in a way they may be condensing it or or or getting rid of any potential errors that are in there as well.
