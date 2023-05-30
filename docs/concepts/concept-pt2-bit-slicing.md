---
title: Part 2 - bit-slicing data
layout: default
parent: Bitmap indexes
grand-parent: Concepts
nav_order: 2
---

# Part 2 - Bit slicing data

This high-level overview provides examples to demonstrate how bit-slicing can reduce the number of indexes needed to represent data.

In part 1, different methods of encoding data were demonstrated, including range-encoding which represented all available values in 957 indexes.

This number can be reduced substantially using bit-slicing.

## Before you begin

* [Learn about Bitmaps](/docs/concepts/concept-pt1-bitmap-index)

{% include /concepts/concept-eg-species-table.md %}

### Bit slicing values

Bit slicing can represent the low-cardinality values using 30 indexes by representing numerical values in base 10.

To conceptualise bit slicing, the captivity data can be represented as follows:

| Captive | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| Units | 3 | 6 | 9 | 0 |
| Tens | 0 | 5 | 1 | 2 |
| Hundreds | 0 | 9 | 0 | 0 |

Bitmaps are then used to encode these values as follows:

#### Bitmaps representing units

| Captive | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 1 |
| 1 | 0 | 0 | 0 | 0 |
| 2 | 0 | 0 | 0 | 0 |
| 3 | 1 | 0 | 0 | 0 |
| 4 | 0 | 0 | 0 | 0 |
| 5 | 0 | 0 | 0 | 0 |
| 6 | 0 | 1 | 0 | 0 |
| 7 | 0 | 0 | 0 | 0 |
| 8 | 0 | 0 | 0 | 0 |
| 9 | 0 | 0 | 1 | 0 |

#### Bitmaps representing tens

| Captive | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 1 | 0 | 0 | 1 | 0 |
| 2 | 0 | 0 | 0 | 1 |
| 3 | 0 | 0 | 0 | 0 |
| 4 | 0 | 0 | 0 | 0 |
| 5 | 0 | 1 | 0 | 0 |
| 6 | 0 | 0 | 0 | 0 |
| 7 | 0 | 0 | 0 | 0 |
| 8 | 0 | 0 | 0 | 0 |
| 9 | 0 | 0 | 0 | 0 |

#### Bitmaps representing hundreds

| Captive | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 1 | 0 | 0 | 0 | 0 |
| 2 | 0 | 0 | 0 | 0 |
| 3 | 0 | 0 | 0 | 0 |
| 4 | 0 | 0 | 0 | 0 |
| 5 | 0 | 0 | 0 | 0 |
| 6 | 0 | 0 | 0 | 0 |
| 7 | 0 | 0 | 0 | 0 |
| 8 | 0 | 0 | 0 | 0 |
| 9 | 0 | 1 | 0 | 0 |

## Next step

* [Represent the data in 28 bitmaps with range encoding](#)

### Range encoding bit-sliced index values

Range encoding the bit-slice indexes means the values within the bitmaps representing **9** are set to `1`.

These bitmaps can therefore be removed.

To overcome a situation where a value **only exists** in a bitmap, a **not_null** bitmap is added.

For example, the range-encoding on the **Units** bitmaps results in the following:

| Captive | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 1 | 0 | 0 | 0 | 1 |
| 2 | 0 | 0 | 0 | 1 |
| 3 | 1 | 0 | 0 | 1 |
| 4 | 1 | 0 | 0 | 1 |
| 5 | 1 | 0 | 0 | 1 |
| 6 | 1 | 1 | 0 | 1 |
| 7 | 1 | 1 | 0 | 1 |
| 8 | 1 | 1 | 0 | 1 |
| 9 | 1 | 1 | 1 | 1 |

Removing the `9` bitmap would result in a loss of data for the **Koala**.

Adding a **not_null** bitmap in its place means this data is retained:

| Captive | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| not_null | 1 | 1 | 1 | 1 |

## Next step

* [Represent the data in 10 bitmaps](#)




## Roaring Bitmap compression

Roaring bitmap compression breaks large sets of integers into containers of 2^16 integers (65536 bits) which makes computation faster.

* [Learn about Roaring Bitmap](https://roaringbitmap.org/about/)







References:

https://www.featurebase.com/blog/bitmaps-making-real-time-analytics-real
* bitmap encoding -- https://www.featurebase.com/blog/range-encoded-bitmaps


Garrett diagrams:

* https://app.slack.com/client/T2M810Z29/C059DQTQGLB
* https://app.slack.com/client/T2M810Z29/C059DQTQGLB


## Further information

* [Bitmap index on Wikipedia](https://en.wikipedia.org/wiki/Bitmap_index)
