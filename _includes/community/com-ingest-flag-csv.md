## CSV ingest flags

| Flag | Data type | Description | Default | Required |
|---|---|---|---|---|
| `--concurrency` | int | Number of concurrent sources and indexing routines to launch. Does not support  `--auto-generate` | 1 | When ingesting multiple CSV files |
| `--files` | string | List of files, URLs, or directories to ingest. CSV files can be gzipped. | `[]` | Yes |
| `--ignore-header` |  | Ignore header in file and use `--header` flag to define column names and data types. |  | When using `--header` flag |
