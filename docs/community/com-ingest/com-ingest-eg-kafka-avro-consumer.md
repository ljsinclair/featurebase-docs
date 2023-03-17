---
title: Kafka consumer ingest examples
layout: default
parent: Import data
grand_parent: Community
nav_order: 9
---

# Kafka consumer examples
{: .no_toc}

This page provides examples of Kafka consumer ingest files and flags you can use to test the system

{% include page-toc.md %}

## Before you begin

* [Learn how to manage data import](/docs/community/com-ingest/com-ingest-manage)
* [Learn about Kafka consumer schema source files](/docs/community/com-ingest/com-ingest-source-kafka-avro-consumer)
* [Kafka confluent ingester reference](/docs/community/com-ingest/com-ingest-flags-kafka-consumer)

## Examples

### Simple Kafka Avro ingest

{% include /com-ingest/com-ingest-eg-kafka-avro-summary.md %}

{% include /com-ingest/com-ingest-eg-kafka-avro-schema.md%}

{% include /com-ingest/com-ingest-eg-kafka-avro-msg.md%}

{% include /community/com-config-cli-run.md %}

{% include /com-ingest/com-ingest-eg-kafka-avro-ingest.md%}

### Kafka Avro ingest featuring Quantum values

{% include /com-ingest/com-ingest-eg-kafka-avro-quant-summary.md %}

{% include /com-ingest/com-ingest-eg-kafka-avro-quant-schema.md%}

{% include /com-ingest/com-ingest-eg-kafka-avro-quant-msg.md%}

{% include /community/com-config-cli-run.md %}

{% include /com-ingest/com-ingest-eg-kafka-avro-quant-ingest.md%}
