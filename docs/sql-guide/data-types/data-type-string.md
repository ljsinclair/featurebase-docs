---
title: STRING
layout: default
parent: Data types & constraints
grand_parent: SQL guide
nav_order: 6
---

# STRING data type

## DDL Syntax

```
STRING
```

## Arguments

| Argument | Description |
|---|---|
| STRING | Used for STRING, CHAR and VARCHAR data. |

## Additional information

The STRING data type:
* has a `keyed mutex` internal data type
* works best when:
  * Looking for discrete values,
  * `group by` where cardinality is low

If data has high cardinality:
* performance can decrease
* storage will increase

## Examples

### CREATE TABLE with all data types

{% include /sql-guide/table_create_eg_all_datatypes.md %}
