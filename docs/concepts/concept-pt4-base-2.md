---
title: Part 4 - base-2 conversion
layout: default
parent: Bitmap indexes
grand-parent: Concepts
nav_order: 4
---

## Part 4 - base-2 conversion of range-encoded bit-sliced indexes

In part 3, bit sliced indexes were range-encoded, reducing the number of bitmaps from 30 to 28.

This part explains how base-2 conversion of those results reduces the number of indexes to a total of 10.

## Before you begin

* [Learn how FeatureBase differs to traditional databases](/docs/concepts/concepts-home)
* [Part 1 - Bitmap encoding data](/docs/concepts/concept-pt1-bitmap-index)
* [Part 2 - Bit-slicing data](/docs/concepts/concept-pt2-bit-slicing)
* [Part 3 - Range-encoding bit-sliced data](/docs/concepts/concept-pt3-range-encode-bit-slicing)

{% include /concepts/concept-eg-species-table.md %}

## Range-encoded bit-sliced indexes








## Roaring Bitmap compression

Roaring bitmap compression breaks large sets of integers into containers of 2^16 integers (65536 bits) which makes computation faster.

* [Learn about Roaring Bitmap](https://roaringbitmap.org/about/)
