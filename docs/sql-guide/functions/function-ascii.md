---
title: ASCII()
layout: default
parent: functions
grand_parent: SQL guide
nav_order: 1
---

# ASCII String function

`Ascii()` returns the ASCII code value of the string expression.

## Syntax

```
ascii(str_expr)
```

## Arguments

| Argument | Description | Length |
|---|---|---|---|
| `str_expr` | A string expression | 1 |

## Returns

| Data type | Value |
|---|---|
| `int` | ASCII code value of `str_expr` |

## Examples

### ASCII function on a column

```sql
create table segments
    (_id id, segment string);

insert into segments(_id, segment)
    values (1,'r')

select _id, ascii(segment) as segment from segments;
+-----+----------+
| _id | segment  |
+-----+----------+
|   1 | 114      |
+-----+----------+
```
