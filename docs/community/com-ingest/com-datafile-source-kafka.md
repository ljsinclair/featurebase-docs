---
title: Kafka datafile reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 7
---

# Kafka datafile reference
{: .no_toc}

{% include /com-ingest/com-ingest-kafka-summary.md %}

{: .note}
>Confluent makes it really easy to get schema registry, Apache Kafka, and Apache Zookeeper running in a local environment:
>* [Learn about the Confluent Schema Registry](https://docs.confluent.io/platform/current/schema-registry/index.html) which is an optional schema management system.

{% include page-toc.md %}

## Before you begin

* [Learn how to manage data import](/docs/community/com-ingest/com-ingest-manage)
* [Learn how to setup Confluent and Kafka topics to store your data](https://docs.confluent.io/platform/current/platform-quickstart.html#step-2-create-ak-topics-for-storing-your-data){:target="_blank"}

OR

* [Install Apache Kafka on your system](https://kafka.apache.org/downloads){:target="_blank"}
* [Install Apache Zookeeper on your system](https://zookeeper.apache.org/releases.html){:target="_blank"}
* [Install Apache Avro](https://avro.apache.org/){:target="_blank"}
* [Start Apache Kafka services](https://kafka.apache.org/quickstart){:target="_blank"}
* [Create at least one Kafka topic](https://kafka.apache.org/documentation/#basic_ops_add_topic){:target="_blank"}

{: .important}
The syntax below indicates minimum viable settings and can be modified to meet your requirements.



### Arguments

| Argument | Description | Required | Further information |

## JSON header file syntax

JSON header files are required when using `molecula-consumer-kafka-static` for a Kafka system with static schemas, not managed by Confluent Schema Management.

```
[
    {
        "name": "int-featurebase-name",
        "path": [
            "<int-kafka-path"
        ],
        "type": "<data-type>"
    },
]
```

## Header syntax

The header file is formatted as an array of objects, each describing a single field to be converted to FeatureBase

```json
[
	{
		"name": "the name of the destination field in FeatureBase",
		"path": ["the location within the JSON blob to locate the value of this field"],
		"type": "string",
		"config": {
			"example": "An optional parameter for a field type."
		}
	}
]
```

## Header arguments

| Argument | Description | Required | Further information |
|---|---|---|---|
| `name` | Name of target field in FeatureBase index | Yes |
| `path` | Location of value within JSON blob | Yes |
| `type` | data type | Yes |
| `config` | optional constraints and parameters for the data type |

## Additional information

* Use double quotes `"..."` to enclose fields containing:
  * Line breaks (CRLF)
  * Commas
  * double quotes

## Examples


## Next step

## Further information

* [Learn about Kafka Consumer](https://kafka.apache.org/22/javadoc/org/apache/kafka/clients/consumer/KafkaConsumer.html)
* [Learn about Kafka Consumer configs](https://kafka.apache.org/documentation/#consumerconfigs)
* [Learn about Kafka Consumer API](https://kafka.apache.org/documentation/#consumerapi)
