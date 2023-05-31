---
title: Part 1 - Bitmap indexes
layout: default
parent: Bitmap indexes
grand-parent: Concepts
nav_order: 1
---

# Part 1 - bitmap indexes

This is the first in a series of articles that explains how FeatureBase uses bitmaps, bit-slicing and range-encoding to:
* represent your data
* reduce the storage overhead of your data

This article includes explanations of:
* bitmap indexes
* equality encoding Boolean data

## Before you begin

* [Learn how FeatureBase differs to traditional databases](/docs/concepts/concepts-home)
* [Learn about data cardinality](/docs/concepts/concepts-home#cardinality-describes-relationships-between-data)

## What is a bitmap index?

A bitmap index is:
* an array of binary values
* that represent high cardinality data (e.g., data with one-to-one relationships)
* identified by a unique key

For example:

{% include /concepts/concept-eg-bitmap.md %}

## Sample data

{% include /concepts/concept-eg-species-table-data.md %}

## What is equality-encoding?

Equality encoding is a basic encoding method used with bitmap indexes whereby the relationships between two dimensions are represented as binary, where:
* `1` is encoded if the relationship exists
* `0` is encoded if the relationship does not

High cardinality data works well in bitmaps because the relationship is Boolean, it either exists or it does not.

For example, the first column values can be represented as a single bitmap:

|  | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| Vertebrate | 1 | 1 | 1 | 0 |

Those species with a backbone are represented by:
* 1 if the species has a backbone
* 0 if the species does not have a backbone

## Low cardinality data representation

Low cardinality values have a one-to-many or many-to-many relationship. The way the data and relationships are represented requires multiple bitmaps.

### Equality encoding one bitmap per value

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

## Further information

* [Analysis of basic data recording techniques (equality encoding and range encoding)](https://www.researchgate.net/publication/221206605_Analysis_of_Basic_Data_Reordering_Techniques){:target="_blank"}

<!--
Garrett diagrams:

* https://app.slack.com/client/T2M810Z29/C059DQTQGLB
* https://app.slack.com/client/T2M810Z29/C059DQTQGLB
-->
