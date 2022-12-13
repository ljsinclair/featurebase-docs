| Flag | Type | Description | Default |
|---|---|---|---|
| auto-generate | bool | Automatically generate IDs when id-field or primary-key fields are null. |
| batch-size | int | Number of records to read before indexing all of them at once. The larger the value, the higher the throughput and memory usage. | 1 |
| featurebase-hosts | strings | Comma separated list of `host:port` pairs for FeatureBase. | localhost:10101 |
| id-field | string | Field which contains the integer column ID. Use instead of primary-key fields. If null, IDs are generated automatically with `auto-generate` |
| index | string | Name of FeatureBase index. |
| pack-bools | string | 


If non-empty, boolean fields will be packed into two set fields, one with this name, and one with <name>-exists. | "bools" |
| pprof | string | host:port on which to listen for pprof | "localhost:6062" |
| primary-key-fields | strings | Data field(s) which make up the primary key for a record. | [] |
| stats | string | host:port on which to host metrics | localhost:9093 |
| string-array-separator | string | Separator to delineate string array values | "," |
| tls.ca-certificate | string | Path to CA certificate file. |
| tls.certificate | string | Path to certificate file. |
| tls.enable-client-verification | bool | Enable client certificate verification. |
| tls.key | string | Path to certificate key file |
| tls.skip-verify | bool | Disables server certificate verification |


## Additional information (move to standalone file later)

FeatureBase `_id` is generated using:
* Primary Key fields, or
* ID fields
If both are null, `auto-generate` is used

Batch size determines data throughput and memory usage.

Generally, larger means better throughput and more memory usage. We recommend 1,048,576 (defaults to 1)
