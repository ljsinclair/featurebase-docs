## Kafka ingester flags

| Flag | Data type | Description | Default | Required |
|---|---|---|---|---|
| `--featurebase-grpc-hosts` | string | Comma separated list of host:port pairs for FeatureBase's GRPC endpoint. | [] | Kafka-delete |
| `--group` | string | Kafka group.| "defaultgroup" |  |
| `--kafka-hosts` | string |Comma separated list of host:port pairs for Kafka.| [localhost:9092] |  |
| `--skip-old` |  | Skip to the most recent Kafka message rather than starting at the beginning. |  |  |
| `--timeout` | duration | Time to wait for more records from Kafka before flushing a batch. 0 to disable.| 1s |  |
| `--topics` | string | Kafka topics to read from.| [defaulttopic] |  |
