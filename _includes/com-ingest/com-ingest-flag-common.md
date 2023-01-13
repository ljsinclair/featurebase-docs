## Common flags

| Flag | Data type | Description | Default | Required |
|---|---|---|---|---|
| `--batch-size` | int | Number of records to read before indexing them as a batch. A larger value indicates better throughput and more memory usage. Recommended: 1,048,576 | 1 |  |
| `--concurrency` | int | Number of concurrent sources and indexing routines to launch. Does not support  `--auto-generate` | 1 | When ingesting multiple CSV files |
| `--featurebase-hosts` | string | Supply FeatureBase default bind points using comma separated list of host:port pairs. | `[]` |  |
| `--header` | string | Defined as  `{source_column_name}[__data_type[_constraint-value...]],...` | `[]` | If `data_type`, `constraint-value` not defined in data file. |
| `--index` | string | Name of target FeatureBase index. |   | Yes |
| `--string-array-separator` | string | character used to delineate values in `string` array | `,` |  |
| `--use-shard-transactional-endpoint` |  | Use alternate import endpoint that ingests data for all fields in a shard in a single atomic request. No negative performance impact and better consistency. |  | Recommended. |
