---
title: ASCII()
layout: default
parent: SQL functions
grand_parent: SQL guide
---

# ASCII() function

`Ascii()` returns the ASCII value of the specified string.

## Syntax

```
ascii(expr)
```

## Arguments

| Argument | Description | Length |
|---|---|---|---|
| `expr` | Any `string` expression. | 1 |

## Returns

| Data type | Value |
|---|---|
| `int` | ASCII code value of `expr`. |

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
