---
title: BOOL
layout: default
parent: Data types & constraints
grand_parent: SQL guide
nav_order: 1
---

# BOOL data type

## DDL Syntax

```
BOOL
```

## Arguments

| Argument | Description |
|---|---|
| BOOL | The BOOL type stores simple Boolean (true/false) values and is used for simple query filtering. |

## Additional information

Use this table to determine how integer and string values are represented when added to a Boolean column.

| data | value | bool |
|---|---|---|
| integer | 0 | 0 |
| integer > 0 | 1 | 1 |
| string | empty, `0`, `f`, `false` | 0 |
| string | other string values | 1 |

## Update Behavior

{% include /sql-guide/mutex_updates.md %}

## Examples

### CREATE TABLE with all data types

{% include /sql-guide/table_create_eg_all_datatypes.md %}
