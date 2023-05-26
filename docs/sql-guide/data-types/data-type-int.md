---
title: INT
layout: default
parent: Data types & constraints
grand_parent: SQL guide
nav_order: 6
---

# INT data type

Int is a numeric datatype used with the `min` and `max` constraints.

## DDL Syntax

```
INT [MIN {value}] [MAX {value}]
```

## Arguments

| Argument | Description |
|---|---|
| INT | Used for integer data that spans a large range of values intended for aggregate queries |
| MIN | Minimum value constraint defaults to -2^63 |
| MAX | Maximum value constraint defaults to 2^63 -1 |

## Additional information

INT is not suitable for queries that
* group by
* include data sets with low cardinality

Instead, use the [ID data type](/docs/sql-guide/data-types/data-type-id).

## Examples

### CREATE TABLE with all data types

{% include /sql-guide/table_create_eg_all_datatypes.md %}
