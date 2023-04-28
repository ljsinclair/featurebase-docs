{: .note}
`NULL` updates only work with `INSERT` commands at this time

FeatureBase ingest uses UPSERT behavior, but the ways a value updates varies depending on the data type.

| UPDATE Value | UPDATE Behavior |
|---|---|
| Value of same type | Replace existing value with new value |
| `NULL` | Clear current value and set to `NULL`  |