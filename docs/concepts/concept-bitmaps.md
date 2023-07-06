---
title: Bitmap index overview
layout: default
parent: Concepts
has_children: true
nav_order: 1
---
# An overview of FeatureBase bitmaps
{: .no_toc }

{% include /concepts/concept-ingest-summary.md %}

This overview uses sample data to help explain the two types of bitmap FeatureBase uses to encode data.

{% include page-toc.md %}

## Before you begin

* [Learn about cardinality and data normalization](/docs/concepts/concepts-home)

## What are bitmaps?


* [Learn about Bitmaps](/docs/concepts/concept-bitmaps-standard)

## Which bitmap type will be created for my data?

Data stored in FeatureBase is stored as:
* individual bitmaps for each value, or
* bit-sliced bitmaps for each power of two.

{% include /sql-guide/datatypes-bitmap-table.md %}

* [Learn about bit-slice bitmaps](/docs/concepts/concept-bitmaps-bit-slice)

## Are column names converted to bitmaps?

{% include /concepts/concept-table-def-save-to-disk.md %}

## Why use bitmaps for data storage?

There are two limitations to every data query:
* Latency, where the structure and encoding cause delays returning results
* Concurrency, where queries slow down because multiple users are accessing the same data at the same time

Queries on bitmap data is substantially faster than data stored in other database types:

| Limitation | Benefit | Description |
|---|---|---|
| Latency | Data encoded in base-2 | Boolean queries such as `WHERE` and `OR` are substantially faster because data relationships are represented as `1` (they exist) or `0` (they don't exist) |
| Latency | Data encoded as bitmap or bit-slice | Values are encoded as individual bitmaps, therefore queries can directly and sequentially access specified values without needing to traverse all other values in a database table |
| Concurrency | Lower latency queries | Faster queries mean data is accessed for shorter times, which reduces the number of connections and concurrency issues |

## What are the drawbacks of Bitmaps?



### Low cardinality data issues




### Data storage overheads

Uncompressed bitmaps scale with the number of values and the cardinality of that value.

| Database | Values saved as | Storage overhed 10,000 value dataset |
|---|---|---|
| RDBMS | Row and column based structure | 20480 - 30720 KB |
| FeatureBase | Individual bitmaps, or<br/>Bitmap for each power of 2 (Bit-slice) | 1280000 KB |

FeatureBase overcomes this issue by compressing all bitmap data using Roaring Bitmap Format, based on Roaring Bitmaps.

* [Learn about Roaring Bitmap Format](/docs/concepts/concept-roaring-bitmap-format)
