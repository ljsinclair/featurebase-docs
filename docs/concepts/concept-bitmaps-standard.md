---
title: Standard bitmaps
layout: default
parent: Bitmap index overview
grand_parent: Concepts
nav_order: 1
---

# FeatureBase Bitmaps part 1 - standard bitmaps
{: .no_toc }

A standard bitmap is:
{% include /concepts/concept-bitmap-standard-summary.md %}

In part 1, sample data is used to explain:
* standard bitmaps
* equality-encoding values
* equality-encoding grouped values

{% include page-toc.md %}

## Before you begin

* [Learn how FeatureBase differs to traditional databases](/docs/concepts/concepts-home)
* [Learn about FeatureBase bitmaps](/docs/concepts/concept-bitmaps)

## What data types are converted to standard bitmaps?

{% include /concepts/concept-bitmap-standard-data-type-table.md %}

## Sample data

{% include /concepts/concept-eg-species-table-data.md %}

## How is data encoded?

Equality encoding is a basic encoding method used with standard bitmaps whereby the relationships between two dimensions are represented as binary, where:
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

## Next part

* Learn how these issues are overcome in [Part 2 - FeatureBase bit-sliced bitmaps](/docs/concepts/concept-bitmaps-bit-slice)

<!--
Garrett diagrams:

* https://app.slack.com/client/T2M810Z29/C059DQTQGLB
* https://app.slack.com/client/T2M810Z29/C059DQTQGLB

Content based on:
* https://www.featurebase.com/blog/bitmaps-making-real-time-analytics-real
* https://www.featurebase.com/blog/range-encoded-bitmaps
-->
