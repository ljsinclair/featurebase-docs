---
title: TRIM()
layout: default
parent: functions
grand_parent: SQL guide
nav_order: 11
---

# TRIM() string function

`TRIM()` function removes the leading and trailing whitespaces from input string from the selected column.

## Syntax

```
trim(expr)
```

## Arguments

| Argument | Description | Data type | Return value |
|---|---|---|---|
| expr | Any `string` expression |

## Returns

| Data type | Value |
|---|---|
| `string` | Input string after removal of leading and trailing whitespace. |

## Examples

### Trim strings from a column

```sql
create table segments
    (_id id, segment string);

insert into segments(_id,segment)
    values (1,'   green   ')

select _id, trim(segment) as TrimmedStr from segments;

+-----+------------+
| _id | TrimmedStr |
+-----+------------+
|   1 | green      |
+-----+------------+
```
