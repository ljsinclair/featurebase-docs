---
title: Part 3 - range encoded bit-sliced indexes
layout: default
parent: Bitmap indexes
grand-parent: Concepts
nav_order: 3
---

# Part 3 - Range encoding bit-sliced indexes

This high-level overview provides examples to demonstrate how range-encoding bit-sliced indexes can reduce the number of indexes needed to represent data.

In part 2, bit slicing reduced the total number of indexes required to represent species captivity from 957 indexes to 30.

Range-encoding these indexes allows the total number of indexes to be reduced to 28.

## Before you begin

* [Part 1 - Bitmap encoding data](/docs/concepts/concept-pt1-bitmap-index)
* [Part 2 - Bit-slicing data](/docs/concepts/concept-pt2-bit-slicing)

{% include /concepts/concept-eg-species-table.md %}

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

* [Part 4 - converting to base-2](/docs/concepts/concept-pt4-base-2)









References:

https://www.featurebase.com/blog/bitmaps-making-real-time-analytics-real
* bitmap encoding -- https://www.featurebase.com/blog/range-encoded-bitmaps


Garrett diagrams:

* https://app.slack.com/client/T2M810Z29/C059DQTQGLB
* https://app.slack.com/client/T2M810Z29/C059DQTQGLB


## Further information

* [Bitmap index on Wikipedia](https://en.wikipedia.org/wiki/Bitmap_index)
