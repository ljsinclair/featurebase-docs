---
title: Examples
layout: default
parent: Concepts
has_children: true
nav_order: 3
---

# Example data and import methods

The following examples demonstrate how data can be imported to FeatureBase.

## Before you begin

* [Learn how data is encoded in bitmap indexes](/docs/concepts/concept-bitmaps)
* [Learn how to structure your data ready to import to FeatureBase](/docs/concepts/overview-data-modeling)

## SQL BULK INSERT

These examples demonstrate the use of SQL `BULK INSERT`, available for FeatureBase Cloud and FeatureBase Community.

* [Importing low-cardinality data](/docs/concepts/concept-ingest-eg-key-cardinality-low)
* [Importing a large dataset](/docs/concepts/concept-ingest-eg-large-dataset)
* [Importing a large dataset using a CSV file](/docs/sql-guide/statements/statement-insert-bulk-csv-example)
* [Importing a large dataset using a ndjson file](/docs/sql-guide/statements/statement-insert-bulk-ndjson-example)
* [Importing a large dataset using a parquet file](/docs/sql-guide/statements/statement-insert-bulk-parquet-example)

## CLI ingest examples

These examples use CLI ingest tools available for FeatureBase Community.

* [CSV ingest example](/docs/community/com-ingest/com-ingest-example-csv)
* [SQL ingest example](/docs/community/com-ingest/com-ingest-example-sql)
* [Kafka avro ingest example](/docs/community/com-ingest/com-ingest-example-kafka-avro)
* [Kafka avro delete example](/docs/community/com-ingest/com-ingest-eg-kafka-avro-delete)
* [Kafka static example](/docs/community/com-ingest/com-ingest-eg-kafka-static)
