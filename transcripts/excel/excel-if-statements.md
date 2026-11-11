---
title: "Excel - IF statements"
tool: excel
duration: "10:55"
content_id: b8d67d3d-2779-4af4-a0eb-5fe6a4098700
transcript_source: whisper-small.en (sherpa-onnx, VAD-segmented)
linked_from: ["Videos organized by software", "Topic 3: Conditional logic, conditional calculations, and deterministic modelling"]
brightspace_url: https://westernu.brightspace.com/d2l/common/dialogs/quickLink/quickLink.d2l?ou=198357&type=mediaLibrary&contentId=b8d67d3d-2779-4af4-a0eb-5fe6a4098700&revisionId=latest
---

# Excel - IF statements — transcript

Duration 10:55. Source: Whisper small.en transcription (no platform captions existed).

## Visual notes (from video frames)
- **[00:42-00:52]** Blank workbook "Book7 - Excel", Data tab; status bar "Running background query ... (Click here to cancel)" while the NPRI air-releases CSV loads (Text/CSV > Load, no Power Query transforms).
- **[01:02]** Table on sheet "NPRI-INRP_IndustryIndustrie_Air" (Table Design tab, Table Name "NPRI_INRP_Indus..."), columns A-F: `Industry (English) / Industrie (Anglais)`, `Industry (French) / Industrie (Français)`, `Year / Année`, `NAICS Number / Numéro SCIAN`, `Total - Releases to Air (tonnes) / Total - Rejets dans l'air (tonnes)`, `Facility Count / Nombres d'installations`.
- **[01:12]** New header typed in G1 directly right of the table: `Mining`; the table auto-expands to include column G (Home tab active).
- **[01:32]** G2: `=if(` with tooltip `IF(logical_test, [value_if_true], [value_if_false])`; clicking cell A2 in the table inserts the structured reference: `=if([@[Industry (English) / Industrie (Anglais)]]`.
- **[02:02]** Typing: `=if([@[Industry (English) / Industrie (Anglais)]] = "Coal mining", "Coal mining", "Non-m...`.
- **[02:22]** After Enter the formula auto-fills the whole table column (calculated column). Formula bar (G3): `=IF([@[Industry (English) / Industrie (Anglais)]] = "Coal mining", "Coal mining", "Non-mining industries")`. Values "Non-mining industries" in the top rows.
- **[02:32-02:52]** Filter dropdown on the `Mining` header: Sort A to Z, Sort Z to A, Sort by Color, Sheet View, Clear Filter From "Mining", Filter by Color, Text Filters, Search; checklist (Select All), Coal mining, Non-mining industries.
- **[03:22-03:32]** Header G1 renamed from `Mining` to `Coal mining`.
- **[03:52-04:02]** New column H, header `Mining`; H2 typed `=if(OR` (tooltip `IF(logical_test, ...)`), then `OR(logical1, [logical2], ...)` tooltip; `=if(OR([@[Industry (English) / Industrie (Anglais)]]`.
- **[04:32]** `=if(OR([@[Industry (English) / Industrie (Anglais)]]= "Coal mining", [@[Industry (English) / Industrie (Anglais)]]= "Foundries")`.
- **[04:52]** `..."Foundries"), "Mining", "Non-mini...`.
- **[05:02]** Final formula bar (H3): `=IF(OR([@[Industry (English) / Industrie (Anglais)]]= "Coal mining", [@[Industry (English) / Industrie (Anglais)]]= "Foundries"), "Mining", "Non-mining")`. Filter dropdown on Mining shows (Select All), Mining, Non-mining.
- **[05:12]** Filter Mining = "Mining": status "20 of 1323 records found"; rows 157-166 (NAICS 2121, Coal mining column = "Coal mining") and rows 361-370 (NAICS 3315 = Foundries, Coal mining column = "Non-mining industries"), all `Mining` in column H. Filter then cleared.
- **[05:52]** New header I1 typed `Facility threw...` (becomes `Facility thresholds`).
- **[06:12]** I2: `=ifs([@[Facility Count / Nombres d''installations]]<10` with tooltip `IFS(logical_test1, value_if_true1, [logical_test2, value_if_true2], ...)`. Note the apostrophe in "d'installations" is doubled (`d''installations`) inside the structured reference.
- **[06:32]** `=ifs([@[Facility Count / Nombres d''installations]]<10, "Low", [@[Facility Count / Nombres d''installations]]< 20, "Medium", [@[Facility Count / Nombres d''installations]]`.
- **[06:52-07:12]** Complete: `=IFS([@[Facility Count / Nombres d''installations]]<10, "Low", [@[Facility Count / Nombres d''installations]]< 20, "Medium", [@[Facility Count / Nombres d''installations]]>=20, "High")`. Results: rows with 31-37 facilities = "High", row 12 (5 facilities) = "Low", 9-12 facilities = "Medium" (rows 22-31 partially hidden by webcam).
- **[07:42-08:12]** Final table columns G `Coal mining`, H `Mining`, I `Facility thresholds`. After ~08:20 the video is black to the end (10:55).

## Transcript

**[00:06]** All right, so in this video, we're gonna take a look at using...

**[00:09]** conditional logic to create new columns within our dataset.

**[00:15]** based on values that are there. So we're gonna use if statements. These are very famous formulas that you would use in R and in Excel to basically search for a value or a condition and then return one thing if it's true and return another thing if it's false so that condition is not met.

**[00:36]** So let's quickly load up our data as we do.

**[00:40]** We're gonna do the air industry releases again.

**[00:48]** to do any transformations. So we'll just load that

**[00:54]** Great, okay, so we've got our industry name, of course, our year. (static)

**[01:00]** our industry code and our releases and number of facilities.

**[01:05]** So we're gonna create a new column in our table here. We're gonna call this mining column.

**[01:11]** and we are gonna use an if statement to group all values that are from coal mining and then also group all values that are from anything other than coal mining. So an if statement classically works like this, you put an if in front and then we complete some sort of test. So we say that if,

**[01:32]** the industry over here.

**[01:35]** Okay, until you match it to the same row.

**[01:38]** So it's going G2, A2. So if the industry over here, and we're gonna say is equal to.

**[01:48]** for the whole mining.

**[01:52]** then what happens if it's true?

**[01:56]** Well, we'll keep it as coal mining.

**[01:59]** And what happens if it's false?

**[02:01]** We'll call it non-mining.

**[02:03]** industries

**[02:05]** And then we close off that bracket. So the way this is read is if the industry title is equal to coal mining.

**[02:13]** then the value in this column will be coal mining.

**[02:15]** If it is not equal to coal mining, then it will be non-mining industries.

**[02:20]** Okay, we see that it automatically flash fills in a table, which is very nice. So we'll fill down all the different columns. And we can see here now we've got two categories, coal mining and non-mining industries. So this is really helpful if we wanted to, let's say, compare

**[02:37]** different sets of industries. So if we wanted to compare coal mining and non-mining industries, let's say we wanted to do that in some sort of a pivot table, then we can actually do that now quite easily because our if statement allows us to do that. So very simple, straightforward way of recategorizing data in a way that allows us to make some further comparisons.

**[03:00]** Okay, so that's very straightforward. What if we wanted to include multiple search terms? So we're not just looking for just coal mining. Maybe there's some other aspects or industries in the data set that we wanna kind of include, but we can actually use nested functions. So this is kind of a, maybe an introduction to...

**[03:20]** nested function. So let's do...

**[03:23]** So let's change this to coal.

**[03:26]** pool mining here, for example. And now we're gonna slide over and we're gonna create another if statement over here. And this is gonna be maybe more broadly mining. So we're gonna go equals if, and we're gonna use something called an or function here. So this or function, as it says, checks whether any of the arguments are true. So we can put multiple things in there if one of them is true.

**[03:53]** it will say that it's true. If both of them are true, it will say that it's true. Only if both of them are missing, we'll say that it's false. Okay, so let's take a look at how this works. So now we're going to group our kind of logical tests into this or function.

**[04:09]** will say.

**[04:10]** If this

**[04:12]** equal to...

**[04:14]** Full mining.

**[04:19]** Um...

**[04:20]** Okay, or...

**[04:22]** if this is equal to

**[04:25]** foundries that would be potentially involved in smelting and things like that. So still maybe part of the mining industry. We're gonna close that in brackets.

**[04:36]** It will now search through that first column.

**[04:39]** If it's coal mining, if it's found trees, it will say this is true. And what do we wanna say when it's true? Well, let's call it mining.

**[04:48]** And afterwards we'll say "non-mining" again.

**[04:53]** Okay, so this allows us to...

**[04:55]** create another column that's putting multiple industries into the same basket, and then we're comparing those sorts of baskets.

**[05:02]** So let's go look at what we've grabbed for mining.

**[05:05]** And we can see that we've got coal mining and foundries, both of them there, and we've grouped them under mining. So we can use that kind of nested OR function to be able to search for multiple things at once, kind of like that in the set of when we were looking at in R or in QGIS.

**[05:26]** All right, so next we're gonna use an if statement. So this allows us to have multiple conditions that can break up a continuous variable. So let's say we're looking at total error releases here, total facility counts. We can actually create kind of cutoffs and breaks in that continuous variable to categorize that data. So let's say we're gonna look at facility thresholds here.

**[05:53]** and

**[05:55]** We're gonna use an if statement. It's ifs with an S on the end.

**[06:00]** and we're gonna do multiple logical tests.

**[06:04]** So, we're gonna say that if this is, if the facility counts are less than 10,

**[06:12]** Then the true value, when that's true, we're gonna say that it's low.

**[06:17]** If it is, oops sorry, if the facility counts...

**[06:22]** are less than 20.

**[06:26]** We're gonna say that that's sort of medium number of facilities.

**[06:30]** If the facility counts,

**[06:32]** R

**[06:33]** Rager

**[06:35]** then 20.

**[06:38]** greater than or equal to 20, so be include 20.

**[06:42]** then our facilities are going to be considered a high number of facilities.

**[06:48]** So let me close that off so we can kind of build this sequentially. So it will first check.

**[06:53]** Is it low? Okay, if it's less than 10, it's low. Good. If that fails and it's greater than...

**[07:03]** Um...

**[07:04]** or sorry, it's less than 20, then it'll be medium. If then if it's more than 20, it will kick over to the third one and save at a time.

**[07:15]** So you can see now that that has looked across and said, okay, these ones are high, these ones are low, these ones are medium, high, okay? So that has broken that up now into something that we could maybe compare across, compare emissions across. You could look at maybe, are the number of facilities indicative of high emissions? Or even we could go back and look at the original dataset and look at what the kind of variability is amongst.

**[07:40]** different facilities. So this is something that allows us to kind of break that up into categories. We could do the same thing for the total releases to air and break this up into high, medium, and low categories as well. Okay. So we've got an if statement with a simple kind of

**[07:57]** true false on a first search. We've got one that has multiple conditions that could be met for a true value. And then we've got one that kind of sequentially has different levels so you can break that variable up into continuous variables as well. Or sorry, break the continuous variables up in the categorical ones. Okay.
