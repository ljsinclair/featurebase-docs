---
title: IDENTIFIER()
layout: default
parent: Functions
grand_parent: SQL guide
---

# IDENTIFIER() function

The IDENTIFIER() function is used with the INSERT INTO statement to automatically generate a unique numeric `_id` value for a row of data.

IDENTIFIER() supports the `id` numeric data type for a table `_id` column.

## Syntax

```sql
IDENTIFIER('table_name', <value>,...)
```

## Arguments

| Argument | Description | Data type | Additional information |
|---|---|---|---|
| table_name | Existing table named in INSERT INTO statement | string | [String data type](/docs/sql-guide/data-types/data-type-string) |
| <value> | Value that matches the destination column data type | Valid data types | [FeatureBase Data types](/docs/sql-guide/data-types/data-types-home) |

## Returns

| Data type | Value |
|---|---|
| [ID](/docs/sql-guide/data-types/data-type-id) | A valid, unique numeric value is automatically created for each row of data |

## Examples

### Destination Table

```sql
create table idtest
    (_id id, color string);
```

### INSERT INTO with `identifier` function

```sql
INSERT INTO idtest (_id, color)
    VALUES (idenitifier('idtest'),'green');
```

### SELECT statement

select * from idtest;
+-----+--------+
| _id | color  |
+-----+--------+
|   1 | green  |
+-----+--------+
```
