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

The relationships between data is called **Cardinality** and can be conceptualized as follows:

| Example | Data relationships | Cardinality | Dimensions to represent |
|---|---|---|---|
| A country and capital city | one-to-one | High | Two |
| A country and citizens | one-to-many | Low | Three or more |
| Citizens and government services | many-to-many | Low | Three or more |

### High cardinality data

High cardinality data has a high number of unique relationships which can be represented in a two dimensional table:

{% include /concepts/concept-eg-low-cardinality.md %}

## Low cardinality data

Data described as **low cardinality** have multiple relationships which means they cannot be represented in two dimensions.

{% include /concepts-concept-eg1-one-many.md %}

## Database normalization in relation to data cardinality

Raw data may represent cardinality with duplications and redundant data. This data is said to be **unnormalized**.

Database normalization has a set of **normal forms** or rules which govern how data is represented. The **first normal form** provides rules that include:
* arranging data into two dimensions
* the use of relation names, attributes and keys to reference rows

This set of rules means:
* High cardinality data requires no alteration
* Low cardinality data is recreated into separate two dimensional tables and relationships are maintained using keys

## Benefits and costs of data normalization

Data normalization is not a perfect solution to data cardinality:

| Benefit | Cost |
|---|---|
| Data integrity is easier to maintain | Data in separate tables makes indexing less efficient |
| Less duplication of data means faster inserts, updates and a smaller footprint | `JOIN` clauses are required to query data which makes queries more complex and therefore slower to return results |

DBAs responsible for normalized systems use different methods to overcome the issues and should the benefits outweigh the costs, may denormalize data.

## How does FeatureBase handle data cardinality?

The first thing to understand about FeatureBase is that data exists in a single two-dimensional bitmap index. Relationships are maintained using:

* a unique key for each row of data
* FeatureBase specific data-types which provide an additional dimension for low cardinality data to exist within high cardinality rows.

## Next step

* [Learn how data is encoded in bitmap indexes](/docs/concepts/concept-bitmap-index)
* [Learn how to identify the unique key and map to FeatureBase datatypes](/docs/concepts/concept-data-modeling)

## Further information

* [Cardinality(data modeling) on Wikipedia](https://en.wikipedia.org/wiki/Cardinality_(data_modeling)){:target="_blank"}
* [Database Normalization on Wikipedia](https://en.wikipedia.org/wiki/Database_normalization){:target="_blank"}
* [Database denormalization on Wikipedia](https://en.wikipedia.org/wiki/Denormalization){:target="_blank"}

<!--

### Data integrity solutions

| Solution | Additional information |
|---|---|
| FeatureBase never alters your data, so data integrity is guaranteed | [Learn about ingestion](/docs/concepts/concept-ingestion) |
| All rows are uniquely identified with a string or integer value | [Learn how the `_id` column is used](/docs/concepts/concept-table-id) |
| Specific rules govern insertion and update actions | [Learn how Upsert works](/docs/concepts/concept-upsert) |

### Data duplication solutions

| Solution | Additional information |
|---|---|
| `SET` and `SETQ` data types address cardinality issues in a single row | [Learn about `SET` data types](/docs/concepts/concept-datatype-set) |

### Storage footprint solutions

| Solution | Additional information |
|---|---|
| Data is bit-sliced, range-encoded then converted to base-2 then translated to roaring bitmap format | [Learn how FeatureBase bitmap indexes work](/docs/concepts/concept-bitmap-index) |
| `SETQ` data types can be used with timestamped data to automatically remove data to continually maintain database size. | Data footprint reduced after set time. | [Learn about SETQ data types](/docs/concepts/concept-setq) |

## Next step

* [Learn the techniques used before importing data to FeatureBase]

-->
