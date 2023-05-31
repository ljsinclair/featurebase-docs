---
title: Part 2 - bit-slicing and range-encoding
layout: default
parent: Bitmap indexes
grand-parent: Concepts
nav_order: 2
---

## Part 2 - Bit-slicing and range-encoding integer data

In part 1, the basic concepts of bitmaps were explained, how equality encoding works well with Boolean data but has trouble with integers and other data types.

In this part, Bit-slicing and Range encoding integer data is explained which successfully encodes integers in a small number of bitmaps ready for insertion to FeatureBase.

## Before you begin
* [Part 1 - Bitmap indexes and equality encoding data](/docs/concepts/concept-pt1-bitmap-index)

## Sample data

{% include /concepts/concept-eg-species-table-data.md %}

## Step 1 - convert integer values to binary

The `Captive` data can be converted to binary (base-2) as follows:

|  | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| Captive | 011 | 1110111100 | 10011 | 10100 |

{: .note}
Changing the table orientation means the examples that follow will be easier to understand.

| Species | Captive |
|---|---|
| Manatee | 011 |
| Sea Horse | 1110111100 |
| Koala | 10011 |
| Starfish | 10100 |

## Step 2 - Bit slicing the integer values

Bit slicing or Bit Plane slicing converts each binary value into an array of bits. For example:

{% include /concepts/concept-eg-bitmap.md %}
| Sea Horse | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 0 | 0 |
| Koala | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 1 |
| Starfish | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | 0 |

## Step 3 - Equality encoding the values

{: .note}
This step is required to make range encoding more effective in the next step

Equality encoding the binary values means the relationships between `0` or `1` are represented in Boolean terms. This requires two bitmaps:

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

### Step 4 - Range encoding equality encoded bit-sliced indexes

{% include /concepts/concept-range-encoding-summary.md %}

For example, when range-encoding data in the **Bitmap 2^9** data, **Bitmap-1** is encoded as follows:

| Bits --> | 1 | 0 |
|---|---|
| Manatee | 1 | 1 |
| Sea Horse | 1 | 0 |
| Koala | 1 | 1 |
| Starfish | 1 | 1 |

## Step 5 - Application logic

FeatureBase automatically removes the highest-value **Bitmap-1** bitmaps because:
* the data is identical
* the true values can be determined from the remaining bitmaps.

### Avoiding data loss

If values are **only** encoded in the highest value bitmaps, FeatureBase automatically creates a new bitmap to prevent data loss.

For example, the `Sea Horse` captivity values are encoded as follows in **Bitmap 2^9**.

| Bits --> | 1 | 0 |
|---|---|
| Sea Horse | 1 | 0 |

To avoid losing this data, FeatureBase adds a **not_null** bitmap which will not be automatically deleted.

| Bits --> | not_null | 0 |
|---|---|
| Manatee | 1 | 1 |
| Sea Horse | 1 | 0 |
| Koala | 1 | 1 |
| Starfish | 1 | 1 |

### The final bitmaps

As a point of comparison, here are the original bit-sliced integer values:

|  | 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| Manatee | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 |
| Sea Horse | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 0 | 0 |
| Koala | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 1 |
| Starfish | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | 0 |

These bitmaps comprise the data once range encoding is completed, high-value columns are removed, and a `not_null` bitmap is added to retain data.

|  | not_null |512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Manatee | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 |
| Sea Horse | 1 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 1 |
| Koala | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 0 |
| Starfish | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 1 | 1 |

## Step 6 - Compressing the data before inserting to FeatureBase

Roaring Bitmap compression is applied to the final bitmaps which:
* breaks large sets of integers into containers of 2^16 integers (65536 bits)
* which makes computation faster.

The resulting data is inserted into FeatureBase.

## Further information

* [Learn about Roaring Bitmaps](https://roaringbitmap.org/about/)
