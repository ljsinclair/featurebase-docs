---
title: Concepts
layout: default
has_children: true
nav_order: 2
has_toc: true
---
# How does FeatureBase differ to a traditional database?

In traditional database design, the relationships between data is the starting point to determine the arrangement of data in rows, columns and tables.

The relationships between data is called **Cardinality** whilst the act of arranging the data is called **Normalization**.

## Relationships between data

The cardinality of data can be expressed as follows:

* One-to-one
* One-to-many
* Many-to-many

### One-to-one cardinality

One-to-one cardinality contains no duplication so can be represented in a two dimensional table:

| StudentID | Student_name | Student_surname |
|---|---|---|
| 01 | Charles | Voss |
| 02 | Regina | Lambert |
| 03 | Peter | Joshua |
| 04 | Herman | Scobie |

## One-to-many and many-to-many cardinality

One-to-many and many-to-many cardinality cannot be represented in a two dimensional table because values become duplicated:

| StudentID | Subjects |
|---|---|
| 01 | English, French, History |
| 02 | French, Geography, Finance |

| StudentID | Subject |
|---|---|
| 01 | English |
| 01 | French |
| 01 | History |
| 02 | French |
| 02 | Geography |
| 02 | Finance |

## Normalization removes duplication

Normalization allows all data to be represented in two-dimensional tables by:

* identifying data with one-to-one cardinality and assigning a unique identifier
* uses the unique identifier to act as a cross-reference to rows in separate tables

## Benefits and costs of data normalization

Data normalization is not a perfect solution to data cardinality:

| Benefit | Cost |
|---|---|
| Data integrity is easier to maintain | Data in separate tables makes indexing less efficient |
| Less duplication of data means faster inserts, updates and a smaller footprint | `JOIN` clauses are required to query data which makes queries more complex and therefore slower to return results |

Database tuning is used to overcome these issues and DBAs may in certain cases involve denormalizing data.

## How does FeatureBase overcome these issues?

To overcome issues with normalized data, FeatureBase represents all data in a denormalized two-dimensional structure determined by the user before importing. Several techniques are used to resolve the problems of this approach.

### Data integrity solutions

| Solution | Additional information |
|---|---|
| All rows are uniquely identified with a string or integer value | [Learn how the `_id` column is used](/docs/concepts/concept-table-id) |
| Specific rules govern insertion and update actions | [Learn how Upsert works](/docs/concepts/concept-upsert) |

### Data duplication solutions

| Solution | Additional information |
|---|---|
| `SET` data types address cardinality issues in a single row | [Learn about `SET` data types](/docs/concepts/concept-datatype-set) |

### Storage footprint solutions

| Solution | Additional information |
|---|---|
| FeatureBase stores data in bitmaps which represent relationships as ones and zeroes and represents data relationships as ones and zeroes | [Learn how FeatureBase bitmap indexes work](/docs/concepts/concept-bitmap-index) |
| Ingestion processes denormalized data using range encoding and bit slicing before conversion to base-2 then insertion | [Learn about ingestion](/docs/concepts/concept-ingestion) |
| `SETQ` data types can be used with timestamped data to automatically remove data to continually maintain database size. | Data footprint reduced after set time. | [Learn about SETQ data types](/docs/concepts/concept-setq) |

## Next step


DATA MODELING
