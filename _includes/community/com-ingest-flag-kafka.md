## Kafka ingester flags

| Flag | Data type | Description | Default | Required |
|---|---|---|---|---|
| `--featurebase-grpc-hosts` | string | Comma separated list of host:port pairs for FeatureBase's GRPC endpoint.| [] | When using `molecula-consumer-kafka-delete` |
| `--group` | string | Kafka group.| "defaultgroup" |  |
| `--kafka-hosts` | string | Comma separated list of host:port pairs for Kafka.| [localhost:9092] |  |
| `--skip-old` |  | Skip to the most recent Kafka message rather than starting at the beginning. |  |  |
| `--timeout` | duration | Time to wait for more records from Kafka before flushing a batch. 0 to disable.| 1s |  |
| `--topics` | string | Kafka topics to read from.| [defaulttopic] |  |

## TEMP! Fill in details once have the full set of flags to hand

| Flag | Data type | Description | Default | Required |
|---|---|---|---|---|
| `--registry-url |  | Define the Confluent Schema Registry used with the Kafka system. Cannot be used with `molecula-ingest-kafka-static` | <confluent schema registry>` | For `molecula-ingest-kafka` and `molecula-ingest-kafka-delete` |

### Required for `molecula-ingest-kafka-static`

| Flag | Data type | Description | Default | Required |
|---|---|---|---|---|
| header | string | Path to the static schema, in JSON header format. | <filename>.json | Yes |
| allow-missing-fields | bool | Will proceed with ingest even if a field is missing from a record but specified in the JSON config file. |  |  |
