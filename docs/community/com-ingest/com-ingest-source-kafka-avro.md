---
title: Kafka consumer ingest
layout: default
parent: Import data
grand_parent: Community
nav_order: 7
---

# How do I add data to FeatureBase tables using Kafka?
{: .no_toc}

{% include /com-ingest/com-ingest-kafka-avro-intro.md %}

The Kafka Confluent ingest process:
* streams and reads encoded records from a Kafka topic
* uses Confluent Schema Management to determine the message schema, destination FeatureBase field data types
* ingests the data into FeatureBase tables.

{% include page-toc.md %}

## Before you begin

{% include /com-ingest/com-ingest-kafka-avro-before.md %}

## Avro schema for Kafka messages

```
{
    "namespace": "<namespace>",
    "type": "record",
    "name": "<name-of-schema>",
    "fields": [
        <Kafka-Avro-data-types>,
    ]
}
```

## Kafka JSON parameters

| Parameter | Description | Required | Additional information |
|---|---|---|---|
| `namespace` |  |  |  |
| `"type": "record"` | The schema defines records. |  |  |
| `name` |  |  |  |
| `fields` |  |  |  |

## Additional information

### Mapping Avro and FeatureBase data types

The `molecula-consumer-kafka` and `molecula-consumer-kafka-delete` CLI commands:
* Read the Avro schema from the Confluent Schema Registry
* Infers the FeatureBase data type for each field

#### avro.Array

| Avro data type | Properties | FeatureBase Data type |
|---|---|---|
| avro.Array : avro.String |  | STRINGSET |
| avro.Array : avro.Bytes  |  | STRINGSET |
| avro.Array : avro.Fixed  |  | STRINGSET |
| avro.Array : avro.Enum   |  | STRINGSET |
| avro.Array : avro.String | quantum=(YMD) | STRINGSETQ |
| avro.Array : avro.Bytes  | quantum=(YMD) | STRINGSETQ |
| avro.Array : avro.Fixed  | quantum=(YMD) | STRINGSETQ |
| avro.Array : avro.Enum   | quantum=(YMD) | STRINGSETQ |
| avro.Array : avro.Long   |  | IDSET |
| avro.Array : avro.Long   | quantum=(YMD)  | IDSETQ |

#### avro.Bytes

| Avro data type | Properties | FeatureBase Data type |
|---|---|---|
| avro.Bytes | logicalType=decimal, scale | `DECIMAL` |
| avro.Bytes | fieldType=decimal, scale | `DECIMAL` |
| avro.Bytes | fieldType=recordTime | `STRINGSETQ` and `IDSETQ` |
| avro.Bytes |  | `STRINGSET`   |
| avro.Bytes | mutex=true | `STRING` |
| avro.Bytes | quantum=(YMD) | `STRINGSETQ` |

#### avro.boolean

| Avro data type | Properties | FeatureBase Data type |
|---|---|---|
| avro.Boolean |  | `BOOL` |

#### avro.Double, avro.Float

| Avro data type | Properties | FeatureBase Data type |
|---|---|---|
| avro.Double, avro.Float | scale | `DECIMAL` |

#### avro.Enum

| Avro data type | Properties | FeatureBase Data type |
|---|---|---|
| avro.Enum |  | `STRING` |

#### avro.Int, avro.Long

| Avro data type | Properties | FeatureBase Data type |
|---|---|---|
| avro.Int, avro.Long | fieldType=id   | IDSET  |
| avro.Int, avro.Long | fieldType=id, mutex=false | ID  |
| avro.Int, avro.Long | fieldType=id, quantum=(YMD)    | IDSETQ |
| avro.Int, avro.Long | fieldType=int, min, max| INT |

#### avro.String

| Avro data type | Properties | FeatureBase Data type |
|---|---|---|
| avro.String || STRINGSET   |
| avro.String | mutex=true| STRING |
| avro.String | quantum=(YMD)  | STRINGSETQ  |

#### avro.Union

| Avro data type | Properties | FeatureBase Data type |
|---|---|---|
| avro.Union  || Supports one or two members (if two, one must be avro.NULL) |

#### Not supported in FeatureBase

| Avro data type | Properties | FeatureBase Data type |
|---|---|---|
| avro.Map |  | NOT SUPPORTED  |
| avro.Null |  | NOT SUPPORTED |
| avro.Record |  | NOT SUPPORTED  |
| avro.Recursive |  | NOT SUPPORTED  |

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
