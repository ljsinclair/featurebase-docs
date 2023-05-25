---
title: Concepts
layout: default
has_children: true
nav_order: 2
has_toc: true
---
FIRST DRAFT

# FeatureBase concepts

Things to do:

* split out the examples to standalone example pages which demonstrate how it works.

{: .note}
While FeatureBase is a Bitmap index, we refer to Tables and columns rather than indexes for ease of understanding.

## Relationships between data

Cardinality describes the numerical relationship between different tables and their rows which may be described as:

| Cardinality | Example |
|---|---|
| one to one | Relationship between student ID and student name |
| one to many | Relationship between student name and the subjects they are taking |
| many to many | Relationship between the educational institution, lecturers, students and resources |

## Cardinality and database design

**Normalizing** is the act of identifying the cardinality of your data in order to design the relationships between different tables.

For example, a data warehouse run by a state meteorology department may setup a database with the following attributes:

| Table | Description | Example |
|---|---|---|
| Dimension | Descriptive information that remains relatively constant is saved to one or more tables with rows linked to a Fact table by foreign keys | * Table1: Name and location of weather stations around a city<br/>* Table2: Equipment inventory within each weather station |
| Fact | Regularly updated values are saved to a central table with foreign keys linking to Dimension table rows | Time-stamped readings at each station from temperature, wind, UV and humidity equipment |

## Pros and cons of data normalization

| Pro | Con |
|---|---|
| Normalized databases make maintaining data integrity easier | Data in separate tables makes indexing less efficient |
| Less duplication of data means faster inserts, updates and a smaller footprint | `JOIN` clauses are required to query data which makes queries more complex and therefore slower to return results |

DBAs engage in database tuning to overcome these issues, and may in certain cases denormalize the data to improve query response.

## How does FeatureBase overcome these issues?

To avoid the problems inherent with normalized databases, FeatureBase denormalises all data, saving to a flat structure which:
* removes the need for `JOIN` clauses
* makes data indexing more efficient

FeatureBase solves the issues with denormalized data as follows:

| Solution | Benefit | Additional information |
|---|---|---|
| Ingestion converts source data in batches to base-2, range-encoded and bit sliced indexes before saving to a destination table | Data footprint can be reduced by up to 10% | [Learn about ingestion](/docs/concepts/concept-ingestion) |
| data duplication | `SET` data type address one-to-many cardinality in a single row | [Learn about `SET` data types](/docs/concepts/concept-datatype-set) |
| Data integrity | * All ingested data is uniquely identified with a string or integer | [Learn how the `_id` column is used](/docs/concepts/concept-table-id) |
| Upsert rules for insert and update | Data integrity can be maintained because specific rules govern insertion and update actions | [Learn how Upsert works](/docs/concepts/concept-upsert)
| `SETQ` data types can be used with timestamped data to automatically remove data. | Data footprint reduced after set time. | [Learn about SETQ data types](/docs/concepts/concept-setq) |

<!--experiment with the order to get the best results and duplicate in the child overview pages-->
