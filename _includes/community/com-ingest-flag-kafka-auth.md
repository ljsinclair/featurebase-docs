## Kafka authentication flags

| Flag | Data type | Description | Default | Required |
|---|---|---|---|---|
| `--kafka-tls.ca-certificate` | string | Path to CA certificate file, or literal PEM data. |  |  |
| `--kafka-tls.certificate` | string | Path to certificate file, or literal PEM data. |  |  |
| `--kafka-tls.enable-client-verification` |  | Enable verification of client certificates. |  |  |
| `--kafka-tls.key` | string | Path to certificate key file, or literal PEM data. |  |  |
| `--kafka-tls.skip-verify` |  | Disables verification of server certificates. |  |  |

Just for connecting to Kafka.
Use the tls flags if authentication on featurebase
