## Not used flags

| Flag | Description |
|---|---|
| `--cache-length` | int | Number of batches of ID mappings to cache. IDs used in multiple batches are stored once. | 64 |  |
| `--exp-split-batch-mode` | Tell FeatureBase client to build bitmaps locally over many batches and import them at the end. Does not support `int` or `mutex` fields. |
| `--key-translate-batch-size` | int | Maximum number of keys to translate at a time. |  |  |
| `--lookup-batch-size` | int | Number of records to batch before writing them to Lookup database. |  |
| `--lookup-db-dsn` | string | Connection string for connecting to Lookup database. |  |
| `--just-do-it` |  | Any header field not in the appropriate format is converted to lower-case and processed as a `Stringset` field |  |  |

## Discard flags
| Flag | Data type | Description | Default |
|---|---|---|---|
| `--assume-empty-featurebase` |  | Assume FeatureBase database has no data. |  |  |
| --exp-split-batch-mode  |  | Tell featurebase client to build bitmaps locally over many batches and import them at the end. Experimental. Does not support int or mutex fields. Don't use this unless you know what you're doing. |  |  |
| assume-empty-pilosa | bool | Alias for --assume-empty-featurebase. Will be deprecated in the next major release. |  |
| `--future.rename` | Interact with FeatureBase instead of Pilosa. |  |
| `--pilosa-grpc-hosts` | strings | Alias for --featurebase-grpc-hosts. Will be deprecated in the next major release. | [localhost:20101] |
| `--pilosa-hosts strings`   Alias for `--featurebase-hosts`. Will be deprecated in the next major release. | [localhost:10101] |
