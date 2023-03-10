---
title: Kafka static ingest reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 8
---

# Kafka static ingest reference

The `molecula-consumer-kafka-static` command and arguments are used for Kafka systems:
* with static schemas
* not managed by Confluent Schema Management

## Before you begin

* Refer to the [Kafka ingest flags reference](/docs/community/com-ingest/com-ingest-flags-kafka)

## Kafka ingest without Confluent Schema registry

* Explicitly define the schema using the `static` value in the consumer name field
* Specify the schema with a JSON document rather than the header specification

To ingest data from a Kafka static schema you will need a JSON header file that includes the following flags:

| Flag | Action | Description |
|---|---|---|
| `registry-url` | Remove |  |
| `header` | Insert | Path to a schema definition or "header" file in JSON format |
| `allow-missing-fields` | Insert |  |

## JSON header file for Kafka Static ingestion

The JSON header file is formatted as an array of objects, each of which describes one ingester field:

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

| Argument | Description | Required | Further information |
|---|---|---|---|
| `name` |  |  |  |
| `path` |  |  |  |
| `type` |  |  |  |
| `config` |  |  |  |
| `example` |  |  |  |




{% include /com-ingest/com-ingest-map-avro-idk.md}

## Arguments




### JSON header file

The JSON header file is formatted as an array of objects, each describing a single field to be converted to FeatureBase

JSON header files are required for Kafka systems:
* with static schemas
* not managed by Confluent Schema Management

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


| Argument | Description | Required | Further information |
|---|---|---|---|
| `name` | Name of target field in FeatureBase index | Yes |
| `path` | Location of value within JSON blob | Yes |
| `type` | data type | Yes |
| `config` | optional constraints and parameters for the data type |

## Examples

### Simple ingest setup

The Kafka message file contains data referenced in the `kafka-static-header-1.json` file.

```json
{
    "int-kafka-path": 12345,
    "string-kafka-path": "arbitraryString"
}
```

The `kafka-static-header-1.json` file reads data from the Kafka message file as follows:

| JSON Header value | Data type | Populated from JSON message value |
|---|---|---|
| `int-featurebase-name` | Int | `int-kafka-path` |
| `string-featurebase-name` | String | `string-kafka-path` |

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

The data from the JSON message and `kafka-static-header-1.json` file are ingested by FeatureBase as follows:

Run the `kafka-static` ingest command from `/featurebase/idk`

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

<!-- Need help to work out what the hell the JSON header file is actually reading data from because there **seem** to be duplications and repetition but I honestly can't tell from here and it's driving me NUTS

| JSON header file value | Data type | JSON message value |
|---|---|---|

-->

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
