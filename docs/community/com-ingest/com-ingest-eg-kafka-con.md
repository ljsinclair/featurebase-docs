---
title: Kafka confluent ingest examples
layout: default
parent: Import data
grand_parent: Community
nav_order: 9
---

# Kafka confluent examples
{: .no_toc}

This page provides examples of Kafka Confluent ingest files and flags you can use to test the system

{% include page-toc.md %}

## Before you begin

* [Learn how to manage data import](/docs/community/com-ingest/com-ingest-manage)
* [Learn about Kafka Confluent schema source files](/docs/community/com-ingest/com-ingest-source-kafka-confluent)
* [Apache Kafka ingester reference](/docs/community/com-ingest/com-ingest-ref-kafka)

## Example 1 -

### Kafka JSON file

{% include /com-ingest/com-ingest-eg-kafka-con-json-2-val.md %}

### Kafka confluent ingest CLI flags

{% include /community/com-config-cli-run.md %}

{% include /com-ingest/com-ingest-eg-kafka-con-flags-2-val.md %}

## Example 2 - Ingest an array of values from a Kafka message

### Kafka message file with array of values

{% include /com-ingest/com-ingest-eg-kafka-con-msg-array.md %}

### Kafka JSON file

{% include /com-ingest/com-ingest-eg-kafka-con-json-array.md %}

### Kafka static ingest CLI flags

{% include /community/com-config-cli-run.md %}

{% include /com-ingest/com-ingest-eg-kafka-con-flags-array.md %}
