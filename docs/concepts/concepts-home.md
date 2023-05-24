---
title: Concepts
layout: default
has_children: true
nav_order: 2
has_toc: true
---
FIRST DRAFT

# FeatureBase concepts

{: .note}
While FeatureBase is a Bitmap index, we refer to Tables and columns rather than indexes for ease of understanding.

In traditional databases, data is saved to different tables to:
* avoid duplication which would slow queries down
* reduce the storage footprint

However, indexes and JOINS become unwieldly and queries slow down once the [DATA DENSITY? Need official term] reaches a certain point.

DBAs engage in database tuning to overcome this problem and may in certain cases need to redesign some or all the database.

FeatureBase overcomes this problem in 2 ways.

| Solution | Description | Benefit | Cost |
|---|---|---|
| Encoding and conversion | Ingestion converts source data in batches to base-2, range-encodes and bit slices before saving to FeatureBase | Data footprint can be reduced by up to 10% |
| Flat files | All ingested data is saved to a single flat file which is structured based on:<br/>* how the data is keyed<br/>* the queries you want to run | Simpler queries with no joins | Higher data footprint |

## How does FeatureBase overcome the duplication problem?

FeatureBase supplies a number of data types which help avoid the very duplication that multiple RDBMS tables overcome.

### An array of values in a single row

The `SET` data type allows you to create an array of values in a table cell [OFFICIAL TERM LATER].

For example:

IRIS table here

Becomes...

IRIS TABLE USING SET DATA TYPE
