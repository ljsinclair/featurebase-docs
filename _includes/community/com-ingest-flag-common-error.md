## Error handling flags

| flag | data type | Description | Default | Required |
|---|---|---|---|---|
| `--pack-bools` | string | If non-empty, boolean fields are packed into two `set` fields—one with this name, and one with <name>-exists. | "bools" |  |
| `--allow-decimal-out-of-range` |  | Allow ingest to continue when it encounters out of range decimals in `Decimal` Fields. | false |  |
| `--allow-int-out-of-range` |  | Allow ingest to continue when it encounters out of range integers in `Int` Fields. | false |  |
| `--allow-timestamp-out-of-range` |  | Allow ingest to continue when it encounters out of range timestamps in `Timestamp` Fields. | false |  |
| `--commit-timeout` | duration | Maximum time before cancelling commit. |  |  |
| `--just-do-it` |  | Any header field not in the appropriate format is converted to lower-case and processed as a `Stringset` field |  |  |
| `--skip-bad-rows` | int | Fail the ingest process if `n` rows are not processed. |  |  |
