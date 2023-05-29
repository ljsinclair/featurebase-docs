---
title: Bitmap indexes
layout: default
parent: Concepts
nav_order: 1
---

<!--References:
* Bitmaps -- https://www.featurebase.com/blog/bitmaps-making-real-time-analytics-real
* Row, column oriented method relating to bitmaps -- https://app.slack.com/client/T2M810Z29/C059DQTQGLB
* bitmap encoding, range encoded bitmaps, bit slice bitmaps -- https://www.featurebase.com/blog/range-encoded-bitmaps
-->

# How does FeatureBase convert then store my data?

This high-level overview explains the methods FeatureBase uses to convert your data to Roaring Bitmap format before inserting to FeatureBase.

The following terms are explained with examples:
* Range encoding
* Bit slicing
* Bitmap indexes

{: .important}
Featurebase presents your data in traditional row and column orientation in the GUI. This is for convenience only and does not represent the underlying data format.


## Before you begin

* [Learn how FeatureBase differs to traditional databases](/docs/concepts/concepts-home)
* [Learn about data cardinality](/docs/concepts/concepts-home#cardinality-describes-relationships-between-data)

## Data representation in traditional databases

In traditional databases, the relationships between data is determined by its position in a row and column. For example:

| Species | Vertebrae | Captive |
|---|---|---|
| Manatee | Yes | 3 |
| Sea Horse | Yes | 956 |
| Koala | Yes | 19 |
| Starfish | No | 20 |

## High cardinality data represented as equality-encoded bitmaps

High Cardinality data has a one-to-one relationship which means there is no duplication and the data can be represented easily within the row and column dimensions of a single table.

High Cardinality data works well in bitmaps because the relationship either exists or it does not.

For example, the first column values can be represented as a single bitmap:

|  | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| Vertebrate | 1 | 1 | 1 | 0 |

Those species with a backbone are represented by:
* 1 if the species has a backbone
* 0 if the species does not have a backbone

## Low cardinality data representation

Low cardinality values have a one-to-many or many-to-many relationship. The way the data and relationships are represented requires multiple bitmaps.

### Equality encoding one bitmap per value

Specifying a single bitmap per value means the data is accurately recorded, but:
* a new bitmap must be created each time the captivity numbers change
* multiple `OR` operations are required to query the captivity numbers.

For example:

| Captive | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| 3 | 1 | 0 | 0 | 0 |
| 19 | 0 | 0 | 1 | 0 |
| 20 | 0 | 0 | 0 | 1 |
| 956 | 0 | 1 | 0 | 0 |

### Equality encoding with groups of values

Grouping values reduces the number of bitmaps but data is lost. For example:

| Captive | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| 0-500 | 1 | 0 | 1 | 1 |
| 5001-1000 | 0 | 1 | 0 | 0 |

### Range encoding values

Range encoding the bitmaps:
* represents all values accurately
* requires n+1 bitmaps in total, in this case, one bitmap to represent all values between 0 and 956.

For example:

| Captive | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 1 |
| 1 | 0 | 0 | 0 | 0 |
| 2 | 0 | 0 | 0 | 0 |
| 3 | 1 | 0 | 0 | 0 |
| 4 | 0 | 0 | 0 | 0 |
| 5 | 1 | 0 | 0 | 0 |
| ...|  |  |  |
| 9 | 0 | 0 | 1 | 0 |
| 10 | 0 | 0 | 1 | 0 |
| ...|  |  |  |
| 14 | 1 | 0 | 1 | 0 |
| 15 | 1 | 0 | 1 | 0 |
| ...|  |  |  |
| 20 | 1 | 0 | 1 | 1 |
| ...|  |  |  |
| 956 | 1 | 1 | 1 | 1 |

### Bit slicing values

Bit slicing can represent numerical values in base 10 using 30 indexes instead of 957.

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
