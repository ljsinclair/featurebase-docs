---
title: Bitmap data overview
layout: default
parent: Concepts
has_children: false
nav_order: 1
---

# What are bitmap indexes
{: .no_toc }


FeatureBase Bitmap Indexes are equivalent to RDBMS indexes but maintained within logically separate infrastructure. This approach allows:
* data to be indexed from multiple sources
* increased speed and availability of data
* aggregate and statistical queries to be made without touching source data
* hardware and infrastructure can be scaled independently of source data

FeatureBase stores integer values in Base-2, Range-Encoded, Bit-sliced Indexes.

These are then compressed to Roaring Bitmap format to reduce storage overheads.

{% include page-toc.md %}

## Example source table




## Range encoded bitmaps

Range encoding involves setting a bit to correspond to a specific value **n** but also for values **> n**. This allows users to perform range queries on a smaller number of bitmaps without requiring an **OR** operation.

Range encoding the example table results in:





The drawback of range encoding is that representing all possible values requires **n+1** bitmaps. For example, there will be 1001 bitmaps to represent values between 0 and 1000. This becomes a larger issue where values have high cardinality.

FeatureBase uses Bit Sliced Indexes to resolve this issue

## Bit sliced index

Integer columns are represented as bitstrings to reduce storage overheads and make queries more efficient.

### Example table



### Bit slice index




## Roaring Bitmap compression

Roaring bitmap compression breaks large sets of integers into containers of 2^16 integers (65536 bits) which makes computation faster.

* [Learn about Roaring Bitmap](https://roaringbitmap.org/about/)

## Example

A source table has the following structure:

| user_id | operating system | age | hobbies |
|---|---|---|---|
| 0 | linux | 27 | skiing, woodworking |
| 1 | windows | 18 | reading |
| 2 | windows | 35 |  |

## Bit sliced index

user_id is represented using bit-sliced indexing:

|---|
| 100 |
| 010 |
| 001 |

This means the `ice_cream` column needs only two rows:

| ice_cream | bitmap |
|---|---|
| chocolate | 100 |
| vanilla | 011 |




By implementing range-encoded bitmaps in FeatureBase, users can now store integer values that pertain to billions of objects, and very quickly perform queries that filter by a range of values. We also support aggregation queries like Sum()


Bit sliced indexing is used to represent the number of bitmaps, reduce storage overheads and to make queries more efficient.

## Further information

* [Learn about range encoded bitmaps and bit sliced indexing](https://www.featurebase.com/blog/range-encoded-bitmaps){:target="_blank"}
* [Bit Sliced Index arithmetic](https://www.researchgate.net/publication/221215144_Bit-Sliced_Index_Arithmetic)
*

<!-- Sources
https://mwhittaker.github.io/papers/html/o1997improved.html - info on bit slice indexes

-->
