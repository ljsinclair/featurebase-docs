---
title: Kafka ingester reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 8
---

# Kafka ingest tool reference
{: .no_toc}

{% include /community/com-ingest-kafka-summary.md %}

The following ingest methods are available:
* Kafka
* Kafka Consumer
* Kafka Delete

{% include page-toc.md %}

## Before you begin

* [Learn how to manage ingestion](/docs/community/com-ingest/com-ingest-manage)
* [Prepare the Kafka file](/docs/community/com-ingest/com-datafile-ref-kafka)
* [Learn about Kafka Consumer](https://kafka.apache.org/22/javadoc/org/apache/kafka/clients/consumer/KafkaConsumer.html)
* [Learn about Kafka Consumer configs](https://kafka.apache.org/documentation/#consumerconfigs)
* [Learn about Kafka Consumer API](https://kafka.apache.org/documentation/#consumerapi)

## Syntax

```
molecula-consumer-{kafka | kafka-delete | kafka-static} \
  --source-and-target-flags                             \
  --kafka-flags                                         \
  --id-flags                                            \
  --batch-flags                                         \
  --error-flags                                         \
  --log-stat-flags                                      \
  --testing-flags                                       \
  --kafka-auth-flags                                    \
```

## Kafka ingest tool

| Tool | Description |
|---|---|
| `molecula-ingest-kafka` | General purpose ingest tool used for Kafka systems using Confluent Schema Registry |
| `-kafka-delete`| Delete specified data from target FeatureBase index. |
| `-kafka-static` | Used for Kafka systems with static schemas, those not managed by Confluent Schema Registry. In this case, the schema must be explicitly defined. WHERE?!|

{% include community/com-ingest-flag-common.md %}

{% include community/com-ingest-flag-kafka.md %}

{% include community/com-ingest-flag-common-id.md %}

{% include community/com-ingest-flag-common-batch.md %}

{% include community/com-ingest-flag-common-error.md %}

{% include community/com-ingest-flag-common-log-stat.md %}

{% include community/com-ingest-flag-common-testing.md %}

{% include community/com-ingest-flag-kafka-auth.md %}

## Additional information

{: note}
List all the flags by entering `idk/molecula-consumer-kafka` from the `/featurebase` directory.

ADD IN OTHER INCLUDE -extra- files here!

{% include /community/com-ingest-missing-value-processing.md %}

## Confluent Schema Registry

Schema

in scenarios where Kafka is used without Confluent Schema Registry. In this case, the schema must be provided explicitly; the "static" in the consumer name refers to this "static schema". For compatibility with complex JSON message formats, the schema is specified with a JSON document rather than the "header spec" used in other consumers.




The header file is formatted as an array of objects, each of which describes one ingester field:

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


## Examples

{% include /community/com-ingest-csv-header-datafile.md %}

{% include /community/com-ingest-csv-header-flag.md %}

{% include /community/com-ingest-csv-header-flag-tls.md %}

## Further information

* [Example kafka files and ingest tool flags](/docs/community/com-ingest/com-ingest-example-kafka)
