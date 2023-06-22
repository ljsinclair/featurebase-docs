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

This overview uses sample data to help explain the two types of bitmap.

{% include page-toc.md %}

## Before you begin

* [Learn about cardinality and data normalization](/docs/concepts/concepts-home)

## Which bitmap type will be created for my data?

FeatureBase converts data types to bitmaps as follows:

| User data | FeatureBase data type | Bitmap type |
|---|---|---|
| Boolean | Bool | standard bitmap |
| Floating point | Decimal | Bit-sliced index |
| Unsigned integer | ID | standard bitmap |
| Signed Integer | Integer | Bit-sliced index |
| Alphanumeric | String | standard bitmap |
| Date and time | Timestamp | Bit-sliced index |

## Which bitmaps are used for low cardinality data?

Standard bitmaps are used for low cardinality data mapped to the four FeatureBase `SET` and `SETQ` data types.

* [Learn about low cardinality `SET` and `SETQ` data types](/docs/sql-guide/data-types/data-types-home#low-cardinality-data-types)

## Are column names converted to bitmaps?

Column names are stored as file names in the:
* FeatureBase Cloud `etcd` directory, or
* [FeatureBase Community data directory](/docs/community/com-config/com-config-data-directory)

## Explaining Bitmaps

Bitmaps are explained in two parts:

| Part | Bitmap type | Description | Additional information |
|:---:|---|---|---|
| 1 | Traditional | A high-level explanation of bitmaps and how data is encoded, including issues which may occur. | [Part 1 - Bitmap index](/docs/concepts/concept-fb-bitmaps-pt1-standard-bitmaps) |
| 2 | Bit sliced | A high-level explanation and demonstration of how Integer data is converted to base-2 then bit-sliced. | [Part 2 - Bit slice index](/docs/concepts/concept-fb-bitmaps-pt2-base-2-bit-slice-bitmaps) |

## Why is Roaring Bitmap compression used on my data?

Roaring Bitmap compression is applied to the final bitmaps which makes computation faster.

This involves breaking large sets of integers into containers of:
* 2^16 integers, or
* 65536 bits

## Further information

* [Learn about Roaring Bitmaps](https://roaringbitmap.org/about/)
