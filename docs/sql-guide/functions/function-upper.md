---
title: UPPER()
layout: default
parent: functions
grand_parent: SQL guide
nav_order: 12
---

# UPPER() string function

`UPPER()` function returns the converted strings to Upper case from the selected column.

## Syntax

```
upper(expr)
```

## Arguments

| Argument | Description |
|---|---|
| `expr` | Any `string` expression |

## Returns

| Data type | Value |
|---|---|
| `string` | `expr` string converted to upper-case. |


## Examples

### Convert strings in a column to upper-case

```sql
create table segments
    (_id id, segment string);

insert into segments(_id,segment)
    values (1,'green')

select _id, upper(segment) as convertedstr from segments;
+-----+---------------+
| _id | convertedstr  |
+-----+---------------+
|   1 | GREEN         |
+-----+---------------+
```
