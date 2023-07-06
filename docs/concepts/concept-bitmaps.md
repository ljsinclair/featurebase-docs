---
title: Bitmap index overview
layout: default
parent: Concepts
has_children: true
nav_order: 1
---

<!-- Add in the benefits of bitmaps from https://www.featurebase.com/blog/bitmaps-making-real-time-analytics-real plus (maybe) https://drive.google.com/file/d/1ArKaqwuGtPcwbE_SLYUFMakipzRbF44x/view -->

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

## Explaining Bitmaps

FeatureBase Bitmaps are explained in three parts:

| Part | Bitmap type | Description | Additional information |
|:---:|---|---|---|
| 1 | Standard | A high-level explanation of bitmaps and how data is encoded, including issues which may occur. | [Part 1 - Standard Bitmaps and encoding methods](/docs/concepts/concept-bitmaps-standard) |
| 2 | Bit sliced | A high-level explanation and demonstration of how Integer data is converted to base-2 then bit-sliced. | [Part 2 - Bit slice bitmaps](/docs/concepts/concept-bitmaps-bit-slice) |
| 3 | Roaring Bitmap Format (RBF) | An explanation of how Roaring Bitmap Format is used to compress Bitmap data and how updates are made. | [Part 3 - Roaring Bitmap Format](/docs/concepts/concept-roaring-bitmap-format) |
