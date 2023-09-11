---
title: IDENTIFIER()
layout: default
parent: Functions
grand_parent: SQL guide
---

# IDENTIFIER() function

`IDENTIFIER()` function generates unique IDs for the provided index.

## Syntax

```
identifier(expr)
```

## Arguments

| Argument | Description |
|---|---|
| `expr` | `index` name as `string`. |

## Returns

| Data type | Value |
|---|---|
| `id` | `unique ID created. |


## Examples

### create a unique ID for the row

```sql
create table idtest
    (_id id, color string);

insert into idtest (_id,color)
    values (idenitifier('idtest'),'green')

select * from idtest;
+-----+--------+
| _id | color  |
+-----+--------+
|   1 | green  |
+-----+--------+
```
