---
title: INSERT/REPLACE
layout: default
parent: Statements
grand_parent: SQL guide
---

# INSERT/REPLACE statement

`INSERT` or `REPLACE` multiple rows of data into existing columns in a FeatureBase table.

## BNF diagrams

![expr](/assets/images/sql-guide/insert_stmt.svg)

### column_list
![expr](/assets/images/sql-guide/column_list.svg)

### value_list
![expr](/assets/images/sql-guide/value_list.svg)

## DDL syntax

```
[INSERT | REPLACE] INTO
  table_name [column_list]
  VALUES
      {(value_list),...};
```

## Arguments

| Argument | Description | Required? | Further information |
|---|---|---|---|
| table_name | Target table name |  |  |
| column_list | Optional list of columns which must include the `_id` column |  | If omitted the system assumes values are inserted into existing columns |  |
| value_list | The list of expressions or values to be inserted. | Yes | The length of the value_list must match the length of the column_list. |

## Examples

```sql
insert into test_table (_id, column1, column2) values (1, 10, 'data10'), (2, 10, 'data10');
```
