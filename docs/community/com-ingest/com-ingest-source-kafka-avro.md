---
title: Kafka consumer ingest
layout: default
parent: Import data
grand_parent: Community
nav_order: 7
---

# How do I add data to FeatureBase tables using Kafka?
{: .no_toc}

These instructions apply to Kafka schemas managed by Confluent Schema Management.

{: .note}
>FeatureBase recommends using Confluent Schema Management because it makes it easier to setup Kafka dependencies in a local environment:
* Schema registry
* Apache Kafka
* Apache Zookeeper

The Kafka Confluent ingest process:
* reads Avro-encoded messages from a Kafka topic
* uses Confluent Schema Management to determine the message schema, destination FeatureBase field data types
* ingests the data into FeatureBase tables.

## Before you begin

{% include /com-ingest/com-ingest-kafka-avro-before.md %}

## Kafka JSON syntax

{% include /com-ingest/com-ingest-kafka-avro-syntax.md %}

## Kafka JSON parameters

{% include /com-ingest/com-ingest-kafka-avro-params.md %}

## Additional information

{% include /com-ingest/com-ingest-extra-kafka-avro-mapping.md %}

{% include /com-ingest/com-ingest-extra-kafka-avro-fields.md %}

{% include /com-ingest/com-ingest-extra-kafka-avro-field-syntax.md %}

## Examples

* [Example Kafka Avro ingest source](/docs/community/com-ingest/com-ingest-example-kafka-avro)

<!-- commented out to demo how a single example file can reduce number of includes
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

-->

## Next step

* [Kafka Avro ingest consumer flags reference](/docs/community/com-ingest/com-ingest-flags-kafka-avro)

## Further information

* [Learn about Kafka Consumer](https://kafka.apache.org/22/javadoc/org/apache/kafka/clients/consumer/KafkaConsumer.html)
* [Learn about Kafka Consumer configs](https://kafka.apache.org/documentation/#consumerconfigs)
* [Learn about Kafka Consumer API](https://kafka.apache.org/documentation/#consumerapi)
* [FeatureBase data types](/docs/sql-guide/data-types/data-types-home)
