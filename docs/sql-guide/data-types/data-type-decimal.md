---
title: DECIMAL
layout: default
parent: Data types & constraints
grand_parent: SQL guide
nav_order: 2
---

# DECIMAL data type

Decimal is a numeric data type used with `scale` constraint.

## DDL Syntax

```
DECIMAL[({SCALE value})]
```

## Arguments

| Argument | Description |
|---|---|
| DECIMAL | Numeric data type ideally used for decimal numbers where the exact scale is known. |
| SCALE | Constraint that determines the number of digits of precision to store after the decimal point. integer value of zero or more. Defaults to two (2) |

## Additional information

* Values added to a column with DECIMAL data type are truncated to the stated number of decimal places.
  * Users should round their values prior to ingestion.
* STRING values added to Columns with DECIMAL data type are parsed as floats where possible
* Aggregate and range queries work best with DECIMAL data types.
* Use STRING data type if you intend to run queries to group by or search for distinct values.

## Update Behavior

{% include /sql-guide/mutex_updates.md %}

## Examples

### CREATE TABLE with all data types

{% include /sql-guide/table_create_eg_all_datatypes.md %}

### CREATE TABLE with decimal data type

{% include /sql-guide/table_create_products_sales.md %}
