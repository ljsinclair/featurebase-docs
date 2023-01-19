---
title: SHOW COLUMNS
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 6
---

# SHOW COLUMNS statement

![expr](/img/sql/show_columns.svg)

## Syntax

```sql
SHOW COLUMNS FROM table_name;
```

## Arguments

| Argument | Description |
|---|---|
| table_name | name of existing table in database |

## Returns

| Column name | Data type | Description | Further information |
|---|---|---|
| `name` | string | column name |  |
| `type` | string | column data type | [Data types](/docs/sql-guide/data-types/data-types-home) |
| `internal_type` | string | column data type |  |
| `created_at` | timestamp | timestamp | [TIMESTAMP() data type](/docs/sql-guide/data-types/data-type-timestamp) |
| `keys` | bool | Keys on the column |  |
| `cache_type` | string |  |  |
| `cache_size` | int |  |  |
| `scale` | int | Scale value for `DECIMAL()` column | [DECIMAL() data type](/docs/sql-guide/data-types/data-type-decimal) |
| `min` | int | Minimum value for `INT()` column | [INT() data type](/docs/sql-guide/data-types/data-type-int) |
| `max` | int | Maximum value for `INT()` column | [INT() data type](/docs/sql-guide/data-types/data-type-int) |
| `timeunit` | string | TIMEUNIT for `TIMESTAMP()` column | [TIMESTAMP() data type](/docs/sql-guide/data-types/data-type-timestamp) |
| `epoch` | int | Epoch for `TIMESTAMP()` column | [TIMESTAMP() data type](/docs/sql-guide/data-types/data-type-timestamp) |
| `time_quantum` | string | Applies to `IDSET()` and `STRINGSET()` columns | [IDSET() data type](/docs/sql-guide/data-types/data-type-idset)<br/>[STRINGSET() data type](/docs/sql-guide/data-types/data-type-stringset) |
| `ttl` | string | Applies to `IDSET()` and `STRINGSET()` columns | [IDSET() data type](/docs/sql-guide/data-types/data-type-idset)<br/>[STRINGSET() data type](/docs/sql-guide/data-types/data-type-stringset) |
