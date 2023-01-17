## Serverless flags

These flags are used by the FeatureBase serverless cloud product and not available to FeatureBase Community users.

| Flag | Data type | Description | Default | Required |
|---|---|---|---|---|
| `--assume-empty-featurebase` |  | Ingest optimizations can be performed if it is assumed the destination table is empty. This option may be removed in future and should not be relied upon. |  |  |
| `--cache-length` | int | Number of batches of ID mappings to cache. IDs used in multiple batches are stored once. | 64 |  |
| `--future.rename` | | Interact with FeatureBase instead of Pilosa. |  |  |
| `--just-do-it` |  | Any header field not in the appropriate format is converted to lower-case and processed as a `Stringset` field |  |  |
| `--key-translate-batch-size` | int | Maximum number of keys to translate at a time. |  |  |
| `--lookup-batch-size` | int | Number of records to batch before writing them to Lookup database. |  |  |
| `--lookup-db-dsn` | string | Connection string for connecting to Lookup database. |  |  |
| `--pack-bools` | string | If non-empty, boolean fields will be packed into two set fields—one with this name, and one with <name>-exists. (default "bools")
