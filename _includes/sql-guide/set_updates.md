{: .note}
`NULL` updates only work with `INSERT` commands at this time

FeatureBase ingest uses UPSERT behavior, but the ways a value updates varies depending on the data type.

| UPDATE Value | UPDATE Behavior |
|---|---|
| Value of same type | Add new value to existing set of values |
| `NULL` | Clear all values and set to `NULL`  |