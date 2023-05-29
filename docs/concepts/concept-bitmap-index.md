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

## Data storage the traditional way

In traditional databases, the relationships between data is determined by its position in a row and column. For example:

TABLE GOES HERE

## FeatureBase Bitmap encoding

## High cardinality data represented as equality-encoded bitmaps

High Cardinality data has a one-to-one relationship which means there is no duplication and the data can be represented easily within the row and column dimensions of a single table.

High Cardinality data works well in bitmaps because the relationship either exists or it does not.

For example, a single bitmap (represented as a row) may be represented as follows:
|  | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| Vertebrate | 1 | 1 | 1 | 0 |

Those species with a backbone are represented by:
* 1 if the species has a backbone
* 0 if the species does not have a backbone

## Low cardinality data representation using range encoding

Low cardinality values have a one-to-many or many-to-many relationship.

For example, species in captivity may be represented in two ways when equality-encoding.

### One bitmap per value

Specifying a single bitmap per value means the data is accurately recorded, but:
* a new bitmap must be created each time the captivity numbers change
* multiple `OR` operations are required to query the captivity numbers.

For example:

| Captive | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| 3 | 1 | 0 | 0 | 0 |
| 14 | 0 | 0 | 1 | 0 |
| 21 | 0 | 0 | 0 | 1 |
| 956 | 0 | 1 | 0 | 0 |

### Specify a grouping of values for each bitmap

Grouping values reduces the number of bitmaps but data is lost. For example:

| Captive | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| 0-500 | 1 | 0 | 1 | 1 |
| 5001-1000 | 0 | 1 | 0 | 0 |

### Range encoding the data

Range encoding is similar to equality-encoding the data but also encodes a bit for each bitmap that follows. This means:
* a bitmap can represent the captivity counts for all animals
* range queries can be performed using a far smaller number of bitmaps
* to represent all values requires n+1 bitmaps, in this case 957 bitmaps

For example:

| Captive | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| 1 | 0 | 0 | 0 | 0 |
| 2 | 0 | 0 | 0 | 0 |
| 3 | 1 | 0 | 0 | 0 |
| 4 | 1 | 0 | 0 | 0 |
| 5 | 1 | 0 | 0 | 0 |
| ...|  |  |  |
| 14 | 1 | 0 | 1 | 0 |
| 15 | 1 | 0 | 1 | 0 |
| ...|  |  |  |
| 21 | 1 | 0 | 1 | 1 |
| ...|  |  |  |
| 956 | 1 | 1 | 1 | 1 |

### Bit slice indexes

Bit slice indexes allows the representation of low cardinality data, that is, data with a one-to-many or many-to-many relationships.

A bit sliced index allows groups of values to be represented in a single row.

As a starting point, the data can be encoded as follows:

| Captive | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| Units | 3 | 6 | 4 | 1 |
| Tens | 0 | 5 | 1 | 2 |
| Hundreds | 0 | 9 | 0 | 0 |

Three bit-sliced indexes can then represent the data:

### bit sliced units index:

| Captive | Manatee | Sea Horse | Koala | Starfish |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 1 | 0 | 0 | 0 | 1 |
| 2 | 0 | 0 | 0 | 0 |
| 3 | 1 | 0 | 0 | 0 |
| 4 | 0 | 0 | 1 | 0 |
| 5 | 0 | 0 | 0 | 0 |
| 6 | 0 | 1 | 0 | 0 |
| 7 | 0 | 0 | 0 | 0 |
| 8 | 0 | 0 | 0 | 0 |
| 9 | 0 | 0 | 0 | 0 |

#### Bit-sliced tens index

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

#### Bit-sliced hundreds index

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

### Range encoded bit-sliced index

Adding range-encoding to the three bit sliced indexes means



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
