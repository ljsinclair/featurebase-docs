---
title: Part 1 - Bitmap indexes
layout: default
parent: Bitmap index overview
grand_parent: Concepts
nav_order: 1
---

# Part 1 - bitmap indexes
{: .no_toc }

This is the first in a series of articles that explains how FeatureBase uses bitmaps, bit-slicing and range-encoding to:
* represent your data
* reduce the storage overhead of your data

This article includes explanations of:
* bitmap indexes
* equality encoding boolean data
* issues with equality encoding integer values

{% include page-toc.md %}

## Before you begin

* [Learn how FeatureBase differs to traditional databases](/docs/concepts/concepts-home)
* [Learn about data cardinality](/docs/concepts/concepts-home)

## What is a bitmap index?

A bitmap index is:
* an array of binary values
* that represent high cardinality data (e.g., data with one-to-one relationships)
* identified by a unique key

For example:

|  | 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| Manatee | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 |

## Sample data

{% include /concepts/concept-eg-species-table-data.md %}

## What is equality-encoding?

Equality encoding is a basic encoding method used with bitmap indexes whereby the relationships between two dimensions are represented as binary, where:
* `1` is encoded if the relationship exists
* `0` is encoded if the relationship does not

Boolean data can be equality encoded because the relationship either exists or it doesn't. For example:

|  | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| Vertebrate | 1 | 1 | 1 | 0 |

Those species with a backbone are represented by:
* 1 if the species has a backbone
* 0 if the species does not have a backbone

### Equality encoding integer values

Equality encoding non-Boolean data like integers is less effective but is possible.

For example:

| Captivity | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| 3 | 1 | 0 | 0 | 0 |
| 19 | 0 | 0 | 1 | 0 |
| 20 | 0 | 0 | 0 | 1 |
| 956 | 0 | 1 | 0 | 0 |

The issue here is that:
* multiple `OR` operations are required to query the captivity numbers.
* a new bitmap must be created each time captivity numbers change

### Equality encoding groups of values

Grouping values reduces the number of bitmaps:

| Captivity | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| 0-500 | 1 | 0 | 1 | 1 |
| 5001-1000 | 0 | 1 | 0 | 0 |

However, exact numbers of each species in captivity is lost.

### Range encoding integer values

{% include /concepts/concept-range-encoding-summary.md %}

Range encoding means there is no loss of data as compared to equality encoding in groups.

The drawback of Range encoding is that n+1 bitmaps are required to represent the data.

For example, to range encode the captivity data, there will be one bitmap for each value between 0 and 956:

| Captivity | Manatee | Sea Horse | Koala | Starfish |
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

## Next step

* [Part 2 - base-2 range-encoded bitmaps](/docs/concepts/concept-pt2-range-encode-bit-slice)

## Further information

* [Analysis of basic data recording techniques (equality encoding and range encoding)](https://www.researchgate.net/publication/221206605_Analysis_of_Basic_Data_Reordering_Techniques){:target="_blank"}

<!--
Garrett diagrams:

* https://app.slack.com/client/T2M810Z29/C059DQTQGLB
* https://app.slack.com/client/T2M810Z29/C059DQTQGLB
-->
