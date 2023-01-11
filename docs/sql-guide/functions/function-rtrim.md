---
title: RTRIM
layout: default
parent: Functions
grand_parent: SQL guide
nav_order: 4
---

# RTRIM() function

The `RTRIM()` function removes the trailing whitespaces from input string from the selected column.

## Syntax

```
rtrim(expr)
```

## Arguments

| Argument | Description | Data type |
|---|---|
| `expr` | Any expression. | `string` |

## Return Type

`string`

## Return Value

`rtrim()` returns the input string after removing trailing whitespaces

## Remarks

None

## Examples

### Trim strings in a column

```sql
create table segments
    (_id id, segment string);

insert into segments(_id,segment)
    values (1,'    green    ')

select _id, rtrim(segment) as TrimmedStr from segments;
+-----+------------+
| _id | TrimmedStr |
+-----+------------+
|   1 |     green  |
+-----+------------+
```
