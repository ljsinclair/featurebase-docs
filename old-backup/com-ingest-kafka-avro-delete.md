---
title: Kafka Avro Delete Reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 4
---

# Kafka Avro Delete Consumer Reference
{: .no_toc}

The Kafka Avro delete consumer was built to supply delete functionality that doesn't exist in the Kafka Avro consumer. It takes Avro encoded, specially formatted Kafka messages and runs the appropriate delete operations against the database.

{% include page-toc.md %}

## Before you begin

In order to run the examples below, you'll need Kafka (and Zookeeper at the time of writing) and Confluent Schema Registry running somewhere the consumer can connect to it over HTTP or HTTPS.

If you have the memory avaliable, the [Confluent quickstart guide](https://docs.confluent.io/5.5.0/quickstart/ce-quickstart.html) is a good way to get a local test environment set up quickly. Otherwise, you can install services seperately.

## Usage

The Kafka Avro Delete consumer is part of the `IDK` package. You can find the binary (`molecula-consumer-kafka-delete`) as part of the community releases. This consumer is built on top of [Confluent's go client](https://github.com/confluentinc/confluent-kafka-go). Unlike other consumers, it processes message one at a time.

Use `molecula-consumer-kafka -h` to list all available flags. Each flag is also available as an environment variable by prefixing it with "CONSUMER_" and converting any dots or dashes to underscores. For example tls.ca-certificate becomes CONSUMER_TLS_CA_CERTIFICATE.

Note: In order for TLS to be used, the various TLS options need to be set, but each service URL must also include the appropriate protocol (e.g. FeatureBase hosts should look like "https://featurebase0.local:10101").

Below are the current configuration flags:

| Flag | Value | Description |
| ---  | ---   | ---     |
|      `--auth-token` |string                     |             Authentication Token for FeatureBase |
|  `-a`, `--auto-generate` |                          |           Automatically generate IDs.|
|      `--commit-timeout` | duration                 |        Maximum time before canceling commit.|
|      `--consumer-close-timeout` | int              |      The amount of time in seconds to wait for the consumer to close properly. (default 30)|
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
|  `-l`, `--log-path` | string                                     | Log file to write to. Empty means stderr.|
|      `--offset-mode`  |                                        | Set offset-mode based Autogenerated IDs, for use with a data-source that is offset-based (must be set alongside auto-generate and external-generate). (default true)|
|  `-k`, `--pack-bools` | string                                   | If non-empty, boolean fields will be packed into two set fields—one with this name, and one with <name>-exists. This must be the same as the pack-bools value used when messages were written to FeatureBase.(default "bools")|
|      `--pilosa-grpc-hosts` | strings                           | Alias for --featurebase-grpc-hosts. Will be deprecated in the next major release. (default [localhost:20101])|
|  `-p`, `--pilosa-hosts` | strings                                | Alias for --featurebase-hosts. Will be deprecated in the next major release. (default [localhost:10101])|
|  `-o`, `--pprof` |  string                                        | host:port on which to listen for pprof (default "localhost:6062")|
|  `-r`, `--primary-key-fields` | strings                          | Data field(s) which make up the primary key for a record. These will be concatenated and translated to a FeatureBase ID. If empty, record key translation will not be used.  (default [])|
|      `--schema-registry-password` | string                     | authenticaion secret provided by confluent for schema registry.|
|  `-g`, `--schema-registry-url` | string                          | Location of Confluent Schema Registry. Must start with 'https://' if you want to use TLS. (default "http://localhost:8081")|
|     `--schema-registry-username` | string                     | authenticaion key provided by confluent for schema registry.|
|      `--skip-old`      |                                       | False sets kafka consumer configuration auto.offset.reset to earliest, True sets it to latest.|
|  `-s`, `--stats string`    |                                     | host:port on which to host metrics (default "localhost:9093")|
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

## The Kafka Messages
Each Kafka message should be encoded with an Avro Schema of type `record`. It must contains a `delete` property (defaults to `fields`). Here is an example:
```
{
    "namespace": "example.test",
    "type": "record",
    "name": "schema_name",
    "delete": "fields",
    "fields": [ ... ]
}
```
The value of the `delete` property determines the behavior of the consumer, what the Avro Schema should look like, and what the raw Kafka message should look like. There are three allowed delete types:
1. `"fields"`: Use this when you want to delete all the values in a list of fields for a single record. This is particually useful if you want to clear all the values in a `STRINGSET` of `IDSET` field but you don't know what values it currently contains. Otherwise, the `values` property can be used. Note that this message type cannot be used for `keys: false` indexes (i.e. you must use `--primary-key-fields` when running the consumer and have an index configured with `keys: true`).
2. `"values"`: Use this when you want to delete some of the values in STRINGSET and `IDSET` fields. Here you do need to know what the values are to delete them. You can set `INT`, `DECIMAL`, `TIMESTAMP`, and `BOOL` fields to null without knowing their values.
3. `"records"`: Use this when you want to delete full records. You can either delete all records that match some filter (i.e. a `PQL` row query) or you can delete all records in a list of records (strings for indexes with a configuration of `keys: true` and integers for indexes with a configuration of `keys: false`.)

It is possible to have a Kafka topic with messages of all the types above. The consumer will read the properties of the schema used to encode each message.

---
### Fields

When the delete property in the Avro Record Schema is set to `"fields"`, the following should be true:
1. The `--primary-key-fields` configuration option is set (i.e. not `--id-field` or `--auto-generate`/`--external-generate`)
2. There are fields for each value in the `--primary-keys-fields` configuration option. The consumer will uses these fields to determine the `ID` of the record to delete data from.
2. There is a field named `fields` wit the following type: `{"type": "array", "items": "string"}`. The value is the list of fields to delete all the data from.

Prior to the introduction of the `delete` property in the Avro schema, this was the only delete option. Thus, if there is no `delete` property in the Avro schema, this is the behavior of the consumer.

---
#### Examples

Avro Schema:

```
{
    "namespace": "example.test",
    "type": "record",
    "name": "a_delete_schema",
    "delete": "fields",
    "fields": [
        {"name": "pk0", "type": "string"},
        {"name": "pk1", "type": "string"},
        {"name": "fields", "type": {"type": "array", "items": "string"}}
    ]
}
```

Raw Kafka Message:

```
{"pk0": "9z4aw", "pk1": "5ptDx", "fields": ["int_fld","stringset_fld"]}
```

The message above sets `int_fld` to `null` and clears all the values that were in `stringset_fld`.

Consumer Configuration:
```
molecula-consumer-kafka-delete \
    --primary-key-fields "pk0,pk1" \
    --topics delete_topic \
    --kafka-bootstrap-server localhost:9092 \
    --schema-registry-url localhost:8081 \
    --featurebase-hosts localhost:10101 \
    --featurebase-grpc-hosts localhost:20101 \
    --index an_index
```

---
### Values
When the delete property in the Avro Record Schema is set to `"values"`, the Avro fields should contain fields you may or may not want to delete data from. The name of the field in the Avro schema should be the name of the field in FeatureBase.

Here is what the `"type"` should be for Avro fields depending on the FeatureBase field type:

| FeatureBase SQL Type | FeatureBase Field Type | Avro Field Type |
| ---                    | ---                  | ---             |
| `_id`                  | Record ID / Key | string or int |
| `STRING`                 | Keyed Mutex | string |
| `STRINGSET`              | Keyed Set | string or array of strings |
| `STRINGSETQ`             | Keyed Time | N/A |
| `ID`                     | Non-Keyed Mutex| int |
| `IDSET`                  | Non-Keyed Set | int or array of ints |
| `IDSETQ`                 | Non-Keyed Time | N/A |
| `INT`                    | Int | boolean |
| `DECIMAL`                | Decimal | boolean |
| `TIMESTAMP`              | Timestamp | boolean |
| `BOOL`                   | Bool | boolean |

For FeatureBase fields that require `string` or `int` avro types, the value in the raw Kafka message should be the value(s) in the FeatureBase field to delete. In most cases, its appropriate to use a `union` type to union `string` or `int` with `null`. In this case, you can pass null for fields that data shouldn't be deleted from.

For FeatureBase fields that require an Avro type of boolean, the value in the raw Kafka message should be `true` when the value should be deleted, and `false` otherwise.

The `_id` field in the Avro message is reserved for the record ID / key. This is used to identify the record for which data should be deleted. If the FeatureBase index has keys set to `true` then the type of the `_id` Avro field should be set to `string`. Otherwise, it should be set to `int`.

FeatureBase `time` fields (time quantums) don't currently support deletion.

#### Examples

Avro Schema
```
{
    "namespace": "example.test",
    "type": "record",
    "name": "delete_value_schema",
    "doc": "All supported avro types and property variations",
    "delete": "values",
    "fields": [
        {"name": "_id", "type": "string"},
        {"name": "stringset_string", "type": ["string", "null"]},
        {"name": "string_string", "type": ["string", "null"]},
        {"name": "stringset_stringarray", "type": [{"type": "array", "items": "string"}, "null"]},
        {"name": "idset_int", "type": ["int", "null"]},
        {"name": "id_int", "type": ["int", "null"]},
        {"name": "idset_intarray", "type": [{"type": "array", "items": "int"}, "null"]},
        {"name": "int_int", "type": "boolean"},
        {"name": "decimal_double", "type": "boolean"},
        {"name": "bools", "type": [{"type": "array", "items": "string"}, "null"]},
        {"name": "timestamp_bytes_int", "type": "boolean"}
    ]
}
```

Raw Kafka Messages:
```
{"_id": "u2Yr4|sHaUv|x5z8P", "stringset_string": {"null": null}, "string_string": {"string": "ZgkOB"}, "stringset_stringarray": {"array": ["u2Yr4", "PYE8V", "VBcyJ"]}, "idset_int": {"int": 890}, "id_int": {"int": 39}, "idset_intarray": {"array": [731, 13]}, "int_int": false, "bools": {"array": ["bool_bool"]}, "decimal_double": true, "timestamp_bytes_int": true}
{"_id": "h1iqc|5ptDx|iYeOV", "stringset_string": {"null": null}, "string_string": {"null": null}, "stringset_stringarray": {"null": null}, "idset_int": {"null": null}, "id_int": {"null": null}, "idset_intarray": {"null": null}, "int_int": true,  "decimal_double": true, "bools": {"null": null}, "timestamp_bytes_int": true}
```

A couple notes about the first message above. It deletes data for the record with ID `u2Yr4|sHaUv|x5z8P`. Among other things it:
- doesn't make any changes to `stringset_string` because `{"null": null}` is passed as the value
- doesn't make any changes to `int_int` because `false` was passed as the value
- deletes the value `u2Yr4`, `PYE8V`, and `VBcyJ` from `stringset_stringarray` if they existed
- sets `timestamp_bytes_int` to `null` because the boolean value is set to `true`

Consumer Configuration
```
molecula-consumer-kafka-delete \
    --topics delete_topic \
    --kafka-bootstrap-server localhost:9092 \
    --schema-registry-url localhost:8081 \
    --featurebase-hosts localhost:10101 \
    --featurebase-grpc-hosts localhost:20101 \
    --index an_index
```

Note that `an_index` here will have `keys: true` since the `_id` Avro fields is type `string`.

---
### Records
When the delete property in the Avro Record Schema is set to `"records"`, the Avro fields should be `"ids"`, `"keys"`, `"filter"` or some combination of those three.

An `"ids"` Avro field should be used to delete a list of records based on their `_id` when the index is configured to `keys: false`. The type should be `{"type": "array", "items": "int"}`.

A `"keys"` Avro field should be used to delete a list of records based on their `_id` when the index is configured to `keys: true`. The type should be `{"type": "array", "items": "string"}`.

A `"filter"` avro field should be used to delete records based on some `PQL` row call. The type should be `{"type": "string"}`.

#### Examples

Avro Schema:
```
{
    "namespace": "example.test",
    "type": "record",
    "name": "alltypes_delete_records",
    "docs": "supply list of keys or a PQL filter",
    "delete": "records",
    "fields": [
        {"name": "keys", "type": [{"type": "array", "items": "string"}, "null"]},
        {"name": "filter", "type": ["string", "null"]}
    ]
}
```

Raw Kafka Messages:
```
{"keys": {"array": ["9z4aw|5ptDx|CKs1F", "ASSAw|kauLy|oxjI0"]}, "filter": {"null": null}}
{"keys": {"null": null}, "filter": {"string": "Row(stringset_string='58KIR')"}}
```

The first message deletes the entire record for records with ID `9z4aw|5ptDx|CKs1F` and `ASSAw|kauLy|oxjI0`. The second message deletes all records that had the value `58KIR` in the field `stringset_string`.

Consumer Configuration:
```
molecula-consumer-kafka-delete \
    --topics delete_topic \
    --kafka-bootstrap-server localhost:9092 \
    --schema-registry-url localhost:8081 \
    --featurebase-hosts localhost:10101 \
    --featurebase-grpc-hosts localhost:20101 \
    --index an_index
```

---


## Next step

- If you are looking to delete data outside a consumer, see the follow PQL queries: [Clear](/docs/pql-guide/pql-write-clear/), [ClearRow](/docs/pql-guide/pql-write-clearrow/), [Delete](/docs/pql-guide/pql-write-delete/).
