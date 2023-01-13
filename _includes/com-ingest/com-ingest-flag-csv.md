## CSV ingest flags

| Flag | Data type | Description | Default | Required |
|---|---|---|---|---|
| `--files` | string | List of files, URLs, or directories to ingest. CSV files can be gzipped. | `[]` | Yes |
| `--ignore-header` |  | Ignore header in file and use `--header` flag to define column names and data types. |  | When using `--header` flag |
