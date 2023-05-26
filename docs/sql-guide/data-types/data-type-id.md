---
title: ID
layout: default
parent: Data types & constraints
grand_parent: SQL guide
nav_order: 3
---

# ID numeric datatype

## DDL Syntax

```
ID
```

## Arguments

| Argument | Description |
|---|---|
| ID | Numeric data type used for unsigned integers that are between `1` and `2^63 -1` |

## Additional information

The ID data type:
* has a `mutex` internal data type
* is used with data sets with low cardinality when:
  * grouping by
  * querying discrete values

## Examples

### CREATE TABLE with all data types

{% include /sql-guide/table_create_eg_all_datatypes.md %}
