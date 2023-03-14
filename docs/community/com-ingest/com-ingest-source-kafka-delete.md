---
title: Delete Kafka data on ingest
layout: default
parent: Import data
grand_parent: Community
nav_order: 8
---

# Kafka delete ingest reference

Delete records from a FeatureBase Table using a Kafka Confluent source.

## Before you begin

{% include /com-ingest/com-ingest-kafka-confluent-before.md %}

## Kafka confluent JSON syntax

{% include /com-ingest/com-ingest-kafka-confluent-syntax.md %}

## Kafka confluent JSON parameters

{% include /com-ingest/com-ingest-kafka-confluent-params.md %}

## Additional information

* `fields` values repeat as an array for each record to be deleted from the FeatureBase table.

### Data types

{% include /sql-guide/datatype-mapping.md %}

## Examples

### JSON configuration for Kafka delete

{% include /com-ingest/com-ingest-eg-kafka-conf-json-array.md %}

## Next step

{% include /com-ingest/com-ingest-kafka-next.md %}
