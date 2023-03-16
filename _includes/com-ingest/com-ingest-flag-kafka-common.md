## Kafka common flags

| Flag | Data type | Description | Default | Required | Additional |
|---|---|---|---|---|---|
| `–allow-decimal-out-of-range` | `bool` | Allow ingest to continue when it encounters out of range decimals | `false` |  |  |
| `--allow-int-out-of-range` | `bool` | Allow ingest to continue when it encounters out of range integers | `false` |  |  |
| `--allow-missing-fields` | `bool` | Ingest consumer will continue even if fields are specified in a JSON config file but missing from a record  | `false` |  | Recommended for Kafka static |
| `--allow-timestamp-out-of-range` | `bool` | Allow ingest to continue when it encounters out of range timestamps | `false` |  |  |
| `--group` | string | Kafka group. | "defaultgroup" |  |  |
| `--kafka-bootstrap-server` |  | Bootstrap server address of the source cluster. |  |  | [Kafka properties bootstrap server](https://jaceklaskowski.gitbooks.io/apache-kafka/content/kafka-properties-bootstrap-servers.html){:target="_blank"} |
| `--kafka-hosts` | string | Comma separated list of host:port pairs for Kafka.| [localhost:9092] |  |  |
| --max-msgs | int | Number of messages to consume from Kafka before stopping. |  |  | Useful for testing when you don't want to run indefinitely |
| `--skip-old` |  | Skip to the most recent Kafka message rather than starting at the beginning. |  |  |  |
| `--timeout` | duration | Time to wait for more records from Kafka before flushing a batch. 0 to disable.| 1s |  |  |
| `--topics` | string | Kafka topics to read from.| [defaulttopic] |  |  |
