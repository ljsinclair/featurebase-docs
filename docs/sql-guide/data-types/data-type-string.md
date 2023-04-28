---
title: STRING
layout: default
parent: Data types & constraints
grand_parent: SQL guide
nav_order: 7
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

Use single quotes to contain string values in INSERT, REPLACE or SELECT statements.

If data has high cardinality:
* performance can decrease
* storage will increase

## Update Behavior

{% include /sql-guide/mutex_updates.md %}

## Examples

### CREATE products and sales tables and columns with string datatypes

{% include /sql-guide/table_create_products_sales.md %}

### SELECT FROM string column

```sql
SELECT * FROM products WHERE prodlist LIKE '%pen%';
```

### CREATE TABLE with all data types

{% include /sql-guide/table_create_eg_all_datatypes.md %}
