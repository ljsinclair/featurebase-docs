---
title: Part 2 - bit-slicing and range-encoding
layout: default
parent: Bitmap indexes
grand-parent: Concepts
nav_order: 2
---

## Part 2 - bit-slicing and range-encoding base-2 data

In part-1, bitmaps and encoding methods were discussed with examples:
* equality encoding
* range-encoding

This part explains how FeatureBase uses bit-slicing and range-encoding to reduce the data footprint before applying Roaring Bitmap compressing and then inserting data into the system.

## Before you begin
* [Part 1 - Bitmap encoding data](/docs/concepts/concept-pt1-bitmap-index)

## Sample data

{% include /concepts/concept-eg-species-table-data.md %}

The examples that follow are based on low-cardinality data contained in the **Captive** column which can be represented in base-2:

|  | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| captive | 011 | 1110111100 | 10011 | 10100 |

Changing the orientation of the table allows the values to be better conceptualised in bitmap columns representing powers of two:

|  | 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| Manatee | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 |
| Sea Horse | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 0 | 0 |
| Koala | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 1 |
| Starfish | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | 0 |

## Bit slicing the bitmaps

Bit-slicing these bitmaps means each bitmap is split into two:

* a bitmap to represent the `1` value
* a bitmap to represent the `0` value.

For example:

### Bitmap `2^0 = 1`

| Bits --> | 1 | 0 |
|---|---|
| Manatee | 0 | 1 |
| Sea Horse | 0 | 1 |
| Koala | 1 | 0 |
| Starfish | 0 | 1 |

### Bitmap `2^1=2`

| Bits --> | 1 | 0 |
|---|---|
| Manatee | 1 | 0 |
| Sea Horse | 0 | 1 |
| Koala | 1 | 0 |
| Starfish | 0 | 1 |

### Bitmap `2^2=4`

| Bits --> | 1 | 0 |
|---|---|
| Manatee | 1 | 0 |
| Sea Horse | 1 | 0 |
| Koala | 0 | 1 |
| Starfish | 1 | 0 |

### Bitmap `2^3=8`

| Bits --> | 1 | 0 |
|---|---|
| Manatee | 0 | 1 |
| Sea Horse | 1 | 0 |
| Koala | 0 | 1 |
| Starfish | 1 | 0 |

### Bitmap `2^4=16`

| Bits --> | 1 | 0 |
|---|---|
| Manatee | 0 | 1 |
| Sea Horse | 1 | 0 |
| Koala | 0 | 1 |
| Starfish | 0 | 1 |

### Bitmap `2^5=32`

| Bits --> | 1 | 0 |
|---|---|
| Manatee | 0 | 1 |
| Sea Horse | 1 | 0 |
| Koala | 1 | 0 |
| Starfish | 1 | 0 |

### Bitmap `2^6=64`

| Bits --> | 1 | 0 |
|---|---|
| Manatee | 0 | 1 |
| Sea Horse | 0 | 1 |
| Koala | 0 | 1 |
| Starfish | 0 | 1 |

### Bitmap `2^7=128`

| Bits --> | 1 | 0 |
|---|---|
| Manatee | 0 | 1 |
| Sea Horse | 1 | 0 |
| Koala | 0 | 1 |
| Starfish | 0 | 1 |

### Bitmap `2^8=256`

| Bits --> | 1 | 0 |
|---|---|
| Manatee | 0 | 1 |
| Sea Horse | 1 | 0 |
| Koala | 0 | 1 |
| Starfish | 0 | 1 |

### Bitmap `2^9=512`

| Bits --> | 1 | 0 |
|---|---|
| Manatee | 0 | 1 |
| Sea Horse | 1 | 0 |
| Koala | 0 | 1 |
| Starfish | 0 | 1 |

### Range encoding bit-sliced indexes

When range encoding bit sliced indexes, all values greater than a specific value are set to 1.

For example, when range-encoding data in the **Bitmap 2^9** data, **Bitmap-1** is encoded as follows:

| Bits --> | 1 | 0 |
|---|---|
| Manatee | 1 | 1 |
| Sea Horse | 1 | 0 |
| Koala | 1 | 1 |
| Starfish | 1 | 1 |

## FeatureBase program logic

FeatureBase automatically removes duplicated indexes from base-2, range-encoded bit-sliced indexes **except** when values will be lost. For example:

The `Sea Horse` captivity values are encoded as follows in **Bitmap 2^9**.

| Bits --> | 1 | 0 |
|---|---|
| Sea Horse | 1 | 0 |

To avoid losing this data, FeatureBase adds a **not_null** bitmap:

| Bits --> | not_null | 0 |
|---|---|
| Manatee | 1 | 1 |
| Sea Horse | 1 | 0 |
| Koala | 1 | 1 |
| Starfish | 1 | 1 |


## Final data

Original Base-2 values:

|  | 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| Manatee | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 |
| Sea Horse | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 0 | 0 |
| Koala | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 1 |
| Starfish | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | 0 |

Range encoded bit slice indexes with duplicate bitmaps removed:

|  | not_null |512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Manatee | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 |
| Sea Horse | 1 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 1 |
| Koala | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 0 |
| Starfish | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 1 | 1 |

## Final step

When this process is completed, FeatureBase applies **Roaring Bitmap** compression which:
* breaks large sets of integers into containers of 2^16 integers (65536 bits)
* which makes computation faster.

The resulting data is inserted into FeatureBase.

## Further information

* [Learn about Roaring Bitmap](https://roaringbitmap.org/about/)
