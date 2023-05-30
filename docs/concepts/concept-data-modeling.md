---
title: Data modeling overview
layout: default
parent: Concepts
nav_order: 2
---

# An overview of Data modeling with FeatureBase

Data modeling in FeatureBase involves:
* identifying the issues you're experiencing with your data
* determining the data to import
* identifying the unique key for each row of data
* mapping data types, including those that handle high-cardinality data
* creating the destination
* determining the import method
* testing the outcome
* fix issues and import for production use
* Conclusion

## Before you begin

* [Learn about cardinality and normalization](/docs/concepts/concepts-home)
* [Learn how FeatureBase stores data in bitmaps](/docs/concepts/concepts-bitmap-index)

## Identifying issues

Description

## Determining the data to import

Description

## Identifying the unique key

Description

* [Learn how to identify the unique key](/docs/concepts/concept-unique-id)

## Mapping data types

DESCRIPTION
Add high-level description of set/setq

* [Learn how to map data types]

## Determining the import method

DESCRIPTION OF INGEST plus methods plus it's push/stream NOT altering source data

* [Learn how data is ingested to FeatureBase](/docs/concepts/concept-ingestion)

## Testing the outcome

DESCRIPTION
something here about what's described in crime story

Querying also would be done here.

## Fixing problems and importing to production (working title)

post testing, fix the issues, ingest again to a new db/tables

## Go about your day (not really good title -- more a conclusion)

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
