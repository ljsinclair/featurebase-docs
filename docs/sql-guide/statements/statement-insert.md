---
title: INSERT/REPLACE
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 1
---

# INSERT/REPLACE statement

`INSERT` or `REPLACE` multiple rows of data into existing columns in a FeatureBase table.

## BNF diagrams

![expr](/assets/images/sql-guide/insert_stmt.svg)
![expr](/assets/images/sql-guide/column_list.svg)

## DDL syntax

```
[INSERT | REPLACE] INTO
  table_name [column_list]
  VALUES
      ({id-value}, value,...)
    [
      ({id_value}, value,...)
    ];
```

## Arguments

| Argument | Description | Further information |
|---|---|---|
| table_name | Target table name |  |
| column_list | Optional list of columns which must include the `_id` column | If omitted the system assumes values are inserted into existing columns |
| `_id` | Table ID column |  |
| `column_name` | Target column name repeated for each subsequent column |  |
| `id_value` | Required ID value |
| `value` | Value to insert into the column |

### column_list



_column_list_ is the target list of columns to be inserted into. They must be valid columns for the specified table _table_name_, and one of the columns must be the `_id` column. If no _column_list_ is specified, a column list consisting of all columns in the table is assumed.

### value_list

![expr](/assets/images/sql-guide/value_list.svg)

_value_list_ is the list of expressions to be inserted. The length of the _value_list_ must match the length of the _column_list_.



## Examples

```sql
insert into test_table (_id, column1, column2) values (1, 10, 'data10'), (2, 10, 'data10');
```
