---
title: fbsql-loader-kafka
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 22
---

# Kafka Loader

<!-- copied from original fbsql-loaders.md

Based on the configuration file provided as an argument to this flag, fbsql will read messages from a Kafka topic and submit them to FeatureBase via BULK INSERT statements.
-->

If fbsql is provided the `--loader-kafka=filename` flag, it will run as a Kafka consumer in non-interactive mode. Based on the configuration provided in **filename**, fbsql will read messages from a Kafka topic and submit them to FeatureBase via `BULK INSERT` statements. In this mode, fbsql processes messages until terminated by the user.

## Kafka Specific Configuration Options

Messages from Kafka must be in JSON format.

### General
The table below holds the key/value pairs supported in the TOML configuration file if you are connecting to kafka:

| Key | Description | Example Value | Default |
|---|---|---|---|
| `hosts` | Specifies one more more Kafka broker hosts. If only one host is needed, this value can be provided without brackets. | `["host1", "host2"]` | |
| `group` | Kafka consumer group. See the [Confluent Documentation](https://docs.confluent.io/platform/current/clients/consumer.html) for more information. | `"groupname"` | |
| `topics` | Specifies one more more Kafka topics to consumer from. If only one topic is needed, this value can be provided without brackets. | `["topic1", "topic2"]` | |
| `batch-max-staleness` | Maximum length of time that the oldest record in a batch can exist before flushing the batch. Note that this can potentially stack with timeouts waiting for the source. The format of this value should be provided as a duration string, which is a possibly signed sequence of decimal numbers, each with optional fraction and a unit suffix, such as "300ms", "-1.5h" or "2h45m". Valid time units are "ns", "us" (or "µs"), "ms", "s", "m", "h". Set this value to `0` to disable timeouts. | `2h` | `1s`|
| `timeout` | Time to wait for more records from Kafka before flushing a batch. The format of this value should be provided as a duration string, which is a possibly signed sequence of decimal numbers, each with optional fraction and a unit suffix, such as "300ms", "-1.5h" or "2h45m". Valid time units are "ns", "us" (or "µs"), "ms", "s", "m", "h". Set this value to `0` to disable timeouts.  | `1m` | `1s`|

### Fields
The table below holds the key/value pairs supported in the TOML fields array if you are connecting to kafka:

| Key | Description | Example Value | Default |
|---|---|---|---|
| `source-path` | If the data for a particular FeatureBase column needs to be extracted from a nested JSON object, that can be specified using `source-path`. Each additional element in the array represents a nested key. If `source-path` is not provided, it will default to the value provided in `name`. | `["key", "sub-key"]` | value of `name` |


## Example

FeatureBase `CREATE TABLE` statement:
```sql
create table events (
    _id id,
    name string,
    qty int,
    categories stringset,
    level decimal(2),
    ts timestamp
)
```

Sample Kafka Message:
```json
{
    "event_id":30,
    "name":"name-30",
    "qty":4,
    "demo":{
        "categories":["A", "C"],
        "level":24.56
    },
    "ts":"2023-02-27T12:26:25.091284-06:00"
}
```

FBSQL configuration file pointed to by `--loader-kafka`:
```toml
hosts = ["localhost:9092"]
group = "grp"
topics = "events"
table = "events"
batch-size = 300
batch-max-staleness = "5s"
timeout = "5s"

[[fields]]
name        = "event_id"
source-type = "id"
primary-key = true

[[fields]]
name        = "name"
source-type = "string"

[[fields]]
name        = "qty"
source-type = "int"

[[fields]]
name        = "categories"
source-type = "stringset"
source-path = ["demo", "categories"]

[[fields]]
name        = "level"
source-type = "decimal(2)"
source-path = ["demo", "level"]

[[fields]]
name        = "ts"
source-type = "timestamp"
```

## Additional Resources
* [Learn about fbsql](/docs/tools/fbsql/fbsql-home)
* [Learn how to install fbsql](/docs/tools/fbsql/fbsql-install)
