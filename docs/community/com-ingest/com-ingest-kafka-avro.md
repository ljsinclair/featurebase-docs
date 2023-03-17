---
title: Kafka Avro Ingest Reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 4
---

# Kafka Avro Ingest Reference
{: .no_toc}

The Kafka Avro ingester reads Avro-encoded messages from a Kafka topic, uses the Confluent schema registry to decode them, and ingests the data into FeatureBase. The Avro type and field properties determine which FeatureBase data type will be used.

In Avro, every field is mandatory. If you want to make a field optional (i.e. you want to allow missing values), you can union the type with the null type in Avro. This will allow you to pass the value `null` for fields that have missing values. Note that the consumer does nothing with these values (i.e. it does not replace the existing value with `null`).

Use the [Kafka Avro Delete consumer](/docs/community/com-ingest/com-ingest-source-kafka-delete) to delete data.

{% include page-toc.md %}

## Before you begin

In order to run the examples below, you'll need Kafka (and Zookeeper at the time of writing) and Confluent Schema Registry running somewhere the consumer can connect to it over HTTP.

If you have the memory avaliable, the [Confluent quickstart guide](https://docs.confluent.io/5.5.0/quickstart/ce-quickstart.html) is a good way to get a local test environment set up quickly. Otherwise, you can install services seperately.

## Usage

The Kafka Avro consumer is part of the `IDK` package. You can find the binary (`molecula-consumer-kafka`) in the community releases. This consumer is built on top of [Confluent's go client](https://github.com/confluentinc/confluent-kafka-go).

Use `molecula-consumer-kafka -h` to list all available flags. Each flag is also available as an environment variable by prefixing it with "CONSUMER_" and converting any dots or dashes to underscores. For example tls.ca-certificate becomes CONSUMER_TLS_CA_CERTIFICATE.

Note: In order for TLS to be used, the various TLS options need to be set, but each service URL must also include the appropriate protocol (e.g. FeatureBase hosts should look like "https://featurebase0.local:10101").

Below are the current configuration options:

| Flag | Value | Description |
| ---  | ---   | ---     |
|      `--auth-token` |string                     |             Authentication Token for FeatureBase |
|  `-a`, `--auto-generate` |                          |           Automatically generate IDs.|
|      `--batch-max-staleness` | duration            |           Maximum length of time that the oldest record in a batch can exist before flushing the batch. Note that this can potentially stack with timeouts waiting for the source.|
|  `-b`, `--batch-size` | int                          |           Number of records to read before indexing all of them at once. Generally, larger means better throughput and more memory usage. 1,048,576 might be a good number. (default 1) |
|      `--cache-length` | uint                       |         Number of batches of ID mappings to cache. (default 64)|
|      `--commit-timeout` | duration                 |        Maximum time before canceling commit.|
|  `-c`, `--concurrency` | int                         |       Number of concurrent sources and indexing routines to launch. Concurrency is not supported for molecula-consumer-sql. Concurrency for molecula-consumer-csv only works when providing multiple files and does not support '--auto-generate' (default 1)|
|      `--consumer-close-timeout` | int              |      The amount of time in seconds to wait for the consumer to close properly. (default 30)|
|      `--delete-index `      |                     |     Delete index specified by --index (if it already exists) before starting ingest - NOTE: this will delete any data already imported into this index, use with caution.|
|      `--dry-run`           |                      |     Dry run - just flag parsing.|
|      `--external-generate` |                    |    Use FeatureBase's ID generation (must be set alongside auto-generate).|
|      `--featurebase-grpc-hosts` | strings          |   Comma separated list of host:port pairs for FeatureBase's GRPC endpoint. Used by Kafka delete consumer. (default [])|
|      `--featurebase-hosts` | strings               |  Comma separated list of host:port pairs for FeatureBase. (default [])|
|      `--future.rename`         |                  |  Interact with FeatureBase instead of Pilosa.|
|      `--group` | string                           | Kafka group. (default "defaultgroup")|
|      `--id-alloc-key-prefix`| string              | A prefix for ID allocator keys when using FeatureBase's ID generation (must be different for each concurrent ingester). (default "ingest")|
|  `-d`, `--id-field` | string                         | Field which contains the integer column ID. May not be used in conjunction with primary-key-fields. If both are empty, auto-generated IDs will be used.|
|  `-i`, `--index` |string                            | Name of FeatureBase index.|
|      `--kafka-bootstrap-servers`| strings         | Comma separated list of host:port pairs for Kafka. (default [localhost:9092])|
|      `--kafka-client-id` | string                  | (client.id)|
|      `--kafka-configuration` | string              | json configuration for confluents ConfigMap will be applied first EXPERIMENTAL|
|      `--kafka-debug` | string                      | The (debug) kafka consumer configuration. A comma-separated list of debug contexts to enable. Detailed Consumer: consumer,cgrp,topic,fetch. Set to 'all' for most verbose option.|
|      `--kafka-enable-ssl-certificate-verification`  |   |       (enable.ssl.certificate.verification)|
|      `--kafka-group-instance-id` | string             |         The (group.instance.id) kafka consumer configuration.|
|      `--kafka-max-poll-interval`  | string             |         The (max.poll.interval.ms) kafka consumer configuration. The max time the consumer can go without polling the broker. Consumer exits after this timeout.|
|      `--kafka-sasl-mechanism` | string                |         SASL mechanism to use for authentication.(sasl.mechanism)|
|      `--kafka-sasl-password` | string                 |         SASL authentication password (sasl.password)|
|      `--kafka-sasl-username` | string                 |         SASL authentication username (sasl.username)|
|      `--kafka-security-protocol` | string             |         Protocol used to communicate with brokers (security.protocol)|
|      `--kafka-session-timeout` | string               |         The (session.timeout.ms) kafka consumer configuration. The max time the consumer can go without sending a heartbeat to the broker|
|      `--kafka-socket-keepalive-enable` | string       |         The (socket.keepalive.enable) kafka consumer configuration|
|      `--kafka-socket-timeout-ms` | int                |        (socket.timeout.ms)|
|      `--kafka-ssl-ca-location` | string               |        File or directory path to CA certificate(s) for verifying the broker's key(ssl.ca.location)|
|      `--kafka-ssl-certificate-location` | string      |        Path to client's public key (PEM) used for authentication(ssl.certificate.location)|
|      `--kafka-ssl-endpoint-identification-algorithm` | string  | The endpoint identification algorithm used by clients to validate server host name (ssl.endpoint.identification.algorithm) |
|      `--kafka-ssl-key-location` | string                       | Path to client's private key (PEM) used for authentication(ssl.key.location).|
|      `--kafka-ssl-key-password`| string                       | Private key passphrase (for use with ssl.key.location and set_ssl_cert()(ssl.key.password))|
|      `--key-translate-batch-size` | int                        | Maximum number of keys to translate at a time.|
|  `-l`, `--log-path` | string                                     | Log file to write to. Empty means stderr.|
|  `-m`, `--max-msgs` | uint                                       | Number of messages to consume from Kafka before stopping. Useful for testing when you don't want to run indefinitely.|
|      `--offset-mode`  |                                        | Set offset-mode based Autogenerated IDs, for use with a data-source that is offset-based (must be set alongside auto-generate and external-generate). (default true)|
|  `-k`, `--pack-bools` | string                                   | If non-empty, boolean fields will be packed into two set fields—one with this name, and one with <name>-exists. (default "bools")|
|      `--pilosa-grpc-hosts` | strings                           | Alias for --featurebase-grpc-hosts. Will be deprecated in the next major release. (default [localhost:20101])|
|  `-p`, `--pilosa-hosts` | strings                                | Alias for --featurebase-hosts. Will be deprecated in the next major release. (default [localhost:10101])|
|  `-o`, `--pprof` |  string                                        | host:port on which to listen for pprof (default "localhost:6062")|
|  `-r`, `--primary-key-fields` | strings                          | Data field(s) which make up the primary key for a record. These will be concatenated and translated to a FeatureBase ID. If empty, record key translation will not be used. (default [])|
|      `--schema-registry-password` | string                     | authenticaion secret provided by confluent for schema registry.|
|  `-g`, `--schema-registry-url` | string                          | Location of Confluent Schema Registry. Must start with 'https://' if you want to use TLS. (default "http://localhost:8081")|
|     `--schema-registry-username` | string                     | authenticaion key provided by confluent for schema registry.|
|      `--skip-bad-rows` | int                                   | If you fail to process the first n rows without processing one successfully, fail.|
|      `--skip-old`      |                                       | False sets kafka consumer configuration auto.offset.reset to earliest, True sets it to latest.|
|  `-s`, `--stats string`    |                                     | host:port on which to host metrics (default "localhost:9093")|
|      `--table-name`|  string                                   | human friendly table name|
|      `--timeout duration`    |                                | Time to wait for more records from Kafka before flushing a batch. 0 to disable. (default 1s)|
|      `--tls.ca-certificate` | string                           | Path to CA certificate file, or literal PEM data.|
|      `--tls.certificate` |  string                              | Path to certificate file, or literal PEM data.|
|      `--tls.enable-client-verification`    |                   | Enable verification of client certificates.|
|      `--tls.key`|  string                                      | Path to certificate key file, or literal PEM data.|
|      `--tls.skip-verify`  |                                   | Disables verification of server certificates.|
|      `--topics` | strings                                      | Kafka topics to read from. (default [defaulttopic])|
|      `--track-progress` |                                     | Periodically print status updates on how many records have been sourced.|
|      `--use-shard-transactional-endpoint` |                   | Use alternate import endpoint that ingests data for all fields in a shard in a single atomic request. No negative performance impact and better consistency. Recommended.|
|  `-v`, `--verbose`                           |                  | Enable verbose logging.|
|      `--write-csv` | string                                    | Write data we're ingesting to a CSV file with the given name.|

## Mapping Data Types

When the consumer reads the Avro schema from Schema Registry, infers the FeatureBase data type for each filed. Below is how Avro fields map to FeatureBase field types. Visit [FeatureBase data types](/docs/sql-guide/data-types/data-types-home) for more on FeatureBase data types.

| Avro                     | Properties                             | FeatureBase SQL Type                                        |
| ---                      | ---                                    | ---                                                         |
| avro.String              |                                        | STRINGSET                                                   |
| avro.String              | mutex=true                             | STRING                                                      |
| avro.String              | quantum=(YMD)                          | STRINGSETQ                                                  |
| avro.Enum                |                                        | STRING                                                      |
| avro.Bytes               | logicalType=decimal, scale             | DECIMAL                                                     |
| avro.Bytes               | fieldType=decimal, scale               | DECIMAL                                                     |
| avro.Bytes               | fieldType=recordTime                   | Value used by STRINGSETQ and IDSETQ types                   |
| avro.Bytes               |                                        | STRINGSET                                                   |
| avro.Bytes               | mutex=true                             | STRING                                                      |
| avro.Bytes               | quantum=(YMD)                          | STRINGSETQ                                                  |
| avro.Array : avro.String |                                        | STRINGSET                                                   |
| avro.Array : avro.Bytes  |                                        | STRINGSET                                                   |
| avro.Array : avro.Fixed  |                                        | STRINGSET                                                   |
| avro.Array : avro.Enum   |                                        | STRINGSET                                                   |
| avro.Array : avro.String | quantum=(YMD)                          | STRINGSETQ                                                  |
| avro.Array : avro.Bytes  | quantum=(YMD)                          | STRINGSETQ                                                  |
| avro.Array : avro.Fixed  | quantum=(YMD)                          | STRINGSETQ                                                  |
| avro.Array : avro.Enum   | quantum=(YMD)                          | STRINGSETQ                                                  |
| avro.Array : avro.Long   |                                        | IDSET                                                       |
| avro.Array : avro.Long   | quantum=(YMD)                          | IDSETQ                                                      |
| avro.Int, avro.Long      | fieldType=id                           | IDSET                                                       |
| avro.Int, avro.Long      | fieldType=id, mutex=false              | ID                                                          |
| avro.Int, avro.Long      | fieldType=id, quantum=(YMD)            | IDSETQ                                                      |
| avro.Int, avro.Long      | fieldType=int, min, max                | INT                                                         |
| avro.Float, avro.Double  | scale                                  | DECIMAL                                                     |
| avro.Boolean             |                                        | BOOL                                                        |
| avro.Union               |                                        | Supports one or two members (if two, one must be avro.NULL) |
| avro.Null                |                                        | NOT SUPPORTED                                               |
| avro.Map                 |                                        | NOT SUPPORTED                                               |
| avro.Recursive           |                                        | NOT SUPPORTED                                               |
| avro.Record              |                                        | NOT SUPPORTED                                               |

### Mapping Examples

Again, the Avro field type and property key-value pairs determine which type you’ll end up with in FeatureBase. Below are Avro fields that map to a given FeatureBase type. 

#### STRING

FeatureBase String from Avro String
```
{"name": "string_string", "type": "string", "mutex": true }
```

FeatureBase String from Avro Bytes
```
{"name": "string_bytes", "type": "bytes" , "mutex": true }
```

FeatureBase String from Avro Enum
```
{"name": "string_enum", "type": "enum"}
```
---

#### STRINGSET

FeatureBase StringSet from Avro String
```
{"name": "stringset_string", "type": "string"}
```

FeatureBase StringSet from Avro Bytes
```
{"name": "stringset_bytes", "type": "bytes"}
```

FeatureBase StringSet from Avro String Array
```
{"name": "stringset_stringarray", "type": {"type": "array", "items": "string"}}
```
---
#### STRINGSETQ

FeatureBase StringSetQ with Day Granularity from Avro String
```
{"name": "stringsetq_string", "type": "string", "quantum": "YMD"}
```


FeatureBase StringSetQ with Day Granularity from Avro String Array
```
{"name": "stringsetq_stringarray", "type": "array", "items": {"type": "string", "quantum": "YMD"}}
```

Note this must be accompanied with a RecordTime field in the avro schema. For example:

```
{"name": "recordtime_bytes", "type": "bytes", "fieldType": "recordTime", "layout": "2006-01-02 15:04:05", "unit": "s"},
```
---
#### ID

FeatureBase ID from Avro Long
```
{"name": "id_long", "type": "long", "mutex": true, "fieldType": "id"}
```

FeatureBase ID from Avro int
```
{"name": "id_int", "type": "int", "mutex": true, "fieldType": "id"}
```
---
#### IDSET

FeatureBase IDSET from Avro Int
```
{"name": "idset_int", "type": "int", "fieldType": "id"}
```

FeatureBase IDSET from Avro Int Array
```
{"name": "idset_intarray", "type": {"type": "array", "items": "int"}}
```
---
#### IDSETQ

FeatureBase IDSETQ from Avro Int
```
{"name": "idsetq_int", "type": "int", "fieldType": "id", "quantum": "YMD"}
```

FeatureBase IDSETQ from Avro Int Array
```
{"name": "idsetq_intarray", "type": "array", "items": {"type": "int", "quantum": "YMD"}}
```

Note this must be accompanied with a RecordTime field in the avro schema. For example:

```
{"name": "recordtime_bytes", "type": "bytes", "fieldType": "recordTime", "layout": "2006-01-02 15:04:05", "unit": "s"},
```

---
#### INT

FeatureBase Int from Avro Int
```
{"name": "int_int", "type": "int", "fieldType": "int"}
```
---
#### DECIMAL

FeatureBase Decimal from Avro Float
```
{"name": "decimal_float", "type": "float", "fieldType": "decimal", "scale": 2}
```
---
#### BOOL

FeatureBase Bool from Avro Boolean
```
{"name": "bool_bool", "type": "boolean"}
```
---
#### TIMESTAMP

FeatureBase Timestamp from Avro Bytes (expects byte representation of string timestamp)
```
{"name": "timestamp_bytes_ts", "type": "bytes", "fieldType": "timestamp", "layout": "2006-01-02 15:04:05", "epoch": "1970-01-01 00:00:00"}
```

FeatureBase Timestamp from Avro Int
```
{"name": "timestamp_bytes_int", "type": ["bytes", "null"], "fieldType": "timestamp", "unit": "s", "layout": "2006-01-02 15:04:05", "epoch": "1970-01-01 00:00:00"}
```

---
#### Optional Fields

If you'd like a field to be optional, you can "union" it will the `null` type in Avro. For all data types, the behavior is to leave the data in FeatureBase as it was before the record was processed. Here are a couple examples:

Optional String:
```
{"name": "string_string", "type": ["string", "null"], "mutex": true }
```
       
Optional Array of Strings:
```
{"name": "stringset_stringarray", "type": [{"type": "array", "items": "string"}, "null"]}
```


## Examples
To run the examples below, use the schema to encode the raw data before sending it to Kafka. Then, add the schema to schema registry so the consumer can use it to decode the messages in Kafka.
### Simple

In the example below, the `a_stringset` and `a_timestamp` fields use the union between a field and null. This means, as seen in the third message, `{"null": null}` can be passed when there is missing data for a record. The consumer will ignore these fields. All other fields require data for the consumer to ingest.

#### Avro Schema

```
{
    "namespace": "org.example",
    "type": "record",
    "name": "simple_example",
    "fields": [
        {"name": "a_string", "type": "string", "mutex": true},
        {"name": "a_stringset", "type": [{"type": "array", "items": "string"}, "null"]},
        {"name": "an_int", "type": "int", "fieldType": "int"},
        {"name": "a_decimal", "type": "float", "fieldType": "decimal", "scale": 2},
        {"name": "a_timestamp", "type": ["bytes", "null"], "fieldType": "timestamp", "layout": "2006-01-02 15:04:05", "epoch": "1970-01-01 00:00:00"},
    ]
}
```

#### Raw Data
```
{"a_string": "7EYSp", "a_stringset": {"array": ["vbbuf", "VQs7y", "9z4aw", "h1iqc", "aQQxr"]}, "an_int": 344, "a_decimal": 3.23, "a_timestamp": {"bytes": "2023-02-16 07:53:59"}},
{"a_string": "iYeOV", "a_stringset": {"array": ["iYeOV", "v31XN", "uirDR"]}, "an_int": 884, "a_decimal": 4.32, "a_timestamp": {"bytes": "2023-01-31 11:11:30"}},
{"a_string": "X9jWC", "a_stringset": {"null": null}, "an_int": 879, "a_decimal": 2.84, "a_timestamp": {"null": null}}
```

#### Consumer Script

```
molecula-consumer-kafka \
    --index target_index \
    --featurebase-hosts localhost:10101 \
    --kafka-hosts localhost:9092 \
    --schema-registry-url http://localhost:8081 \
    --topics source_topic \
    --external-generate \
    --auto-generate \
```

---
### Quantums

In the example below, `an_idset` will be a `IDSETQ` type in FeatureBase. Each `an_idset` value will be stored with respect to time so a time part can be inlcuded in queries. Note that the `an_int` field is optional because the Union Avro type. When `{"null": null}` is passed in the example below, the record `7EYSp` `an_int` value will stay `39`.

#### Raw Data
```
{"pk": "7EYSp", "an_idset": 10, "an_int": {"int": 39},    "a_quantum": "2023-02-16 07:53:59"},
{"pk": "7EYSp", "an_idset": 11, "an_int": {"null": null}, "a_quantum": "2023-02-22 14:32:23"},
{"pk": "X9jWC", "an_idset": 12  "an_int": {"int": 43},    "a_quantum": "2023-01-31 11:11:30"}
```

#### Avro Schema

```
{
    "namespace": "org.example",
    "type": "record",
    "name": "quantum_example",
    "fields": [
        {"name": "pk", "type": "string"},
        {"name": "an_idset", "type": "int", "quantum": "YMD", "fieldType": "id"},
        {"name": "an_int", "type": ["int", "null"], "fieldType": "int"},
        {"name": "a_quantum", "type": "bytes", "fieldType": "recordTime", "layout": "2006-01-02 15:04:05", "unit": "s"},
    ]
}
```

#### Consumer Script

```
molecula-consumer-kafka \
    --index target_index \
    --featurebase-hosts localhost:10101 \
    --kafka-hosts localhost:9092 \
    --schema-registry-url http://localhost:8081 \
    --topic source_topic \
    --primary-key-fields pk
```

## Next step


- If you are looking to delete data using a similar Avro consumer, go [here](/docs/community/com-ingest/com-ingest-source-kafka-delete).
- If you want to get data from kafka but don't want to use schema registry and avro to encode your data, check out the [Kafka Static](/docs/community/com-ingest/com-ingest-source-kafka-static) consumer.