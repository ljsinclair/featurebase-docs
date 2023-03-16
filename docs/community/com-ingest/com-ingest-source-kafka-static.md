---
title: Ingest from Kafka static schema
layout: default
parent: Import data
grand_parent: Community
nav_order: 8
---

# How do I ingest data from a Kafka static schema?

Ingesting data from a Kafka static schema involves the use of:

* JSON message blob which defines the source data
* JSON document that defines the source data as an array that matches the destination table structure
* Specifying the JSON document using the `static` CLI flag when running `molecula-consumer-kafka-static`

## Before you begin

* [Install Apache Kafka on your system](https://kafka.apache.org/downloads){:target="_blank"}
* [Install Apache Zookeeper on your system](https://zookeeper.apache.org/releases.html){:target="_blank"}
* [Install Apache Avro on your system](https://avro.apache.org/project/download/){:target="_blank"}
* [Learn about Kafka static schema settings](https://kafka.apache.org/20/javadoc/org/apache/kafka/connect/data/Schema.html){:target="_blank"}
* Define your data in a Kafka message/blob

## Kafka static JSON document definition

```json
[
	{
		"name": "the name of the destination field in FeatureBase",
		"path": ["the location within the JSON blob to locate the value of this field"],
		"type": "applicable data type",
		"config": {
			"parameters": "An optional parameter for a field type."
		}
	}
]
```

## Kafka static JSON parameters

| Parameter | Description | Required | Further information |
|---|---|---|---|
| `name` | Destination field in FeatureBase. |  |  |
| `path` | Location within the JSON blob to locate the value of the field. |  |  |
| `type` | the field data type |  |  |
| `config` | optional constraints and parameters for the data type | No |  |
| `parameters` | optional constraints and parameters for the data type | No |  |

## Additional information

* The Schema is specified with a JSON document to ensure compatibility with complex JSON message formats
* The `name`, `path`, and `type` parameters are repeated for each record to import to FeatureBase.
* Run the `molecula-consumer-kafka-static` from the `/featurebase/idk` directory.

### Data types

{% include /sql-guide/datatype-mapping.md %}

{% include /com-ingest/com-ingest-map-avro-idk.md %}

## Examples

### Ingest two values from a Kafka message

{% include /com-ingest/com-ingest-eg-kafka-static-msg-2-val.md %}

{% include /com-ingest/com-ingest-eg-kafka-static-json-2-val.md %}

{% include /community/com-config-cli-run.md %}

{% include /com-ingest/com-ingest-eg-kafka-static-flags-2-val.md %}

### Ingest data from an array of values

{% include /com-ingest/com-ingest-eg-kafka-static-msg-array.md %}

{% include /com-ingest/com-ingest-eg-kafka-static-json-array.md %}

{% include /community/com-config-cli-run.md %}

{% include /com-ingest/com-ingest-eg-kafka-static-flags-array.md %}

## Next step

* [Kafka static ingest consumer flags reference](/docs/community/com-ingest/com-ingest-flags-kafka-static)
