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

## Why use bitmaps for data storage?

FeatureBase bitmap-base data format encodes data as either:
* individual bitmaps for each value
* bit-sliced bitmaps that create bitmaps for each power of two

This means:
* Boolean clauses such as `WHERE`, `OR` etc are faster because values are either `0` or `1`
* Queries can start at a specific value in the table rather than needing to pass every other value

## Which bitmap type will be created for my data?

FeatureBase converts data types to bitmaps as follows:

{% include /sql-guide/datatypes-bitmap-table.md %}

## Which values are encoded as bitmaps?

{% include /concepts/concept-bitmap-standard-data-type-table.md %}

## Are column names converted to bitmaps?

{% include /concepts/concept-table-def-save-to-disk.md %}

## What are the drawbacks of Bitmaps?

Uncompressed bitmaps scale with the number of values and the cardinality of that value. For example, a dataset of 10,000 distinct values will be stored:
* in approximately 20-30MB in a traditional database
* in approximately 1.25GB for a bitmap database

FeatureBase overcomes this issue by compressing all bitmap data using Roaring Bitmap Format, based on Roaring Bitmaps.

* [Learn about Roaring Bitmap Format](/docs/concepts/concept-roaring-bitmap-format)
