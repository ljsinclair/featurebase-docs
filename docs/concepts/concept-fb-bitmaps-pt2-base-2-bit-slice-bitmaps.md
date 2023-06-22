---
title: Part 2 - base-2 bit-slice bitmaps
layout: default
parent: Bitmap index overview
grand_parent: Concepts
nav_order: 2
---

# Part 2 - FeatureBase base-2 bit-sliced bitmaps
{: .no_toc }

In part 2, sample data is used to explain:
* base-2 conversion
* bit-slicing that data

{% include page-toc.md %}

## Before you begin

* [Learn about standard bitmaps](/docs/concepts/concept-fb-bitmaps)
* [Part 1 - standard bitmaps and equality encoding data](/docs/concepts/concept-fb-bitmaps-pt1-standard-bitmaps)

## Sample data

{% include /concepts/concept-eg-species-table-data.md %}

## What data is converted to bit-sliced bitmaps?

User data mapped to the following data types is converted to bit-sliced bitmaps:

| User data | FeatureBase data type | Additional information |
|---|---|---|
| Floating point | Decimal |  |
| Signed Integer | Integer | A bitmap is added for the sign |
| Date and time | Timestamp |  |

## Step 1 - convert integer values to base-2

The `Captivity` data can be converted to binary (base-2) as follows:

| Species | Captivity |
|---|---|
| Manatee | 011 |
| Sea Horse | 1110111100 |
| Koala | 10011 |
| Starfish | 10100 |

## Step 2 - Bit slicing the integer values

Bit slicing or Bit Plane slicing converts each binary value into an array of bits.

|  | 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| Manatee | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 |
| Sea Horse | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 0 | 0 |
| Koala | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 1 |
| Starfish | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | 0 |

<!--
Content based on:
* https://www.featurebase.com/blog/bitmaps-making-real-time-analytics-real
* https://www.featurebase.com/blog/range-encoded-bitmaps
-->
