---
title: Kafka Static Ingest Reference
layout: default
parent: Import data
grand_parent: Community
---

## Kafka Static Ingester

The Kafka Static ingester reads JSON messages from Kafka and writes the data to FeatureBase. It uses a static schema file which is also written in JSON.

## Usage

The `--header` flag is used to point at this schema file. The schema file is formatted as an array of JSON objects, each of which describes one ingester field:

```json
[
	{
		"name": "the name of the destination field in FeatureBase",
		"path": ["the location within the JSON blob to locate the value of this field"],
		"type": "the type in FeatureBase",
		"config": {
			"example": "An optional parameter for the field type in FeatureBase."
		}
	}
]
```

| Flag | Value | Description |
| ---  | ---   | --          |
|      --allow-decimal-out-of-range|             |Allow ingest to continue when it encounters out of range decimals in DecimalFields. (default false)|
|      --allow-int-out-of-range|                 |Allow ingest to continue when it encounters out of range integers in IntFields. (default false)|
|      --allow-missing-fields|                   |Will proceed with ingest even if a field is missing from a record but specified in the JSON config file. Default false|
|      --allow-timestamp-out-of-range|           |Allow ingest to continue when it encounters out of range timestamps in TimestampFields. (default false)|
|      --assume-empty-featurebase|               |Setting this means that you're doing an initial bulk ingest which assumes that data does not need to be cleared/unset in FeatureBase. There are various performance enhancements that can be made in this case. For example, for booleans if a false value comes in, we'll just set the bit in the bools-exists field... we won't clear it in the bools field.|
|  -u, --assume-empty-pilosa|                    |Alias for --assume-empty-featurebase. Will be deprecated in the next major release.|
|      --auth-token |string                      |Authentication Token for FeatureBase|
|  -a, --auto-generate|                          |Automatically generate IDs.|
|      --batch-max-staleness| duration           |Maximum length of time that the oldest record in a batch can exist before flushing the batch. Note that this can potentially stack with timeouts waiting for the source.|
|  -b, --batch-size| int                         |Number of records to read before indexing all of them at once. Generally, larger means better throughput and more memory usage. 1,048,576 might be a good number. (default 1)|
|      --cache-length| uint                      |Number of batches of ID mappings to cache. (default 64)|
|      --commit-timeout| duration                |Maximum time before canceling commit.|
|  -c, --concurrency| int                        |Number of concurrent sources and indexing routines to launch. Concurrency is not supported for ./molecula-consumer-sql. Concurrency for ./molecula-consumer-csv only works when providing multiple files and does not support '--auto-generate' (default 1)|
|      --controller-address| string              |Controller address.|
|      --database-id| string                     |auto-assigned database ID|
|      --delete-index|                           |Delete index specified by --index (if it already exists) before starting ingest - NOTE: this will delete any data already imported into this index, use with caution.|
|      --dry-run   |                             |Dry run - just flag parsing.|
|  -x, --exp-split-batch-mode |                  |Tell featurebase client to build bitmaps locally over many batches and import them at the end. Experimental. Does not support int or mutex fields. Don't use this unless you know what you're doing.|
|      --external-generate    |                  |Use FeatureBase's ID generation (must be set alongside auto-generate).|
|      --featurebase-grpc-hosts| strings         |Comma separated list of host:port pairs for FeatureBase's GRPC endpoint. Used by Kafka delete consumer. (default [])|
|      --featurebase-hosts| strings              |Comma separated list of host:port pairs for FeatureBase. (default [])|
|      --future.rename         |                 |Interact with FeatureBase instead of Pilosa.|
|      --group| string                           |Kafka group. (default "defaultgroup")|
|      --header| string                          |Path to the static schema, in JSON header format. May be a path on the local filesystem, or an S3 URI (requires setting --s3-region or environment variable AWS_REGION).|
|      --id-alloc-key-prefix| string             |A prefix for ID allocator keys when using FeatureBase's ID generation (must be different for each concurrent ingester). (default "ingest")|
|  -d, --id-field| string                        |Field which contains the integer column ID. May not be used in conjunction with primary-key-fields. If both are empty, auto-generated IDs will be used.|
|  -i, --index| string                           |Name of FeatureBase index.|
|      --kafka-hosts| strings                    |Comma separated list of host:port pairs for Kafka. (default [localhost:9092])|
|      --kafka-tls.ca-certificate| string        |Path to CA certificate file, or literal PEM data.|
|      --kafka-tls.certificate| string           |Path to certificate file, or literal PEM data.|
|      --kafka-tls.enable-client-verification|   |Enable verification of client certificates.|
|      --kafka-tls.key| string                   |Path to certificate key file, or literal PEM data.|
|      --kafka-tls.skip-verify|                  |Disables verification of server certificates.|
|      --key-translate-batch-size| int           |Maximum number of keys to translate at a time.|
|  -l, --log-path| string                        |Log file to write to. Empty means stderr.|
|      --lookup-batch-size| int                  |Number of records to batch before writing them to Lookup database.|
|      --lookup-db-dsn| string                   |Connection string for connecting to Lookup database.|
|  -m, --max-msgs| uint                          |Number of messages to consume from Kafka before stopping. Useful for testing when you don't want to run indefinitely.|
|      --offset-mode|                            |Set offset-mode based Autogenerated IDs, for use with a data-source that is offset-based (must be set alongside auto-generate and external-generate). (default true)|
|      --organization-id| string                 |auto-assigned organization ID|
|  -k, --pack-bools| string                      |If non-empty, boolean fields will be packed into two set fields—one with this name, and one with <name>-exists. (default "bools")|
|      --pilosa-grpc-hosts| strings              |Alias for --featurebase-grpc-hosts. Will be deprecated in the next major release. (default [localhost:20101])|
|  -p, --pilosa-hosts| strings                   |Alias for --featurebase-hosts. Will be deprecated in the next major release. (default [localhost:10101])|
|  -o, --pprof |string                           |host:port on which to listen for pprof|
|  -r, --primary-key-fields| strings             |Data field(s) which make up the primary key for a record. These will be concatenated and translated to a FeatureBase ID. If empty, record key translation will not be used. (default [])|
|      --s3-region| string                       |S3 Region, optionally used when header is specified as an S3 URI. Alternatively, use environment variable AWS_REGION.|
|      --skip-bad-rows| int                      |If you fail to process the first n rows without processing one successfully, fail.|
|      --skip-old              |                 |Skip to the most recent Kafka message rather than starting at the beginning.|
|  -s, --stats| string                           |host:port on which to host metrics (default "localhost:9093")|
|      --table-name| string                      |human friendly table name|
|      --timeout| duration                       |Time to wait for more records from Kafka before flushing a batch. 0 to disable. (default 1s)|
|      --tls.ca-certificate| string              |Path to CA certificate file, or literal PEM data.|
|      --tls.certificate| string                 |Path to certificate file, or literal PEM data.|
|      --tls.enable-client-verification|         |Enable verification of client certificates.|
|      --tls.key| string                         |Path to certificate key file, or literal PEM data.|
|      --tls.skip-verify|                        |Disables verification of server certificates.|
|      --topics |strings                         |Kafka topics to read from. (default [defaulttopic])|
|      --track-progress|                         |Periodically print status updates on how many records have been sourced.|
|      --use-shard-transactional-endpoint|       |Use alternate import endpoint that ingests data for all fields in a shard in a single atomic request. No negative performance impact and better consistency. Recommended.|
|  -v, --verbose|                                |Enable verbose logging.|
|      --write-csv| string                       |Write data we're ingesting to a CSV file with the given name.|


### Value Path Selection

The path option is an array of JSON object keys which are applied in order.
For example, `["a","b","c"]` would select `1` within `{"a":{"b":{"c":1}}}`.
This path must only consist of strings - array indexing is not supported. If a value is missing, the ingester will return an error. To override this behavior for non-primary key fields, use `allow-missing-fields`.

### Types

The available values for `type` are:

| "type"               | JSON Input Type                         | FeatureBase Field Type                       | Config Options                                   |
|----------------------|-----------------------------------------|----------------------------------------------|--------------------------------------------------|
| `"id"`               | `10`                                    | set/mutex/time                               | `"Mutex"`, `"Quantum"`, `"TTL"`, `"CacheConfig"` |
| `"ids"`              | `[1, 2, 3]`                             | set/time                                     | `"Quantum"`, `"TTL"`, `"CacheConfig"`            |
| `"string"`           | `"example"`                             | keyed set/mutex/time                         | `"Mutex"`, `"Quantum"`, `"TTL"`, `"CacheConfig"` |
| `"strings"`          | `["a", "b", "c"]`                       | keyed set/time                               | `"Quantum"`, `"TTL"`, `"CacheConfig"` |
| `"bool"`             | `true`/`false`                          | packed bool field (row in keyed set fields)  | None                                             |
| `"int"`              | `10`/`-12`/`"example"`                  | integer (possibly a foreign-index reference) | `"Min"`, `"Max"`, `"ForeignIndex"`               |
| `"decimal"`          | `10.9`/`"10.9"`                         | decimal                                      | `"Scale"`                                        |
| `"signedIntBoolKey"` | `10`/`-12`                              | same as id, except a negative value clears   | None                                             |
| `"recordTime"`       | `"2006-01-02T15:04:05Z07:00"`/`1273823` | applied to id(s)/string(s) (using "Quantum") | `"Layout"`, `"Epoch"` , `"Unit"`                  |
| `"dateInt"`          | `"2006-01-02T15:04:05Z07:00"`/`1273823` | integer timestamp relative to an epoch       | `"Layout"`, `"Epoch"`, `"Unit"`, `"CustomUnit"`  |
| `"timestamp"`        | `"2006-01-02T15:04:05Z07:00"`/`1273823` | integer(BSI) timestamp relative to an epoch  | `"Granularity"`, `"Layout"`, `"Epoch"`, `"Unit"` |

### Field Configuration Options

When all config options are left as default, the `"Config"` field may be omitted. Otherwise, the config options are:
* `"Mutex"`: if set to `true`, the data will be ingested into a mutex field instead of a set field
* `"Quantum"`: the time quantum selection (Any Combination of  time granularity `Y`,`M`,`D`,`H` that doesn't skip a grain e.g. `"YM"`/`"MDH"` but not `YD`) to use when ingesting into a time column using the time value from a `"recordTime"`
* `"CacheConfig"`: the configuration when using a `TopN` cache; does not affect time fields
* `"TTL"`: Time To Live duration for views specifies when views will deleted. Allowed time units are `h`, `m`, `s`, `ms`, `us`, `ns`. Time quantum is required in order to use TTL.
* `"Layout"`: the format in which to parse time strings (defaults to RFC3339) - specified in [Go's format](https://golang.org/pkg/time/#pkg-constants)
* `"Min"`: the minimum possible value for an acceptable integer (defaults to -2^63)
* `"Max"`: the maximum possible value for an acceptable integer (defaults to 2^63 - 1)
* `"ForeignIndex"`: the target index to reference columns of
* `"Scale"`: the number of digits of precision to store after the decimal point
* `"Epoch"`: Only set `Epoch` if the incoming data is a number (rather than a timestamp string). The incoming number will be interpreted as the number of `Unit` since `Epoch`. The value may specify a timezone, for example `"1980-11-30T14:20:28.000+07:00"`, or use zulu time (i.e. +00:00) `"1980-11-30T14:20:28.000Z"`. Defaults to the Unix epoch if not configured.  E.G. If the `Unit` is 's' and the `Epoch` is January 1, 2000 and the number is 86,400 then the number represents January 2, 2000.
* `"Unit"`: For a (`dateInt`) type field, `Unit` is the time unit in which to store a timestamp.  For the (`recordTime`, `timestamp`) type fields, only set `Unit` if the incoming data is a number (rather than a timestamp string). The incoming number will be interpreted as the number of `Unit` since `Epoch`. `Unit` Can be `"d"`, `"h"`, `"m"`, `"s"`, `"ms"`, `"us"`, `"ns"`, for day, hour, minute, second, millisecond, microsecond, nanosecond respectively or `"c"` for custom (using `"CustomUnit"` for `dateInt`). Defaults to `"s"`.  E.G. If the `Unit` is 's' and the `Epoch` is January 1, 2000 and the number is 86,400 then the number represents January 2, 2000.
* `"CustomUnit"`: a 'duration' value which specifies a custom time unit; accepts values like "6h" for 6 hours, "1m30s" for 1 minute and 30 seconds; valid units can be described using "ns", "us", "ms", "s", "m", or "h"
* `"Granularity"`: the resolution at which the incoming values will be stored. Allowed values are `s`, `ms`, `us`, `ns`. Defaults to `"s"`.

The `"CacheConfig"` option specifies the size and type of a [`TopN`](/docs/pql-guide/pql-read-topn) cache for a set or mutex field.
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

### Time Quantum

Setting a time quantums involves creating two fields. A field that contains the data that will be set with a time, and a field that holds the actual time. Note that the time field won't be a field in the target table and can be named anything. It is only is used as the time associated with all time quantums for the ingester. An example of the this might be "stores_visited_id" that holds all store ids someone has visited and at what time they visited that store last:

```json
[
	{
		"name": "stores_visited_id",
		"path": ["Path to stores_visited_id"],
		"type": "id",
		"config": {
			"Mutex": false
		}
	}
]
```

```json
[
	{
		"name": "Any name you want",
		"path": ["location to the timestamp/epoch"],
		"type": "recordTime"
	}
]
```

For `"recordTime"` fields, there are essentially two modes. If `"Epoch"` or `"Unit"` are set, then the incoming data is interpreted as a number. Otherwise it's assumed that the incoming data is interpreted as a date/timestamp and the `"Layout"` is used to parse that value.
