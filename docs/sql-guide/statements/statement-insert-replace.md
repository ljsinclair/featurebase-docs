---
title: INSERT
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 3
---

# INSERT statement

`INSERT` or `REPLACE` multiple rows of data into existing columns in a FeatureBase table.

## BNF diagrams

![expr](/assets/images/sql-guide/insert_stmt.svg)

### column_list
![expr](/assets/images/sql-guide/column_list.svg)

### value_list
![expr](/assets/images/sql-guide/value_list.svg)

## DML syntax

```
INSERT INTO
  table_name [(column_list)]
  VALUES
      {(value_list),...};
```

## Arguments

| Argument | Description | Required? | Further information |
|---|---|---|---|
| table_name | Target table name | Yes |  |
| column_list | List of columns which must include the `_id` column | Optional | FeatureBase assumes values to be inserted into existing columns if omitted |
| value_list | The list of constants and/or functions joined by operators, or a subquery to be inserted into the column. | Yes | The length of the value_list must match the length of the column_list. |

## Examples

## Insert two rows into `test_table`

```sql
INSERT INTO test_table (_id, column1, column2) VALUES (1, 10, 'data10'), (2, 10, 'data10');
```

### INSERT multiple records INTO `products` and `services` tables

```sql
INSERT INTO products
  (_id, prodlist, price)
  VALUES
  (1, 'pen', 2.50),
  (2, 'pencil', 0.50),
  (3, 'playpen', 52.50),
  (4, 'gold-plated earplugs', 122.50);

  INSERT INTO services
    (_id, servicelist, price)
    VALUES
    (1, 'free delivery on orders over $50', NULL),
    (2, 'local postage per item', 2.20),
    (3, 'international postage per kilo', 15.99),
    (4, 'local courier (same day to metro)', 25.00)
    (5, 'local delivery > 10 items', 2.00);
```

### INSERT value in services table

```sql
INSERT INTO services (_id, servicelist, price) VALUES (1, 'free deliveries on orders over $50', 0.00);
```

### Overwrite existing value

```sql
INSERT INTO services (_id, servicelist, price) VALUES (2, 'local postage per item', 2.20);
```

### INSERT values into single column identified by `_id`

```sql
INSERT into products (_id, stock) VALUES
  (1,233),
  (2,3289),
  (3, 44),
  (4, 1);
```
