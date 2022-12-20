---
title: Kafka datafile reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 7
---

# Kafka datafile reference
{: .no_toc}

{% include /community/com-ingest-kafka-summary.md %}

{% include page-toc.md %}

## Before you begin

* [Learn how to manage data import](/docs/community/com-ingest/com-ingest-manage)

LIST DEPENDENCY> STACKOVERFLOW QUESTION: https://stackoverflowteams.com/c/molecula/questions/232

* [Learn about Apache Kafka](https://kafka.apache.org/)
* [Install Apache Kafka on your system](https://kafka.apache.org/downloads)
* [Learn about Apache Zookeeper](https://zookeeper.apache.org/doc/current/index.html)
* [Install Apache Zookeeper on your system](https://zookeeper.apache.org/releases.html)
* [Learn about Avro serialization format](https://avro.apache.org/docs/){:target="_blank"} required by the kafka-ingest tool
* [Install Avro on your system](https://avro.apache.org/project/download/)
* [Learn about the Confluent Schema Registry](https://docs.confluent.io/platform/current/schema-registry/index.html) which is an optional schema management system.
* [Create at least one Kafka topic](https://kafka.apache.org/documentation/#basic_ops_add_topic)
* [Write data to the Kafka topic]URL here

{: .important}
The syntax below indicates minimum viable settings and can be modified to meet your requirements.

## JSON data file syntax

```

```

## JSON message syntax

JSON message is required to [DO SOMETHING SPECIFIC]

```
{
    "int-kafka-path": 12345,
    "string-kafka-path": "arbitraryString"
}
```

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

| Argument | Description | Required |
|---|---|---|
| name | Name of target field in FeatureBase index | Yes |
| path | Location of value within JSON blob | Yes |
| type | data type | Yes |
| config | optional constraints and parameters for the data type |

## Additional information

* Use double quotes `"..."` to enclose fields containing:
  * Line breaks (CRLF)
  * Commas
  * double quotes

## Examples

{% include /community/com-datafile-csv-header-defined.md %}

{% include /community/com-datafile-csv-header-undefined.md %}

## Next step

* [CSV ingest tool reference](/docs/community/com-ingest/com-ingest-ref-csv)
