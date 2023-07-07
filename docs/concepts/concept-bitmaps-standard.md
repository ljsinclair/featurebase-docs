---
title: Standard bitmaps
layout: default
parent: Bitmap index overview
grand_parent: Concepts
nav_order: 1
---

# How does FeatureBase encode non-integer values?
{: .no_toc }

FeatureBase uses **equality** encoding to create a Boolean relationship between a value and its unique identifier. The results are saved as an array which forms a single bitmap.

{% include page-toc.md %}

## Before you begin

* [Learn how FeatureBase differs to traditional databases](/docs/concepts/concepts-home)
* [Learn about FeatureBase bitmaps](/docs/concepts/concept-bitmaps)

## How does equality encoding work?

Equality encoding values works by:
* saving values to disk as column names
* encoding a `1` to represent the relationship between column name and unique row identifier
* encoding a `0` if that relationship does not exist.

As a result, a single bitmap is created for each value.

{% include /concepts/concept-bitmap-source-data-table.md %}

## How does FeatureBase equality encode data?

The `historical_name` data can be equality encoded as follows:

```
| ID | Pilosa | Molecula | FeatureBase |
|---|---|---|---|
| 1 | 1 | 0 | 0 |
```

```
| ID | Pilosa | Molecula | FeatureBase |
|---|---|---|---|
| 2 | 0 | 1 | 0 |
```

```
| ID | Pilosa | Molecula | FeatureBase |
|---|---|---|---|
| 3 | 0 | 0 | 1 |
```

## Equality encoding integer values

Equality encoding integer values is less effective because Boolean relationships are harder to represent.

### Equality encoding specific values

Using the `downloads` column as unique identifier, the data can be encoded as follows:
```
| id-downloads | Pilosa | Molecula | FeatureBase |
|---|---|
| 10000 | 1 | 0 | 0 |
```

```
| id-downloads | Pilosa | Molecula | FeatureBase |
|---|---|
| 18524 | 0 | 1 | 0 |
```

```
| id-downloads | Pilosa | Molecula | FeatureBase |
|---|---|
| 50000 | 0 | 0 | 1 |
```

#### Issues equality encoding integers

The issue with equality encoding integers in this way is that two operations are required to update download numbers for any of the products:
* A new bitmap created with the updated download numbers
* the original bitmap deleted

### Encoding values as a range

Values can be encoded as a range which reduces the number of bitmaps and create/delete operations.

```
| id-download-range | Pilosa | Molecula | FeatureBase |
|---|---|---|
| 0-25000 | 1 | 1 | 0 |
| 25001-50000 | 0 | 0 | 1 |
```

#### Issues equality encoding as range

The fundamental issue with this approach is the specific values are lost.

### Solution: bit-slice bitmaps

To avoid the issues with equality encoding, FeatureBase encodes integer values as bit-slice bitmaps.

* [Learn about bit-slice bitmaps](/docs/concepts/concept-bitmaps-bit-slice)

## Further information

* [Learn about bitmap compression with Roaring Bitmap Format](/docs/concepts/concept-roaring-bitmap-format)
