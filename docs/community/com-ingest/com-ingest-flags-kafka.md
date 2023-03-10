---
title: Kafka ingester reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 8
---

# Kafka ingest tool reference
{: .no_toc}

{% include /com-ingest/com-ingest-kafka-summary.md %}

The following ingest methods are available:
* Kafka
* Kafka Consumer
* Kafka Delete

{% include page-toc.md %}

## Before you begin

* [Learn how to manage ingestion](/docs/community/com-ingest/com-ingest-manage)
* [Prepare the Kafka file](/docs/community/com-ingest/com-datafile-ref-kafka)

Install the following systems as required:

* [Install Apache Zookeeper on your system](https://zookeeper.apache.org/releases.html)
* [Install Avro on your system](https://avro.apache.org/project/download/)

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

Insert the following keys to the JSON file for Kafka delete:

| Flag | Description |
|---|---|
| `fields` | Values in the fields defined in the array will be deleted at the specified key |
| `featurebase-grpc-hosts` | Required so the `inspect` call can determine the values to be deleted |

### Packed `bool` data type for Kafka delete

JSON syntax string for deleting values from boolean fields:

```
  `bools|is-alive`
```

| Key | Description |
|---|---|
| `bools` | Name of the packed `bools` field that matches `pack-bools` defined in the ingest configuration. Defaults to `bools`. |
| `is-alive` | Name of individual boolean field. |

### Kafka static ingester

The Kafka Static ingester:
* reads JSON-encoded records from a Kafka topic,
* uses a statically defined schema (with the ingester JSON header format) to decode them,
* then ingests the data into FeatureBase.

Change the following flags for the Kafka static ingester:

| Flag | Action | Description |
|---|---|---|
| `registry-url` | Remove |  |
| `header` | Insert | Path to a schema definition or "header" file in JSON format |
| `allow-missing-fields` | Insert |  |

### Kafka ingest without Confluent Schema registry

* Specify the schema with a JSON document rather than the header specification
* The schema must be specified explicitly using the `static` value in the consumer name

{% include /com-ingest/com-ingest-map-avro-idk.md}

### Value Path Selection

The path option is an array of JSON object keys which are applied in order.
For example, `["a","b","c"]` would select `1` within `{"a":{"b":{"c":1}}}`.
This path must only consist of strings - array indexing is not supported. If a value is missing, the ingester will return an error. To override this behavior for non-primary key fields, use `allow-missing-fields`.


## JSON message syntax

JSON message is required to [DO SOMETHING SPECIFIC]

```
{
    "int-kafka-path": 12345,
    "string-kafka-path": "arbitraryString"
}
```


## Examples

### Kafka example 1
<!--rename once established what's going on in it-->

{% include /com-ingest/com-ingest-kafka-consumer-example.md%}

### Kafka example 2

<!--rename once established what's going on in it-->

{% include /com-ingest/com-ingest-kafka-consumer-example2.md%}

### JSON configuration for Kafka delete

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

### JSON header configuration for static ingest

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
