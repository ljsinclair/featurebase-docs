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

## JSON Kafka static schema definition

The schema file is formatted as an array of JSON objects, each of which describes one ingester field.

```json
[
	{
		"name": "<featurebase-field>",
		"path": ["<JSON-config-file>"],
		"type": "<data type>",
		"config": {
			"parameters": "<Optional field data type>"
		}
	}
]
```

## Kafka static JSON parameters

| Parameter | Description | Required | Additional |
|---|---|---|---|
| `name` | Destination field in FeatureBase. | Yes |  |
| `path` | The path option is a String array of JSON object keys which are applied in order to locate the value of the `name` field. | Yes | [path-parameters](#path-parameters) |
| `type` | the field data type | Yes |  |
| `config` | optional constraints and parameters for the data type | No |  |
| `parameters` | optional constraints and parameters for the data type | No |  |

## Additional information

* The Schema is specified with a JSON document to ensure compatibility with complex JSON message formats
* The `name`, `path`, and `type` parameters are repeated for each record to import to FeatureBase.

### `path` parameter

* Array indexing is not supported
* Errors are returned if a value is missing from the `path`
* Missing values can be ignored by adding the `--allow-missing-fields` flag when using `molecula-consumer-kafka-static`

[Learn more about kafka-static ingest flags](/docs/community/com-ingest/com-ingest-flags-kafka-)

### `type` data types

{% include /sql-guide/datatype-mapping.md %}

{% include /com-ingest/com-ingest-extra-map-avro-idk.md %}

### Default `config` parameters

### Custom `config` parameters

| `"config":` data type | Description | Required | Additional |
|---|---|---|
| `"CacheConfig"` | Specify the size and type of a [`TopN`](/docs/pql-guide/pql-read-topn) cache for a `set` or `mutex` field. | `TopN` cache | Does not affect time fields |
| `"CustomUnit"` | Specify an integer time unit using standard units


A 'duration' value which specifies a custom time unit; accepts values like "6h" for 6 hours, "1m30s" for 1 minute and 30 seconds; valid units can be described using "ns", "us", "ms", "s", "m", or "h"


* `"Mutex"`: if set to `true`, the data will be ingested into a mutex field instead of a set field
* `"Quantum"`: the time quantum selection (Any Combination of  time granularity `Y`,`M`,`D`,`H` that doesn't skip a grain e.g. `"YM"`/`"MDH"` but not `YD`) to use when ingesting into a time column using the time value from a `"recordTime"`
* `"TTL"`: Time To Live duration for views specifies when views will deleted. Allowed time units are `h`, `m`, `s`, `ms`, `us`, `ns`. Time quantum is required in order to use TTL.
* `"Layout"`: the format in which to parse time strings (defaults to RFC3339) - specified in [Go's format](https://golang.org/pkg/time/#pkg-constants)
* `"Min"`: the minimum possible value for an acceptable integer (defaults to -2^63)
* `"Max"`: the maximum possible value for an acceptable integer (defaults to 2^63 - 1)
* `"ForeignIndex"`: the target index to reference columns of
* `"Scale"`: the number of digits of precision to store after the decimal point
* `"Epoch"`: Only set `Epoch` if the incoming data is a number (rather than a timestamp string). The incoming number will be interpreted as the number of `Unit` since `Epoch`. The value may specify a timezone, for example `"1980-11-30T14:20:28.000+07:00"`, or use zulu time (i.e. +00:00) `"1980-11-30T14:20:28.000Z"`. Defaults to the Unix epoch if not configured.  E.G. If the `Unit` is 's' and the `Epoch` is January 1, 2000 and the number is 86,400 then the number represents January 2, 2000.
* `"Unit"`: For a (`dateInt`) type field, `Unit` is the time unit in which to store a timestamp.  For the (`recordTime`, `timestamp`) type fields, only set `Unit` if the incoming data is a number (rather than a timestamp string). The incoming number will be interpreted as the number of `Unit` since `Epoch`. `Unit` Can be `"d"`, `"h"`, `"m"`, `"s"`, `"ms"`, `"us"`, `"ns"`, for day, hour, minute, second, millisecond, microsecond, nanosecond respectively or `"c"` for custom (using `"CustomUnit"` for `dateInt`). Defaults to `"s"`.  E.G. If the `Unit` is 's' and the `Epoch` is January 1, 2000 and the number is 86,400 then the number represents January 2, 2000.
* `"Granularity"`: the resolution at which the incoming values will be stored. Allowed values are `s`, `ms`, `us`, `ns`. Defaults to `"s"`.


This "cache" is used for the `TopN` approximation.
The default setting is:
```json
{
	"CacheType": "ranked",
	"CacheSize": 50000,
}
```

When using the `"ranked"` cache type, increasing the "cache" size will increase the number of top rows tracked within a shard of data (theoretically improving precision).
Assuming that the cache is full (the field has more than `"CacheSize"` rows within each shard), the `TopN` cache's memory usage is jointly proportional to the cache size and number of shards.

This cache can also be disabled by setting the type to `"none"`.
Disabling the `TopN` cache will prevent `TopN` from working.
When operating on a field without a cache, a slower [`TopK`](/docs/pql-guide/pql-read-topk) or sorted [`GroupBy`](/docs/pql-guide/pql-read-groupby) query may be used instead.



## Examples

### `path` example

Select `1` within `{"a":{"b":{"c":1}}}`

```
"path": ["a","b","c"]
```

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
