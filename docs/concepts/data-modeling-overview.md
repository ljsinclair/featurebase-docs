---
title: Data modeling overview
layout: default
parent: Concepts-home
has_children: false
nav_order: 1
---

# Data modeling overview
{: .no_toc }

FeatureBase Bitmap Indexes are equivalent to RDBMS indexes but maintained within logically separate infrastructure. This approach allows:
* data to be indexed from multiple sources
* increased speed and availability of data
* aggregate and statistical queries to be made without touching source data
* hardware and infrastructure can be scaled independently of source data




Data modeling is a process of analysis to determine:
* the source data to import to FeatureBase
* mapping source and target data types
* OTHER THINGS

{% include page-toc.md %}




## Conceptualising how your data is converted

A source table has the following structure:

| user_id | ice_cream | age | hobbies |
|---|---|---|---|
| 0 | chocolate | 27 | skiing, woodworking |
| 1 | vanilla | 18 | reading |
| 2 | vanilla | 35 |  |

The bitmap index is derived from the user_id column, where each digit is a boolean value:

| user_id | bitmap |
|---|---|
| 0 | 100 |
| 1 | 010 |
| 2 | 001 |

The data in the original table can therefore be represented as follows:

| ice_cream | bitmap |
|---|---|
| chocolate | 100 |
| vanilla | 011 |

| hobbies | bitmap |
|---|---|
| skiing | 100 |
| woodwork | 100 |
| reading | 010 |

| age | bitmap |
|---|---|
| 18 | 010 |
| 27 | 100 |
| 35 | 001 |

## Bit sliced indexing

Ordinarily, using range-encoded bitmaps to represent values requires n+1 bitmaps. For example, to represent all possible values between 0 and 1000, you need 1001 bitmaps.

Bit sliced indexing is used to represent the number of bitmaps, reduce storage overheads and to make queries more efficient.

* [Learn about range encoded bitmaps and bit sliced indexing](https://www.featurebase.com/blog/range-encoded-bitmaps){:target="_blank"}

## 
