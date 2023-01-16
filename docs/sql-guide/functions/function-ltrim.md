---
title: LTRIM()
layout: default
parent: functions
grand_parent: SQL guide
nav_order: 2
---

# LTRIM() string function

`LTRIM()` function removes the leading whitespaces from input string from the selected column.

## Syntax

```
ltrim(expr)
```

## Arguments

| Argument | Description |
|---|---|
| expr | any expression with a `string` data type. |

## Returns

| Data type | Value |
|---|---|
| `string` | Input string with leading whitespace removed. |

## Examples

### Trim strings in a column

```sql
create table segments
    (_id id, segment string);

insert into segments(_id,segment)
    values (1,'    green    ')

select _id, ltrim(segment) as TrimmedStr from segments;
+-----+------------+
| _id | TrimmedStr |
+-----+------------+
|   1 | green      |
+-----+------------+
```
