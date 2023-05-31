---
title: Part 2 - bit-slicing and range-encoding
layout: default
parent: Bitmap index overview
grand_parent: Concepts
nav_order: 2
---

# Part 2 - Bit-slicing and range-encoding integer data
{: .no_toc }

In part 1, the basic concepts of bitmaps were explained, how equality encoding works well with Boolean data but has trouble with integers and other data types.

In this part, the sample captivity data is Bit-sliced and Range-encoded to demonstrate how FeatureBase prepares data ready for final Roaring Bitmap compression.

After this, data is inserted into FeatureBase ready for querying.

{% include page-toc.md %}

## Before you begin

* [Part 1 - Bitmap indexes and equality encoding data](/docs/concepts/concept-pt1-bitmap-index)

## Sample data

{% include /concepts/concept-eg-species-table-data.md %}

The `Species` and `Captivity` data is to be imported to FeatureBase.

## Step 1 - convert `Captivity` integer values to binary

The `Captivity` data can be converted to binary (base-2) as follows:

| Species | Captivity |
|---|---|
| Manatee | 011 |
| Sea Horse | 1110111100 |
| Koala | 10011 |
| Starfish | 10100 |

## Step 2 - Bit slicing the integer values

Bit slicing or Bit Plane slicing converts each binary value into an array of bits.

{% include /concepts/concept-eg-bit-slice-species-Captivity-table.md %}

## Step 3 - Range encoding

{% include /concepts/concept-range-encoding-summary.md %}

When Range encoding, each value needs a bitmap to represent the highest and lowest value.

This means the bit-sliced indexes are now represented with:
* one bitmap representing `1`
* one bitmap representing `0`

### Bitmap `2^0 = 1`

|  | 1 | 0 |
|---|---|
| Manatee | 1 | 1 |
| Sea Horse | 1 | 1 |
| Koala | 1 | 0 |
| Starfish | 1 | 1 |

### Bitmap `2^1=2`

|  | 1 | 0 |
|---|---|
| Manatee | 1 | 0 |
| Sea Horse | 1 | 1 |
| Koala | 1 | 0 |
| Starfish | 1 | 1 |

### Bitmap `2^2=4`

|  | 1 | 0 |
|---|---|
| Manatee | 1 | 0 |
| Sea Horse | 1 | 0 |
| Koala | 1 | 1 |
| Starfish | 1 | 0 |

### Bitmap `2^3=8`

|  | 1 | 0 |
|---|---|
| Manatee | 1 | 1 |
| Sea Horse | 1 | 0 |
| Koala | 1 | 1 |
| Starfish | 1 | 0 |

### Bitmap `2^4=16`

|  | 1 | 0 |
|---|---|
| Manatee | 1 | 1 |
| Sea Horse | 1 | 0 |
| Koala | 1 | 1 |
| Starfish | 0 | 1 |

### Bitmap `2^5=32`

|  | 1 | 0 |
|---|---|
| Manatee | 1 | 1 |
| Sea Horse | 1 | 0 |
| Koala | 1 | 0 |
| Starfish | 1 | 0 |

### Bitmap `2^6=64`

|  | 1 | 0 |
|---|---|
| Manatee | 1 | 1 |
| Sea Horse | 1 | 1 |
| Koala | 1 | 1 |
| Starfish | 1 | 1 |

### Bitmap `2^7=128`

|  | 1 | 0 |
|---|---|
| Manatee | 1 | 1 |
| Sea Horse | 1 | 0 |
| Koala | 1 | 1 |
| Starfish | 0 | 1 |

### Bitmap `2^8=256`

|  | 1 | 0 |
|---|---|
| Manatee | 1 | 1 |
| Sea Horse | 1 | 0 |
| Koala | 1 | 1 |
| Starfish | 0 | 1 |

### Bitmap `2^9=512`

|  | 1 | 0 |
|---|---|
| Manatee | 1 | 1 |
| Sea Horse | 1 | 0 |
| Koala | 1 | 1 |
| Starfish | 0 | 1 |

## Step 4 - Application logic

FeatureBase automatically removes highest value bitmaps because:
* the data is identical
* the true values can be determined from the remaining bitmaps.

### Avoiding data loss

If values are **only** encoded in the highest value bitmaps, FeatureBase automatically creates a new bitmap to prevent data loss.

For example, the `Sea Horse` captivity values in **Bitmap-1** are encoded as follows in **Bitmap 2^9**.

|  | 1 | 0 |
|---|---|
| Sea Horse | 1 | 0 |

To avoid losing this data, FeatureBase adds a **not_null** bitmap:
<!--Query -- I wonder if it actually just changes the name?-->
|  | not_null | 0 |
|---|---|
| Manatee | 1 | 1 |
| Sea Horse | 1 | 0 |
| Koala | 1 | 1 |
| Starfish | 1 | 1 |

### The final bitmaps

As a point of comparison, here are the original bit-sliced integer values:

{% include /concepts/concept-eg-bit-slice-species-Captivity-table.md %}

These bitmaps comprise the data once range encoding is completed, high-value columns are removed, and a `not_null` bitmap is added to retain data.

|  | not_null | 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Manatee | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 |
| Sea Horse | 1 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 1 |
| Koala | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 0 |
| Starfish | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 1 | 1 |

## Step 5 - Compressing the data before inserting to FeatureBase

Roaring Bitmap compression is applied to the final bitmaps which:
* breaks large sets of integers into containers of 2^16 integers (65536 bits)
* which makes computation faster.

The resulting data is inserted into FeatureBase.

## Further information

* [Learn about Roaring Bitmaps](https://roaringbitmap.org/about/)
