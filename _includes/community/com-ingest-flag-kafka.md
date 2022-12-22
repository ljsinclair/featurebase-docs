## Kafka ingester flags

| Flag | Data type | Description | Default | Required |
|---|---|---|---|---|
| `--featurebase-grpc-hosts` | string | Comma separated list of host:port pairs for FeatureBase's GRPC endpoint. | [] | `kafka-delete` |
| `--group` | string | Kafka group.| "defaultgroup" |  |
| --header | string | Path to the static schema, in JSON header format. May be a path on the local filesystem, or an S3 URI (requires setting --s3-region or environment variable AWS_REGION). |  | When using `kafka-static` |
| `--kafka-hosts` | string | Comma separated list of host:port pairs for Kafka.| [localhost:9092] |  |
| --max-msgs | int | Number of messages to consume from Kafka before stopping. Useful for testing when you don't want to run indefinitely. |  |  |
| `--skip-old` |  | Skip to the most recent Kafka message rather than starting at the beginning. |  |  |
| `--timeout` | duration | Time to wait for more records from Kafka before flushing a batch. 0 to disable.| 1s |  |
| `--topics` | string | Kafka topics to read from.| [defaulttopic] |  |
