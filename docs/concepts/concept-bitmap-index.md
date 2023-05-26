---
title: Bitmap indexes
layout: default
parent: Concepts
nav_order: 1
---

# How does FeatureBase use bitmap indexes to reduce storage overheads?

Bitmap indexes have traditionally been used to store data with low cardinality, with a one-to-one relationship between data in rows and columns.

{: .important}
CLARIFY THE USERS WON"T SEE THIS! It's underlying system stuff.
the GUI represents tables in the traditional manner
queries return data based on SQL queries
The underlying data is stored this way.

## Before you begin

* [Learn how FeatureBase differs to traditional databases](/docs/concepts/concepts-home)
* [Learn about data cardinality](/docs/concepts/concepts-home#cardinality-describes-relationships-between-data)

## FeatureBase approach to data storage

<!--NOTE TO SELF -- this should explain bitmap encoding, bit slice, range encoding which means the ingest stuff will just reference it-->

In traditional databases, the relationships between data is determined by its position in a row and column.

TABLE GOES HERE

### Bitmap encoding

In FeatureBase the relationships are represented as an array of ones and zeroes:
* `1` designates a relationship
* `0` designates no relationship

TABLE GOES HERE

ADAPT * bitmap encoding -- https://www.featurebase.com/blog/range-encoded-bitmaps





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
