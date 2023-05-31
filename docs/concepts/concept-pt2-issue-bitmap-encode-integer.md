---
title: Part 2 - encoding issues
layout: default
parent: Bitmap indexes
grand-parent: Concepts
nav_order: 1
---

# Part 2 - Equality encoding issues with integer values

In part 1, the basic concepts of bitmaps were explained, and how equality encoding works well with Boolean data.

In this part, issues with equality encoding integer values are discussed to demonstrate why FeatureBase uses a different approach.

## Before you begin
* [Part 1 - Bitmap indexes and equality encoding data](/docs/concepts/concept-pt1-bitmap-index)

## Sample data

{% include /concepts/concept-eg-species-table-data.md %}

## Equality encoding one bitmap per value

Specifying a single bitmap per value means the data is accurately recorded, but:
* a new bitmap must be created each time the captivity numbers change
* multiple `OR` operations are required to query the captivity numbers.

For example:

| Captive | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| 3 | 1 | 0 | 0 | 0 |
| 19 | 0 | 0 | 1 | 0 |
| 20 | 0 | 0 | 0 | 1 |
| 956 | 0 | 1 | 0 | 0 |

### Equality encoding with groups of values

Grouping values reduces the number of bitmaps but data is lost. For example:

| Captive | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| 0-500 | 1 | 0 | 1 | 1 |
| 5001-1000 | 0 | 1 | 0 | 0 |

### Range encoding values

Range encoding means:
* there is no loss of data
* all values must be represented in an individual bitmap.

In this case, one bitmap for each value between 0 and 956 (n+1 bitmaps)

| Captive | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 1 |
| 1 | 0 | 0 | 0 | 0 |
| 2 | 0 | 0 | 0 | 0 |
| 3 | 1 | 0 | 0 | 0 |
| 4 | 0 | 0 | 0 | 0 |
| 5 | 1 | 0 | 0 | 0 |
| ...|  |  |  |
| 9 | 0 | 0 | 1 | 0 |
| 10 | 0 | 0 | 1 | 0 |
| ...|  |  |  |
| 14 | 1 | 0 | 1 | 0 |
| 15 | 1 | 0 | 1 | 0 |
| ...|  |  |  |
| 20 | 1 | 0 | 1 | 1 |
| ...|  |  |  |
| 956 | 1 | 1 | 1 | 1 |

Range encoded values allow range queries to include:
* less `or` operators,
* because the system can query only a smaller number of bitmaps need to be queried.

For example to determine the lowest numbers of species in captivity, only Bitmap 5 needs to be queried.

## Next step

* [Part 2 - base-2 range-encoded bitmaps](/docs/concepts/pt2-range-encode-bit-slice)

<!--
Garrett diagrams:

* https://app.slack.com/client/T2M810Z29/C059DQTQGLB
* https://app.slack.com/client/T2M810Z29/C059DQTQGLB
-->
