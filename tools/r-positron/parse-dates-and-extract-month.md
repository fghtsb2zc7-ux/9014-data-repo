---
id: r-positron.parse-dates-and-extract-month
tool: r-positron
title: Parse dates and date-times with lubridate (ymd_hm, mdy) and extract labelled months
keywords: [dates, date-time, lubridate, ymd_hm, mdy, month, label = TRUE, month name, date formatting, parse date, seasonal, time series, POSIXct, extract month]
software_context: "Positron, R 4.6.1, lubridate 1.9.5 (loaded by tidyverse 2.0.0)"
prerequisites: [r-positron.create-columns-with-mutate]
source_videos: []
source_pages: [course-pages/topic-2-transforming-and-wrangling-data.md, course-pages/technical-skills-checklist.md, course-pages/practice-1-north-atlantic-right-whale.md, course-pages/exam-practice.md]
datasets_used: ["sources/files/Class 2/Class 2.zip (data/108916_tag.csv, data/108916_histos.csv)", sources/files/PWQMN_data_2024.csv, "sources/files/Practice sets/OBIS - North Atlantic Right Whale reduced.csv"]
---
# Parse dates and date-times with lubridate (ymd_hm, mdy) and extract labelled months

## Purpose
Convert date text into real R dates or date-times so they sort, plot on a time axis, and can be broken into parts. The main use in the course is extracting a labelled month (Jan, Feb, ...) for seasonal summaries. Topic 2 lists this as "Positron - Date formatting".

## Steps
1. Look at the date text format in `glimpse()` and choose the matching parser. The parser name is the order of the parts:
   - `"2012-07-26 10:00"` (year-month-day hour:minute) → `ymd_hm()` [script R Skills Review.R:163]
   - `"08/14/2024"` (month/day/year) → `mdy()` [script R Skills Review.R:585]
   - `"2010-03-20"` (year-month-day, already a date after `read_csv`) → can go straight into `month()` [page practice-1-north-atlantic-right-whale.md]
2. Inside `mutate()`, create the parsed column: `date_time = ymd_hm(Date)`. [script R Skills Review.R:163]
3. Extract the month as an ordered label: `month = month(date_time, label = TRUE)`. Without `label = TRUE` you get numbers 1-12. [script R Skills Review.R:164]
4. Parsing and extraction can be nested in one step: `month(mdy(collected), label = TRUE)`. [script R Skills Review.R:585]
5. Plot a date-time directly on the x-axis; ggplot recognises it. [script R Skills Review.R:169-171]

## Formulas / expressions / code
Topic 2 basking-shark tag locations [script R Skills Review.R:161-171]:
```r
## Load in the location dataset
location_data <- read_csv("data/108916_tag.csv") |> 
    mutate(date_time = ymd_hm(Date)) |>   # Convert the Date column into a date-time format that R can understand
    mutate(month = month(date_time, label = TRUE)) # Extract the month from the date-time column, label = TRUE returns month names/abbreviations instead of numbers

# R can natively identify and plot datetime objects within ggplot
ggplot(data = location_data, aes(x = date_time, y = `Most Likely Latitude`))+
  geom_line()
```
Topic 2 histograms, long format [script R Skills Review.R:254-260]:
```r
grouped_tag_data <- filtered_tag_data_long |> 
  mutate(date_time = ymd_hm(Date)) |> 
  mutate(month = month(date_time, label = TRUE)) |> 
  ...
```
PWQMN 2024 (Collected = "MM/DD/YYYY") [script R Skills Review.R:585]:
```r
month = month(mdy(collected), label = TRUE)
```
OBIS whales and ferry-buffer practice (already a date column) [page practice-1-north-atlantic-right-whale.md] [page exam-practice.md]:
```r
mutate(month_label = month(event_date_standard, label = TRUE))
mutate(month = month(event_date_standard, label = TRUE))
```

## Verify
- `glimpse()` shows `<dttm>` for `date_time` and `<ord>` for `month`, with values such as `Jul`, `Aug`. (type glyphs are general knowledge)
- Monthly plots order Jan to Dec automatically, because the labelled month is an ordered factor.

## Pitfalls
- Choosing the wrong parser (for example `ymd()` on `08/14/2024`) gives `NA` and a "failed to parse" warning. (general knowledge — not shown in course)
- In `108916_histos.csv` the first row (`TATLIMITS`) has an empty Date, so `ymd_hm(Date)` gives NA there. Filter to `HistType == "TAT"` first, as the course does. [script R Skills Review.R:196-197] (from dataset schema)
- Some OBIS rows have no date or year. Exclude NA months with `filter(complete.cases(month_label))` before plotting. [page practice-1-north-atlantic-right-whale.md]
- Filter labelled months with their abbreviations: `filter(month == "Jan")`, `month %in% c("Jul", "Aug", ...)`. [script R Skills Review.R:648]

## Related
- [create-columns-with-mutate.md](create-columns-with-mutate.md)
- [group-and-summarize.md](group-and-summarize.md)
- [plot-line-chart.md](plot-line-chart.md)
- [plot-heatmap.md](plot-heatmap.md)
