---
title: Bitmap index overview
layout: default
parent: Concepts
has_children: true
nav_order: 1
---
# An overview of FeatureBase bitmaps
{: .no_toc }

FeatureBase converts data to base-2 bitmaps of two types:
* standard bitmaps
* bit-slice bitmaps

{% include page-toc.md %}

## Before you begin

* [Learn about cardinality and data normalization](/docs/concepts/concepts-home)

## Which bitmap type will be created for my data?

Data is converted to bitmaps based on the destination data type:

{% include /sql-guide/datatypes-bitmap-table.md %}

## Are column names converted to bitmaps?

{% include /concepts/concept-table-def-save-to-disk.md %}

## Why use bitmaps for data storage?

## Updating data

Updates are faster because data is stored:
* in base-2
* as an individual bitmap rather than within a row and column format

This means an alteration involves flipping bits to `1` or `0`

## Querying data

There are two limitations to every data query:
* Latency, where the structure and encoding cause delays returning results
* Concurrency, where queries slow down because multiple users are accessing the same data at the same time

| Limitation | Solution | Description |
|---|---|---|
| Latency | Data encoded in base-2 | Boolean queries such as `WHERE` and `OR` are substantially faster because data relationships are represented as `1` (they exist) or `0` (they don't exist) |
| Latency | Data encoded as bitmap or bit-slice | Values are encoded as individual bitmaps, therefore queries can directly and sequentially access specified values without needing to traverse all other values in a database table |
| Latency | Bit-slice bitmaps | Range queries can be built as a combination of underlying bitmaps rather than as a complex mix of tables and columns |
| Concurrency | Lower latency queries | Faster queries mean data is accessed for shorter times, which reduces the number of connections and concurrency issues |

## What are the drawbacks of Bitmaps?

Bitmaps have two main issues:
* low-cardinality data duplication
* data storage overheads

### Low cardinality data duplication

{% include /sql-guide/datatype-set-setq-summary.md %}

* [Learn about `SET` and `SETQ` data types](/docs/sql-guide/data-types/data-types-home#low-cardinality-data-types)

### Data storage overheads

{% include /concepts/concept-bitmap-storage-overhead-table.md %}

* [Learn about Roaring Bitmap Format](/docs/concepts/concept-roaring-bitmap-format)
