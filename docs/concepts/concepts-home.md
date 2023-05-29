---
title: Concepts
layout: default
has_children: true
nav_order: 2
has_toc: true
---
# How does FeatureBase differ to a traditional database?

This high-level overview explains how data is arranged in traditional databases and FeatureBase bitmap databases.

* Cardinality -- the relationships between data
* Normalization -- the act of arranging the data to

## What is cardinality?

The cardinality of data can be expressed as follows:

| Relationship | Cardinality | Dimensions to represent | Example |
|---|---|---|---|
| one-to-one | High | Two | User ID, name and password |
| one-to-many<br/>many-to-many | Low | Three or more | Single account used to access multiple services |
| many-to-many | Low | Three or more | A password manager used to record muliple account usernames and passwords for multiple services |

### High cardinality data

High cardinality data has a high number of unique relationships which can be represented in a two dimensional table:

{% include /concepts/concept-eg-low-cardinality.md %}

## Low cardinality data

Low cardinality data has a lower number of unique values in relation to a high number of duplications which must be represented in additional dimensions:

{% include /concepts-concept-eg1-one-many.md %}

## Normalization removes duplication

Normalization allows all data to be represented in two-dimensional tables by:

* assigning a unique identifier to data with one-to-one cardinality
* inserting this data into separate tables
* using the unique identifier to cross-reference rows in separate tables when querying the data

## Benefits and costs of data normalization

Data normalization is not a perfect solution to data cardinality:

| Benefit | Cost |
|---|---|
| Data integrity is easier to maintain | Data in separate tables makes indexing less efficient |
| Less duplication of data means faster inserts, updates and a smaller footprint | `JOIN` clauses are required to query data which makes queries more complex and therefore slower to return results |

## Overcoming the issues with normalization

DBAs responsible for traditional databases use a number of methods to overcome the issues with normalized data and may in certain cases denormalize data if the benefits outweigh the costs.

The FeatureBase approach is to denormalize data. The issues with this approach are addressed as follows:

### Data integrity solutions

| Solution | Additional information |
|---|---|
| Source data integrity is guaranteed because FeatureBase ingests data using REST API PUSH or Streaming or via flat files | [Learn about ingestion](/docs/concepts/concept-ingestion) |
| All rows are uniquely identified with a string or integer value | [Learn how the `_id` column is used](/docs/concepts/concept-table-id) |
| Specific rules govern insertion and update actions | [Learn how Upsert works](/docs/concepts/concept-upsert) |

### Data duplication solutions

| Solution | Additional information |
|---|---|
| `SET` and `SETQ` data types address cardinality issues in a single row | [Learn about `SET` data types](/docs/concepts/concept-datatype-set) |

### Storage footprint solutions

| Solution | Additional information |
|---|---|
| `SETQ` data types can be used with timestamped data to automatically remove data to continually maintain database size. | Data footprint reduced after set time. | [Learn about SETQ data types](/docs/concepts/concept-setq) |
| Denormalized data is processed during ingestion using range encoding and bit slicing | [Learn about ingestion](/docs/concepts/concept-ingestion) |
| Data is converted to base-2 then converted to the FeatureBase implementation of Roaring Bitmaps before insertion into indexes | [Learn how FeatureBase bitmap indexes work](/docs/concepts/concept-bitmap-index) |

## Next step

* [Learn the techniques used before importing data to FeatureBase]

## Further information

* [Cardinality(data modeling) on Wikipedia](https://en.wikipedia.org/wiki/Cardinality_(data_modeling)){:target="_blank"}
