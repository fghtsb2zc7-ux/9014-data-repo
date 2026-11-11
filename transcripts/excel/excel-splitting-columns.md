---
title: "Excel - Splitting columns"
tool: excel
duration: "04:21"
content_id: d55fd099-23e7-46f2-b4c0-7ed5550c75ae
transcript_source: brightspace-captions
linked_from: ["Videos organized by software", "Topic 2: Transforming and wrangling data"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=d55fd099-23e7-46f2-b4c0-7ed5550c75ae&revisionId=latest
---

# Excel - Splitting columns — transcript

Duration 04:21. Source: auto-generated Brightspace captions (may contain speech-recognition errors).

## Visual notes (from video frames)
- **[00:42]** Blank workbook "Book3", Data tab, pointer on `From Text/CSV` (file NPRI-INRP_DataDonnées_2024.csv; preview dialog not captured, then Transform Data).
- **[01:02]** Power Query Editor "NPRI-INRP_DataDonnées_2024"; APPLIED STEPS Source, Promoted Headers, Changed Type; scrolled right past Province / Province, Code postal / Postal Code, Écozone terrestre..., Bassin hydrographique... columns.
- **[01:22]** NAICS columns visible: "SCIAN 4 chiffres / NAICS 4 Code" (3221), "Nom de secteur SCIAN 4 (Anglais) / NAICS 4 Sector Name (En..." ("Pulp, paper and paperboard mills"), "Nom de secteur SCIAN 4 (Français)..." ("Usines de pâte à papier, de papier et de carton"), "SCIAN 6 chiffres / NAICS 6 Code" (322112), "Nom de secteur SCIAN 6..." ("Chemical pulp mills"). Cell value preview at bottom: 322112.
- **[01:42]** "SCIAN 6 chiffres / NAICS 6 Code" column selected (1²3, ribbon "Data Type: Whole Number").
- **[02:02]** Right-click on that column header: Copy, Remove, Remove Other Columns, Duplicate Column, Add Column From Examples..., Remove Duplicates, Remove Errors, Change Type >, Transform >, Replace Values..., Replace Errors..., Create Data Type, Group By..., Fill >, Unpivot Columns, Unpivot Other Columns, Unpivot Only Selected Columns, Rename..., Move >, Drill Down.
- **[02:12]** After "Duplicate Column": new step "Duplicated Column"; formula `= Table.DuplicateColumn(#"Changed Type", "SCIAN 6 chiffres / NAICS 6 Code", "SCIAN 6 chiffres / NAICS 6 Code - Copy")`; new column "SCIAN 6 chiffres / NAICS 6 Code - Copy" at the far right (selected).
- **[02:22]** `Home > Transform > Split Column` dropdown open.
- **[03:02]** Split Column menu fully visible: By Delimiter, By Number of Characters, By Positions, By Lowercase to Uppercase, By Uppercase to Lowercase, By Digit to Non-Digit, By Non-Digit to Digit.
- **[03:22]** Tooltip: "Split Column by Digit to Non-Digit - Split the values in the selected column based on transitions from a digit to a non-digit character."
- **[03:42]** Dialog "Split Column by Number of Characters": "Specify the number of characters used to split the text column."; field "Number of characters"; "Split" options "Once, as far left as possible" (being selected), "Once, as far right as possible", "Repeatedly"; collapsed "Advanced options"; OK, Cancel. (Narration: 4 characters, from the left.)
- **[03:52]** Result: APPLIED STEPS now Source, Promoted Headers, Changed Type, Duplicated Column, Split Column by Position, Changed Type1. Formula (Changed Type1): `= Table.TransformColumnTypes(#"Split Column by Position",{{"SCIAN 6 chiffres / NAICS 6 Code - Copy.1", Int64.Type}, {"SCIAN 6 chiffres / NAICS 6 Code - Copy.2", Int64.Type}})`. New columns "SCIAN 6 chiffres / NAICS 6 Code - Copy.1" = 3221 and "SCIAN 6 chiffres / NAICS 6 Code - Copy.2" = 12. (The formula of the "Split Column by Position" step itself is not shown.)
- **[04:12]** Same state; end of video.

## Transcript

**[00:05]** All right, so now we're going to be looking at how we can split information that's in a single column into multiple columns. So there are ways to combine columns into one, but often during the data entry process there might be kind of multiple layers of information sort of inside one particular column. We want to know how we can split that out. And often that can be sort of a quick hack sometimes to create a separate variable by splitting out information that's in a single column. OK. So we're going to do that. Uh, we're going to, as we as we do, load up some data from the tech CSV. OK. Uh, we're going to do

**[00:45]** that again in our 2024 data. We're gonna transform that data. So we're gonna scroll over to where we have the kind of the industrial codes, the industrial sector codes. Um, so. As I was sort of mentioning in class there, there are um there there's a code kind of nested within a code, so here there's a 4 digit code here. And then there's a six digit code on the other side. So for instance, this is 3221 represents pulp, paper, and paperboard

**[01:25]** mills. 322112 represents chemical pulp mills. So it's kind of like a hierarchy. Now in this case we already have the code on the. Left hand side that's the 4 digit code, but let's say you received a data set where it was just this, um, just the six digit code and you actually wanted to categorize your data by the 6 digit code but also by the 4 digit code. So what we're gonna do is we're gonna recreate this 4 digit code with this 6 digit code by splitting. Up the columns, so, uh, the first thing we're just gonna do is

**[02:01]** we're going to duplicate this column, so we don't wanna compromise our data in any way, but we can actually. Um, just make a separate copy. So now we're not going to kind of mess anything up in the original data set. You can see here in the applied steps, it's taken our duplicated column. Then we're just going to go up here to split column, OK? So we're going to split column and we can do it by a number of different ways. So one is by delimiter. So let's say you have and we see this sometimes. In a cell, you might have different countries where that species is found. So it might say like Canada, like UK,

**[02:41]** and then, but there's a comma separating them. But maybe you want to get individual countries separated, so you could do that by the delimiter, which is the comma, and that will split up those two columns, OK? Number of characters, so how many steps over. Um, uh, from the beginning of the cell, do you want to try and shift it, um, by lowercase or uppercase, maybe there are splits, uh, in the data set that way. So there's lots of kind of different options to use. So if let's say you have an alphanumeric code, well, it will split, um, from a digit to non-digit and split that into just your

**[03:18]** letters and your numbers as well, OK? So there's, it's tough to describe when exactly all of this component is useful, but you'll probably come across a time when you want to split out that information, kind of make the data set a little bit more granular. So we're going to split this by the number of characters. So we're going to go 4 characters over from the left hand side. Look, OK. And let's scroll over now. Now we have a new. Column that just has the four digits that were on the left-hand side there. So now we've

**[03:58]** split that, we've created this new data, again, we already had it in this data set, but there would be other data sets where it would just have the full 6 code. Now you've got that hierarchical code, so let's say you have multiple different pulp paper mills, and you have the specific sectors that you want to explore, then this would be very helpful um to be able to split that out.
