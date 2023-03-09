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

{: note}
List all the flags by entering `idk/molecula-consumer-kafka` from the `/featurebase` directory.

{% include /community/com-ingest-missing-value-processing.md %}

### Kafka ingester

The Kafka ingester reads Avro-encoded records from a Kafka topic, uses the Confluent schema registry to decode them, and ingests the data into FeatureBase.

### Kafka delete ingester

The Kafka Delete Ingester is configured the same as the Kafka ingester, with the following differences:

* A specific format is required to specify what should be deleted
* one other field called "fields" which is an array of strings and contains the names of the fields which should have their values deleted for the record at the given key.

### Kafka static ingester

Change the following flags for the Kafka static ingester:

| Flag | Action | Description |
|---|---|---|
| `registry-url` | Remove |  |
| `header` | Insert | Path to a schema definition or "header" file in JSON format |
| `allow-missing-fields` | Insert |  |

### Kafka ingest without Confluent Schema registry

* Specify the schema with a JSON document rather than the header specification
* The schema must be specified explicitly using the `static` value in the consumer name




## Examples

{% include /community/com-ingest-csv-header-datafile.md %}

{% include /community/com-ingest-csv-header-flag.md %}

{% include /community/com-ingest-csv-header-flag-tls.md %}




### Kafka delete ingest JSON file

```json
{
	"namespace": "org.test",
	"type": "record",
	"name": "deletes",
	"doc": "",
	"fields": [
    	{
        	"name": "abc",
        	"doc": "The ABC",
        	"type": "string"
    	},
    	{
        	"name": "db",
        	"doc": "TE DB Number",
        	"type": "string"
    	},
    	{
        	"name": "user_id",
        	"doc": "User ID",
        	"type": "int"
    	},
    	{
        	"name": "fields",
        	"type": {
                	"type": "array",
                	"items": "string"
            	}
    	}
	]
}
```

### Kafka static ingester header

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

## Further information

* [Example kafka files and ingest tool flags](/docs/community/com-ingest/com-ingest-example-kafka)
