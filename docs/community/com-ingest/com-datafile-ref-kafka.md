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
* [Learn about Avro serialization format](https://avro.apache.org/docs/){:target="_blank"}
* [Learn about the Confluent Schema Registry](https://docs.confluent.io/platform/current/schema-registry/index.html)





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
