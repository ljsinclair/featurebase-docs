---
title: Kafka ingest reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 8
---

# Kafka ingest reference
{: .no_toc}

{% include /com-ingest/com-ingest-kafka-summary.md %}

{: .note}
>Confluent makes it really easy to get schema registry, Apache Kafka, and Apache Zookeeper running in a local environment:
>* [Learn about the Confluent Schema Registry](https://docs.confluent.io/platform/current/schema-registry/index.html) which is an optional schema management system.

{% include page-toc.md %}

## Before you begin

Choose your Apache Kafka configuration

| Confluent Schema Management | Manual schema management |
|---|---|
| [Learn how to setup Confluent and Kafka topics to store your data](https://docs.confluent.io/platform/current/platform-quickstart.html#step-2-create-ak-topics-for-storing-your-data){:target="_blank"} | * [Install Apache Kafka on your system](https://kafka.apache.org/downloads){:target="_blank"} |
|  | * [Install Apache Zookeeper on your system](https://zookeeper.apache.org/releases.html){:target="_blank"} |
|  | * [Install Apache Avro on your system](https://avro.apache.org/project/download/) |

Perform additional prerequisites:

* [Start Apache Kafka services](https://kafka.apache.org/quickstart){:target="_blank"}
* [Create at least one Kafka topic](https://kafka.apache.org/documentation/#basic_ops_add_topic){:target="_blank"}
* Use Apache Avro to encode records in one or more Kafka topics

## Kafka CLI Syntax

```
molecula-consumer-{kafka | kafka-delete | kafka-static} \
  <source-and-target-flags>  \
  <kafka-flags>              \
  <id-flags>                 \
  <batch-flags>              \
  <error-flags>              \
  <log-stat-flags>           \
  <testing-flags>            \
  <kafka-auth-flags>         \
```

{% include community/com-ingest-flag-source-target.md %}

{% include community/com-ingest-flag-kafka.md %}

{% include community/com-ingest-flag-common-id.md %}

{% include community/com-ingest-flag-common-batch.md %}

{% include community/com-ingest-flag-common-error.md %}

{% include community/com-ingest-flag-common-log-stat.md %}

{% include community/com-ingest-flag-common-testing.md %}

{% include community/com-ingest-flag-kafka-auth.md %}

## Additional information

{% include /com-ingest/com-ingest-help-kafka.md %}

{% include /community/com-ingest-missing-value-processing.md %}

### Quoting values

Use double quotes `"..."` to enclose fields containing:
* Line breaks (CRLF)
* Commas
* double quotes

### Value Path Selection

The path option is an array of JSON object keys which are applied in order.
For example, `["a","b","c"]` would select `1` within `{"a":{"b":{"c":1}}}`.
This path must only consist of strings - array indexing is not supported. If a value is missing, the ingester will return an error. To override this behavior for non-primary key fields, use `allow-missing-fields`.

### Kafka consumer ingest

The `molecula-ingest-kafka` ingest tool:
* streams and reads Avro-encoded records from an Apache Kafka topic over HTTPS
* decodes the records using the Confluent Schema Registry
* copies the data into the target FeatureBase index

### Kafka Static ingest

* [Kafka static ingest](/docs/community/com-ingest-kafka-static)

### Kafka delete ingest

* [Kafka delete ingest](/docs/community/com-ingest-kafka-delete)

## Examples



## Further information

* [Learn about Kafka Consumer](https://kafka.apache.org/22/javadoc/org/apache/kafka/clients/consumer/KafkaConsumer.html)
* [Learn about Kafka Consumer configs](https://kafka.apache.org/documentation/#consumerconfigs)
* [Learn about Kafka Consumer API](https://kafka.apache.org/documentation/#consumerapi)
* [Learn about Kafka ingester command-line flags](/docs/community/com-ingest/com-ingest-flags-kafka)
