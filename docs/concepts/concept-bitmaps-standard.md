---
title: Standard bitmaps
layout: default
parent: Bitmap index overview
grand_parent: Concepts
nav_order: 1
---

# What are bitmaps and how are they encoded?
{: .no_toc }

FeatureBase encodes certain values as individual bitmaps. This involves:
* saving values to disk as column identifiers
* using binary values to represent the existence or absence of a relationship between the row `_id` and the column

This overview uses examples to explain how values are encoded for standard bitmaps.

{% include page-toc.md %}

## Before you begin

* [Learn how FeatureBase differs to traditional databases](/docs/concepts/concepts-home)
* [Learn about FeatureBase bitmaps](/docs/concepts/concept-bitmaps)

## What data types are converted to standard bitmaps?

{% include /concepts/concept-bitmap-standard-data-type-table.md %}

## How is data encoded?

Equality encoding is the process of representing relationships between:
* values written to disk as column names, and
* row identifiers

For example, a source table containing historical names for the FeatureBase product is structured as follows:

| id | historical_names |
|---|---|
| 01 | Pilosa |
| 02 | Molecula |
| 03 | FeatureBase |

Equality encoding represents this data as follows:

| ID | Pilosa | Molecula | FeatureBase |
|---|---|---|---|
| 1 | 1 | 0 | 0 |

| ID | Pilosa | Molecula | FeatureBase |
|---|---|---|---|
| 2 | 0 | 1 | 0 |

| ID | Pilosa | Molecula | FeatureBase |
|---|---|---|---|
| 3 | 0 | 0 | 1 |

## Equality encoding integer values

Equality encoding integer values is less effective because the relationships cannot easily be represented in binary terms.

For example, the downloads for historical products are represented as follows:

| ID | historical_product | downloads |
| 1 | Pilosa | 10,000 |
| 2 | Molecula | 18,524 |
| 3 | FeatureBase | 50,000 |

### Equality encoding specific values

If the download value is used as the unique identifier, the data can be equality encoded as follows:

| id-downloads | Pilosa | Molecula | FeatureBase |
|---|---|
| 10000 | 1 | 0 | 0 |

| id-downloads | Pilosa | Molecula | FeatureBase |
|---|---|
| 18524 | 0 | 1 | 0 |

| id-downloads | Pilosa | Molecula | FeatureBase |
|---|---|
| 50000 | 0 | 0 | 1 |

The issue with equality encoding integers in this way is that two operations are required to update download numbers for any of the products:
* A new bitmap created with the updated download numbers
* the original bitmap deleted

### Encoding values as a range

Values can be encoded as a range which reduces the number of bitmaps and create/delete operations.

| id-download-range | Pilosa | Molecula | FeatureBase |
|---|---|---|
| 0-25000 | 1 | 1 | 0 |
| 25001-50000 | 0 | 0 | 1 |

The main issue with encoding as a range of values is the specifics are lost.

## Encoding integer values with bit-slice bitmaps

FeatureBase uses bit-slice bitmaps to overcome equality encoding issues.

* [Learn about bit-slice bitmaps](/docs/concepts/concept-bitmaps-bit-slice)

## Further information

* [Learn about bitmap compression with Roaring Bitmap Format](/docs/concepts/concept-roaring-bitmap-format)
