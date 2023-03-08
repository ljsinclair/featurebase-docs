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

The Kafka Ingester reads messages from a Kafka topic and can interact with a Confluent Schema Registry to determine:
* the message schema
* inform specific field types used in FeatureBase tables

<!-- content taken from old-architecture
For the Kafka ingester, those options include the address of the Kafka service as well as any authentication parameters, the topic from which to read, and the address of the schema registry.
-->
<!-- Coming in future PR where I document these
## Next step
* [Query data using SQL]
* [Query data using the Query builder]
-->
