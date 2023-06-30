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

FeatureBase uses Bitmaps for primary storage because they make queries faster:
* Because each value is encoded as a single bitmap, queries can be made on specific values rather than needing to run through every single value in a column.
* Base-2 (binary) encoding data means values in each bitmap are either **True** (1) or **False** (0). Therefore queries featuring Boolean clauses such as `WHERE`, `OR`, etc are faster.

## What are the drawbacks of Bitmaps?

The number of bitmaps in a system increase rapidly because each value is encoded as an individual bitmap.

Additionally, the size of uncompressed bitmaps scale with the cardinality of the value not just the number of values. For example, a dataset of 10,000 distinct values will be stored:
* in approximately 20-30MB in a traditional database
* in approximately 1.25GB for a bitmap database

FeatureBase compresses bitmaps using **Roaring Bitmap Format**, a variation on **Roaring Bitmaps**.

## Which bitmap type will be created for my data?

FeatureBase converts data types to bitmaps as follows:

{% include /sql-guide/datatypes-bitmap-table.md %}

## Which bitmaps are used for low cardinality data?

Standard bitmaps are used for low cardinality data mapped to the four FeatureBase `SET` and `SETQ` data types.

* [Learn about low cardinality `SET` and `SETQ` data types](/docs/sql-guide/data-types/data-types-home#low-cardinality-data-types)

## Are column names converted to bitmaps?

{% include /concepts/concept-table-def-save-to-disk.md %}

## Explaining Bitmaps

FeatureBase Bitmaps are explained in three parts:

| Part | Bitmap type | Description | Additional information |
|:---:|---|---|---|
| 1 | Standard | A high-level explanation of bitmaps and how data is encoded, including issues which may occur. | [Part 1 - Standard Bitmaps and encoding methods](/docs/concepts/concept-bitmaps-pt1-standard-bitmaps) |
| 2 | Bit sliced | A high-level explanation and demonstration of how Integer data is converted to base-2 then bit-sliced. | [Part 2 - Bit slice bitmaps](/docs/concepts/concept-bitmaps-pt2-bit-slice-bitmaps) |
| 3 | Roaring Bitmap Format (RBF) | An explanation of how Roaring Bitmap Format is used to compress Bitmap data and how updates are made. | [Part 3 - Roaring Bitmap Format](/docs/concepts/concept-bitmaps-pt3-roaring-bitmap-format) |
