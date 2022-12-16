## Batch processing flags

| flag | data type | Description | Default | Required |
|---|---|---|---|---|
| `--assume-empty-featurebase` |  | Assume FeatureBase database has no data. |  |  |
| `--batch-size` | int | Number of records to read before indexing them as a batch. A larger value indicates better throughput and more memory usage. Recommended: 1,048,576 | 1 |  |
| `--batch-max-staleness` | duration | Maximum length of time the oldest record in a batch can exist before the batch is flushed. This may result in timeouts while waiting for the source |  |
| `--cache-length` | int | Number of batches of ID mappings to cache. IDs used in multiple batches are stored once. | 64 |  |
