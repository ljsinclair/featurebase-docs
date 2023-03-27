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

## Perform data modeling

{% include /concepts/summary-data-modeling.md %}

* [Learn about data modeling](/docs/concepts/overview-data-modeling/)

## CSV import method

Refer to these reference files for information on how to set up and import data using a CSV file.

* [CSV source format reference](/docs/community/com-ingest/com-ingest-source-csv)
* [CSV flag reference](/docs/community/com-ingest/com-ingest-flags-csv)
* [CSV file and ingest examples](/docs/community/com-ingest/com-ingest-example-csv)

## SQL import method

* [SQL format reference](/docs/community/com-ingest/com-ingest-source-sql)
* [SQL ingester reference](/docs/community/com-ingest/com-ingest-flags-sql)
* [SQL ingest examples](/docs/community/com-ingest/com-ingest-example-sql)

## Kafka import method

* [Kafka Avro ingest](/docs/community/com-ingest/com-ingest-source-kafka-avro)
* [Kafka Avro Delete ingest](/docs/community/com-ingest/com-ingest-kafka-avro-delete)
* [Kafka Static ingest](/docs/community/com-ingest/com-ingest-kafka-static-schema)
