---
title: Data modeling
layout: default
parent: Concepts
nav_order: 10
---

## Data modeling with FeatureBase

At a high level, data modeling involves identifying problems being experienced then determining how they can be resolved.


## Before you begin
* [Learn the differences between FeatureBase and traditional databases](/docs/concepts/concept-home)
* [Learn about the unique identifier](/docs/concepts/concept-table-id)

## Step 1 - Problem identification

The problems you are experiencing may include one or all the following:
* database is too large
* queries are complex and take too long
* indexing is slow
* traditional methods to overcome these issues are time consuming or have unwanted consequences

## Step 2 - Identify the data to import

FeatureBase is a denormalized bitmap database which requires data to be supplied in a flat, denormalized structure.

The questions you should ask are:

| Question | Description | Additional information |
|---|---|---|
| What is the unique identifier for each row? | [Learn about the unique identifier](/docs/concepts/concept-unique-id)
| What data types can I map my data to? | [Data type mapping](#what-data-types-can-i-map-to) |
| How do I overcome one-to-many and many-to-many cardinality? | [Learn about `SET` and `SETQ` data types](/docs/concepts/concept-datatype-set) |

## What data types can I map data to?

Need to include:
* list of data types and destination types and how they map
* IDEAL - recontextualise the size-fb-database and data type stuff from overview-data-modeling to give users an idea of space and requirements
* links to child overviews for set/setq
* links to examples of how it works



| Generic data type | FeatureBase data type |
|---|---|
|  | Boolean |
|  | Integer |
|  | Decimal |
|  | String |
|  | Timestamp |

FeatureBase supplies four additional data types to overcome issues with representing low cardinality data:
