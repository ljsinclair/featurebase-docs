---
title: Ingest Kafka static schema
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

* The `name`, `path`, and `type` parameters are repeated for each record to import to FeatureBase.
* Run the `molecula-consumer-kafka-static` from the `/featurebase/idk` directory.

{% include /com-ingest/com-ingest-map-avro-idk.md}

## Examples

### Simple ingest setup

The Kafka message file contains data referenced in the `kafka-static-header-1.json` file.

```json
{
    "int-kafka-path": 12345,
    "string-kafka-path": "arbitraryString"
}
```

The JSON document defines the structure the data will be passed to FeatureBase.

```json
[
    {
        "name": "int-featurebase-name",
        "path": [
            "int-kafka-path"
        ],
        "type": "int"
    },
    {
        "name": "string-featurebase-name",
        "path": [
            "string-kafka-path"
        ],
        "type": "string"
    }
]
```

The following ingest command and flags will read the structure and data from the JSON document, run a conversion to Roaring Bitmap format then insert the values to the destination table.

```shell
molecula-consumer-kafka-static \
    --kafka-hosts "localhost:9092" \
    --index kafka-test \
    --batch-size 10000 \
    --topics test-topic \
    --max-msgs 10000 \
    --auto-generate \
    --external-generate \
    --header kafka-static-header-1.json
```

### Example 2 -

Kafka message:

```json
{
    "from_interface": {
        "ip": "10.203.33.18",
        "port": 38935
    },
    "to_interface": {
        "ip": "203.77.221.220",
        "port": 5872
    },
    "event_time": "2021-06-01T16:02:55Z06:00",
    "protocol": "UDP",
    "severity": 0,
    "bytes": 8593
}
```

`kafka-static-header-2.json` reads values from the Kafka message as follows:

```json
[
    {
        "name": "from_ip",
        "path": [
            "from_interface",
            "ip"
        ],
        "type": "string"
    },
    {
        "name": "from_port",
        "path": [
            "from_interface",
            "port"
        ],
        "type": "int"
    },
    {
        "name": "to_ip",
        "path": [
            "to_interface",
            "ip"
        ],
        "type": "string"
    },
    {
        "name": "to_port",
        "path": [
            "to_interface",
            "port"
        ],
        "type": "int"
    },
    {
        "name": "event_time",
        "path": [
            "event_time"
        ],
        "type": "timestamp"
    },
    {
        "name": "severity",
        "path": [
            "severity"
        ],
        "type": "set"
    },
    {
        "name": "bytes",
        "path": [
            "bytes"
        ],
        "type": "int"
    },
    {
        "name": "protocol",
        "path": [
            "protocol"
        ],
        "type": "string"
    }
]
```

```shell
molecula-consumer-kafka-static \
    --kafka-hosts "localhost:9092" \
    --index kafka-test \
    --batch-size=10000 \
    --topics test-topic \
    --auto-generate \
    --allow-missing-fields \
    --header kafka-static-header-2.json
```

## Next step

## Next step

Refer to the [Kafka ingest tool reference](/docs/community/com-ingest/com-ingest-flags-kafka) for instructions on importing Kafka data to FeatureBase tables.
