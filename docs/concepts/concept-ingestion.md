---
title: Ingest data
layout: default
parent: Concepts
nav_order: 1
---

# Converting data

**Ingestion** is the process of converting data to base-2 before inserting into FeatureBase.

## Before you begin

* [Learn how FeatureBase differs to traditional databases](/docs/concepts/concept-home)
* [Learn how to use Data modeling to structure data before ingestion](/docs/concepts/concept-data-modeling)

##


## How is data imported?

Refer to:
concepts-ingest-workflow
size database?
data modeling
Also need to hit the blogs for information

REITERATE DENORMALIZED DATABASES

discuss:
* base 2 conversion --
* range encoding
* bit slicing

## Ingestion methods/sources

Each of the following import methods has pros and cons.

| Data source | [REST API](https://api-docs-featurebase-cloud.redoc.ly/){:target="_blank"} | [SQL `Bulk Insert`](/docs/sql-guide/statements/statement-bulk-insert) | [Community CLI ingest](/docs/community/com-ingest/com-ingest-manage) |
|---|---|---|---|
| CSV |  | Yes | Yes |
| JSON | SQL in application/JSON | Yes (ndJSON) |  |
| Kafka avro |  |  | Yes |
| Kafka static |  |  | Yes |
| Parquet |  | Yes |  |
| SQL | Yes (text/plain payload or curl) | Yes | Yes |



## Ingestion process

| Step | Description | Additional information |
|---|---|---|
| Accumulate | Take a copy of data from the source in batches | [Data modeling analysis](/docs/concepts/concept-dm1-analysis) |
| Translate | Obtain and map supplied row key to data  | [Mapping the `_id` column](/docs/concepts/concept-dm2-mapping#mapping-the-id-column) |
| Conversion | Batched data is converted using Range encoding and Bit slicing then into Roaring Bitmap Format | * [Range encoding](https://en.wikipedia.org/wiki/Range_coding){:target="_blank"}<br/>* [Bit slicing](https://en.wikipedia.org/wiki/Bit_slicing){:target="_blank"}<br/>* [Roaring Bitmap](https://www.roaringbitmap.org/){:target="_blank"} |
| Flushing | A transaction ID is obtained to lock tables then data is copied to the destination | [Creating destination tables](/docs/concepts/concept-dm3-destination) |


References

* bitmap encoding -- https://www.featurebase.com/blog/range-encoded-bitmaps
