---
title: Bitmap index overview
layout: default
parent: Concepts
has_children: true
nav_order: 1
has_toc: false
---
# An overview of FeatureBase bitmaps
{: .no_toc }

FeatureBase converts data to base-2 (binary) in two types of bitmap:
* Equality encoded bitmaps for non-integer values, or
* Bit-sliced bitmaps which slice integer values into a single bitmap for each power of two

{% include page-toc.md %}

## Before you begin

* [Learn about cardinality and data normalization](/docs/concepts/concepts-home)

## Why use bitmaps for data storage?

Bitmaps make updates and queries faster because the data is encoded as `1` or `0`.

### Faster updates

Bitmap updates in FeatureBase are faster for two reasons.

| Bitmap type | Update description |
|---|---|
| Standard | FeatureBase can directly update a value encoded as a standard bitmap without needing to traverse other values in the structure |
| Bit-slice | Updates to bit-slice bitmaps mean flipping or adding bits rather than altering the entire value |

### Faster queries

There are two limitations to every data query:
* Latency, where the structure and encoding cause delays returning results
* Concurrency, where queries slow down because multiple users are accessing the same data at the same time

FeatureBase addresses these limitations as follows:

| Limitation | Solution | Description |
|---|---|---|
| Concurrency | Lower latency queries | Faster queries mean data is accessed for shorter times, which reduces the number of connections and concurrency issues |
| Latency | Data encoded in base-2 | Boolean queries such as `WHERE` and `OR` are substantially faster because data relationships are represented as `1` (they exist) or `0` (they don't exist) |
| Latency | Data encoded as bitmap or bit-slice | Queries can directly and sequentially access specified values without needing to traverse all other values in a database table |
| Latency | Bit-slice bitmaps | Range queries can be built as a combination of underlying bitmaps rather than as a complex mix of tables and columns |

## What are the drawbacks of Bitmaps?

Bitmaps have two main issues:
* low-cardinality data duplication
* data storage overheads

### Low cardinality data duplication

FeatureBase overcomes low-cardinality issues with four unique data types suitable for `integer` or `string` values.

* [Learn about `SET` and `SETQ` data types](/docs/sql-guide/data-types/data-types-home#low-cardinality-data-types)

### Data storage overheads

{% include /concepts/concept-bitmap-storage-overhead-table.md %}

* [Learn about Roaring Bitmap Format](/docs/concepts/concept-roaring-bitmap-format)

## What bitmaps are created for my data?

Data is converted to bitmaps based on the destination data type:

{% include /sql-guide/datatypes-bitmap-table.md %}

## Are column names converted to bitmaps?

{% include /concepts/concept-table-def-save-to-disk.md %}

## Further information

* [Learn about equality encoded bitmaps](/docs/concepts/concept-bitmaps-equality-encoded)
* [Learn about bit-sliced bitmaps](/docs/concepts/concept-bitmaps-bit-slice)
* [Learn about importing data to FeatureBase](/docs/concepts/overview-data-modeling)
