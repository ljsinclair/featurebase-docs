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

## Kafka confluent JSON syntax

{% include /com-ingest/com-ingest-kafka-confluent-syntax.md %}

## Kafka confluent JSON parameters

{% include /com-ingest/com-ingest-kafka-confluent-params.md %}

## Additional information

### Data types

{% include /sql-guide/datatype-mapping.md %}

## Examples


## Next step

{% include /com-ingest/com-ingest-kafka-next.md %}

## Further information

* [Learn about Kafka Consumer](https://kafka.apache.org/22/javadoc/org/apache/kafka/clients/consumer/KafkaConsumer.html)
* [Learn about Kafka Consumer configs](https://kafka.apache.org/documentation/#consumerconfigs)
* [Learn about Kafka Consumer API](https://kafka.apache.org/documentation/#consumerapi)
