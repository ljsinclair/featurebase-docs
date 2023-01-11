---
title: UPPER
layout: default
parent: Functions
grand_parent: SQL guide
nav_order: 8
---

# UPPER() function

The `UPPER()` function returns the converted strings to upper-case from the selected column.

## Syntax

```
upper(expr)
```

## Arguments

| Argument | Description | Data type |
|---|---|---|
| `expr` | Any expression | `string` |

## Return Type

`string`

## Return Value

`upper()` returns the input string converted to upper case

## Remarks

None

## Examples

### Convert strings to upper-case in a column

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
