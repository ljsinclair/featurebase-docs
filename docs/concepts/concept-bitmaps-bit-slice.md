---
title: Bit-slice bitmaps
layout: default
parent: Bitmap index overview
grand_parent: Concepts
nav_order: 2
---

# FeatureBase bitmaps part 2 - Bit-sliced bitmaps
{: .no_toc }

Bit Slice bitmaps allow FeatureBase to represent any number in the 64-bit range (10^19) using only 64 bitmaps. This means integer, timestamp and fixed-point decimals can be handled more efficiently than a standard bitmap.

Bit-slicing data involves:
* converting integer values to base-2
* creating a single bitmap for each power of 2

{% include page-toc.md %}

## Before you begin

* [Learn about FeatureBase bitmaps](/docs/concepts/concept-bitmaps)
* [Learn about standard bitmaps and equality encoding data](/docs/concepts/concept-bitmaps-standard)

## What data types are converted to bit-sliced bitmaps?

User data mapped to the following data types is converted to bit-sliced bitmaps:

{% include /concepts/concept-bitmap-bitslice-data-type-table.md %}

## How does FeatureBase bit-slice integer data?

Sample data is used to demonstrate how a column of values is converted to base-2 then bit-sliced.

### Sample data

{% include /concepts/concept-eg-species-table-data.md %}

### Step 1 - convert integer values to base-2

The `Captivity` data can be converted to binary (base-2) as follows:

| Species | Captivity |
|---|---|
| Manatee | 011 |
| Sea Horse | 1110111100 |
| Koala | 10011 |
| Starfish | 10100 |

### Step 2 - Bit slicing the integer values

Bit slicing converts each binary value into an array of bits.

|  | 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| Manatee | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 |
| Sea Horse | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 0 | 0 |
| Koala | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 1 |
| Starfish | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | 0 |

## Next step

* Learn how FeatureBase compresses bitmaps in [Part 3 - Roaring Bitmap Format](/docs/concepts/concept-fb-pt3-roaring-bitmap-format)

## Further information

* [Learn about bit-slice indexing](https://pages.cs.wisc.edu/~nil/764/DADS/36_improved-query-performance-with.pdf){:target="_blank"}
<!--
Content based on:
* https://www.featurebase.com/blog/featurebase-technical-white-paper
* https://www.featurebase.com/blog/bitmaps-making-real-time-analytics-real
* https://www.featurebase.com/blog/range-encoded-bitmaps
-->
