## Source and target flags

| Flag | Data type | Description | Default | Required |
|---|---|---|---|---|
| `--featurebase-hosts` | string | Supply FeatureBase default bind points using comma separated list of host:port pairs. | `[]` |  |
| `--header` | string | Defined as  `{source_column_name}[__data_type[_constraint-value...]],...` | `[]` | If `data_type`, `constraint-value` not defined in data file. |
| `--index` | string | Name of target FeatureBase index. |   | Yes |
| `--string-array-separator` | string | character used to delineate values in `string` array | `,` |  |
| `--table-name` | string | human readable table name |  |  |
