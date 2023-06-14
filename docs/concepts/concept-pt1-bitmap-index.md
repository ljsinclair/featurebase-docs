---
title: Part 1 - Bitmap indexes
layout: default
parent: Bitmap index overview
grand_parent: Concepts
nav_order: 1
---

# Part 1 - bitmap indexes
{: .no_toc }

{% include /concepts/concept-bitmap-index-summary.md %}

The underlying reasons this approach was chosen is explained in two parts:

{% include /concepts/concept-bitmap-pt1-summary.md %}

This gives context to the solution discussed in Part 2.

{% include page-toc.md %}

## Before you begin

* [Learn how FeatureBase differs to traditional databases](/docs/concepts/concepts-home)
* [Learn about data cardinality](/docs/concepts/concepts-home)

## Sample data

Part 1 and 2 use the following sample data for examples:

{% include /concepts/concept-eg-species-table-data.md %}

## What is a bitmap index?

A bitmap index is:
* an array of binary values
* that represent high cardinality data (e.g., data with one-to-one relationships)
* identified by a unique key

For example:

|  | 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| Manatee | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 |

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

There are two issues with this approach:
1. multiple `OR` operations are required to query the captivity numbers.
2. a new bitmap must be created each time captivity numbers change

### Equality encoding groups of values

Grouping values reduces the number of bitmaps:

| Captivity | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| 0-500 | 1 | 0 | 1 | 1 |
| 5001-1000 | 0 | 1 | 0 | 0 |

However, exact numbers of each species in captivity is lost.

## Next step

* [Part 2 - FeatureBase base-2 bit-sliced bitmaps](/docs/concepts/concept-pt2-base-2-bit-slice-bitmaps)

<!--
Garrett diagrams:

* https://app.slack.com/client/T2M810Z29/C059DQTQGLB
* https://app.slack.com/client/T2M810Z29/C059DQTQGLB

Content based on:
* https://www.featurebase.com/blog/bitmaps-making-real-time-analytics-real
* https://www.featurebase.com/blog/range-encoded-bitmaps
-->
