---
title: Bitmap indexes
layout: default
parent: Concepts
nav_order: 1
---

<!--References:
* Bitmaps -- https://www.featurebase.com/blog/bitmaps-making-real-time-analytics-real
* Row, column oriented method relating to bitmaps -- https://app.slack.com/client/T2M810Z29/C059DQTQGLB
* bitmap encoding, range encoded bitmaps, bit slice bitmaps -- https://www.featurebase.com/blog/range-encoded-bitmaps
-->

# How does FeatureBase store data?

{: .important}
The FeatureBase GUI and SQL queries represent data in traditional row and column orientation. This discussion concerns how data is stored within the system.

## Before you begin

* [Learn how FeatureBase differs to traditional databases](/docs/concepts/concepts-home)
* [Learn about data cardinality](/docs/concepts/concepts-home#cardinality-describes-relationships-between-data)

## Data storage the traditional way

In traditional databases, the relationships between data is determined by its position in a row and column. For example:

TABLE GOES HERE

## FeatureBase Bitmap encoding

In FeatureBase the relationships are represented as an array of ones and zeroes:
* `1` designates a relationship
* `0` designates no relationship

## Example

A table with one-to-many relationships would typically be split into separate tables.

{% include /concepts-concept-eg1-one-many.md %}

This data is represented in a bitmap as follows:

| StudentID | English | Finance | French | Geography | History |
|---|---|---|---|---|---|
| 01 | 1 | 0 | 1 | 0 | 1 |
| 02 | 0 | 1 | 1 | 1 | 0 |

<!--Note to self -- separate this into 2 bitmaps to make the point -->

### Equality encoded bitmaps

<!--(SEE Equality-encoded Bitmaps on https://www.featurebase.com/blog/range-encoded-bitmaps)-->

Benefits and costs


### Range encoded bitmaps






The table above can be represented as follows:

TABLE GOES HERE

## Advantages of bitmap encoding





## Roaring Bitmap compression

Roaring bitmap compression breaks large sets of integers into containers of 2^16 integers (65536 bits) which makes computation faster.

* [Learn about Roaring Bitmap](https://roaringbitmap.org/about/)




FeatureBase reverses the logicrepresenting the relationships as an array of ones and zeroes



FeatureBase instead store

FeatureBase






References:

https://www.featurebase.com/blog/bitmaps-making-real-time-analytics-real
* bitmap encoding -- https://www.featurebase.com/blog/range-encoded-bitmaps


Garrett diagrams:

* https://app.slack.com/client/T2M810Z29/C059DQTQGLB
* https://app.slack.com/client/T2M810Z29/C059DQTQGLB


## Further information

* [Bitmap index on Wikipedia](https://en.wikipedia.org/wiki/Bitmap_index)
