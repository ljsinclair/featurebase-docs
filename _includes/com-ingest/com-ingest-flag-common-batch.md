## Batch processing flags

| flag | data type | Description | Default | Required |
|---|---|---|---|---|
| `--assume-empty-featurebase` |  | Assume FeatureBase database has no data. |  |  |
| `--batch-size` | int | Number of records to read before indexing them as a batch. A larger value indicates better throughput and more memory usage. Recommended: 1,048,576 | 1 |  |
