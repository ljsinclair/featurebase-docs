---
title: SHOW COLUMNS
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 10
---

# SHOW COLUMNS statement

## BNF diagram

![expr](/assets/images/sql-guide/show_columns.svg)

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

## Examples

### SHOW COLUMNS on sample database `skills` table

```
SHOW COLUMNS FROM skills;
```

|_id | name | type | internal_type | created_at | keys | cache_type | cache_size | scale | min | max | timeunit | epoch | timequantum | ttl |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| _id | _id | string | string | 2023-01-05T05:53:06Z | true |  | 0 | 0 | 0 | 0 |  | 0 |  | 0s |
| bools | bools | stringset | stringset | 2023-01-05T05:53:06Z | true | ranked | 50000 | 0 | 0 | 0 |  | 0 |  | 0s |
| bools-exists | bools-exists | stringset | stringset | 2023-01-05T05:53:06Z | true | ranked | 50000 | 0 | 0 | 0 |  | 0 |  | 0s |
| id | id | int | int | 2023-01-05T05:53:06Z | false |  | 0 | 0 | -9223372036854776000 | 9223372036854776000 |  | 0 |  | 0s |
| skills | skills | stringset | stringset | 2023-01-05T05:53:06Z | true | ranked | 50000 | 0 | 0 | 0 |  | 0 |  | 0s |
| titles | titles | stringset | stringset | 2023-01-05T05:53:06Z | true | ranked | 50000 | 0 | 0 | 0 |  | 0 |  | 0s |
