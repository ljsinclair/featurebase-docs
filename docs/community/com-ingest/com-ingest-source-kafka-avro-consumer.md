---
title: Kafka consumer ingest
layout: default
parent: Import data
grand_parent: Community
nav_order: 7
---

# How do I add or delete data from FeatureBase tables using Kafka?
{: .no_toc}

These instructions apply to Kafka schemas managed by Confluent Schema Management.

{: .note}
>FeatureBase recommends using Confluent Schema Management because it makes it easier to setup Kafka dependencies in a local environment:
* Schema registry
* Apache Kafka
* Apache Zookeeper

The Kafka Confluent ingest process:
* reads Avro-encoded records from a Kafka topic
* uses Confluent Schema Management to determine the message schema and FeatureBase field data types
* adds or deletes the records from the specified FeatureBase table

## Before you begin

{% include /com-ingest/com-ingest-kafka-confluent-before.md %}

## Kafka JSON syntax

{% include /com-ingest/com-ingest-kafka-confluent-syntax.md %}

## Kafka JSON parameters

{% include /com-ingest/com-ingest-kafka-confluent-params.md %}

## Additional information

### Data types

{% include /sql-guide/datatype-mapping.md %}

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

## Next step

* [Kafka ingest consumer flags reference](/docs/community/com-ingest/com-ingest-flags-kafka)

## Further information

* [Learn about Kafka Consumer](https://kafka.apache.org/22/javadoc/org/apache/kafka/clients/consumer/KafkaConsumer.html)
* [Learn about Kafka Consumer configs](https://kafka.apache.org/documentation/#consumerconfigs)
* [Learn about Kafka Consumer API](https://kafka.apache.org/documentation/#consumerapi)
