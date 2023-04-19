---
title: Import data
layout: default
parent: Community
has_children: true
nav_order: 6
has_toc: false
---

# How do I import data to FeatureBase Community?
{: .no_toc}

This overview explains the process of importing data to FeatureBase using three methods:
* CSV
* SQL
* Apache Kafka

{% include page-toc.md %}

## Before you begin

{% include /com-install/com-install-before-begin.md %}

## What are ingesters?

Ingesters are used to:
* retrieve data from a specified upstream data source
* transform the data to the FeatureBase bit-columnar format
* write that data to target database tables.

{: .note}
Tables defined by ingest source files are created if they do not already exist.

## Perform data modeling

{% include /concepts/summary-data-modeling.md %}

* [Learn about data modeling](/docs/concepts/overview-data-modeling/)

## CSV import method

Learn how to create source files containing table structure and data, then to import them on the CLI.

* [CSV source format reference](/docs/community/com-ingest/com-ingest-source-csv)
* [CSV flag reference](/docs/community/com-ingest/com-ingest-flags-csv)
* [CSV file and ingest examples](/docs/community/com-ingest/com-ingest-example-csv)

## SQL import method

Learn how to define the SQL source structure and data to be ingested.

* [SQL format reference](/docs/community/com-ingest/com-ingest-source-sql)
* [SQL ingester reference](/docs/community/com-ingest/com-ingest-flags-sql)
* [SQL ingest examples](/docs/community/com-ingest/com-ingest-example-sql)

## Kafka import method

Ingest data from Kafka using three methods:

* [Kafka Avro ingest](/docs/community/com-ingest/com-ingest-source-kafka-avro)
* [Kafka Avro delete ingest](/docs/community/com-ingest/com-ingest-source-kafka-avro-delete)
* [Kafka static schema ingest](/docs/community/com-ingest/com-ingest-source-kafka-static)
