---
title: Data Modeling - Method
layout: default
parent: Concepts
nav_order: 4
---

# Data Modeling - Part 4 - Method

The method you choose to import data to FeatureBase will differ based on your use case and the way your data is supplied.

Each of the following import methods has pros and cons.

| Data source | [REST API](https://api-docs-featurebase-cloud.redoc.ly/){:target="_blank"} | [SQL `Bulk Insert`](/docs/sql-guide/statements/statement-bulk-insert) | [Community CLI ingest](/docs/community/com-ingest/com-ingest-manage) |
|---|---|---|---|
| CSV |  | Yes | Yes |
| JSON | SQL in application/JSON | Yes (ndJSON) |  |
| Kafka avro |  |  | Yes |
| Kafka static |  |  | Yes |
| Parquet |  | Yes |  |
| SQL | Yes (text/plain payload or curl) | Yes | Yes |

## What happens during import?

Import involves a 4-step process:

| Step | Description | Additional information |
|---|---|---|
| Accumulate | Take a copy of data from the source in batches | [Data modeling analysis](/docs/concepts/concept-dm1-analysis) |
| Translate | Obtain and map supplied row key to data  | [Mapping the `_id` column](/docs/concepts/concept-dm2-mapping#mapping-the-id-column) |
| Conversion | Batched data is converted using Range encoding and Bit slicing then into Roaring Bitmap Format | * [Range encoding](https://en.wikipedia.org/wiki/Range_coding){:target="_blank"}<br/>* [Bit slicing](https://en.wikipedia.org/wiki/Bit_slicing){:target="_blank"}<br/>* [Roaring Bitmap](https://www.roaringbitmap.org/){:target="_blank"} |
| Flushing | A transaction ID is obtained to lock tables then data is copied to the destination | [Creating destination tables](/docs/concepts/concept-dm3-destination) |

## Next step

* [Part 5 - Testing](/docs/concepts/concept-dm5-testing)
