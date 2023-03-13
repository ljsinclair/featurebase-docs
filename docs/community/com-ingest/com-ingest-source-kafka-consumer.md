---
title: Kafka consumer ingest
layout: default
parent: Import data
grand_parent: Community
nav_order: 7
---

# How do I ingest data from Kafka Consumer with Confluent Schema Management?
{: .no_toc}

Confluent Schema Management makes it easier to setup Kafka dependencies in a local environment:
* Schema registry
* Apache Kafka
* Apache Zookeeper

The `molecula-ingest-kafka` tool:
* reads Avro-encoded records from a Kafka topic
* uses Confluent Schema Management to decode them
* Ingests the records into a specified FeatureBase table

## Before you begin

* [Learn about the Confluent Schema Registry](https://docs.confluent.io/platform/current/schema-registry/index.html)
* [Setup Python in a virtual environment](https://docs.python.org/3/library/venv.html){:target="_blank"}
* [Install the Confluent Kafka Python Client](https://docs.confluent.io/kafka-clients/python/current/overview.html#ak-python){:target="_blank"}
* [Learn how to setup Confluent and Kafka topics to store your data](https://docs.confluent.io/platform/current/platform-quickstart.html#step-2-create-ak-topics-for-storing-your-data){:target="_blank"}
* [Create at least one Kafka topic](https://kafka.apache.org/documentation/#basic_ops_add_topic){:target="_blank"}
* [Learn how to encode Kafka records using Apache Avro](https://www.confluent.io/blog/avro-kafka-data/)

## Kafka consumer header definition syntax

```
syntax goes here
```

## Kafka Consumer header parameters

| Parameter | Description | Required | Further information |
|---|---|---|---|


## Additional information




## Examples

### Example 1: minimal


```json

```

## Next step

{% include /com-ingest/com-ingest-kafka-next.md %}
