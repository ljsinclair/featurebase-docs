---
title: COALESCE()
layout: default
parent: Functions
grand_parent: SQL guide
---

# COALESCE() function

`COALESCE()` function is used to return the first non-null value among the provided parameters.

## Syntax

```
coalesce(value1, value2, ...)
```

## Arguments

| Argument | Description | Length |
|---|---|---|---|
| `value1`,`value2`.. | Any expressions or values of same data type. The function returns the first non-null value among them. | 1 |

## Returns

The data type and value of the first non-null parameter

## Examples

### using Coalesce() function to handle null values

```sql
create table stock
    (__id id, product string, brand string, subcategory string, category string, family string, quantity_available int, minimum_to_have int);

insert into stock
    values 
    (1, 'pork ribs', NULL, 'pork meat', 'meat','food',400, 130),
    (2, 'tomatoes','Mr Red', NULL, 'vegetables','food',280, 100),
    (3,'lettuce',NULL, 'Leaf vegetables', NULL,'food',280, Null),
    (4,'Bananas',NULL, NULL,NULL,'food',Null, NULL),
    (5,'hamburger','MaxBurg','cow meat','meat','food',220, 150),
    (6,'hamburger','SuperBurga',Null,Null,Null,125, Null);

select * from stock;

+----+----------+----------+----------------+-----------+--------+-------------------+----------------+
|_id | product  | brand    | subcategory    | category  | family | quantity_available| minimum_to_have|
+----+----------+----------+----------------+-----------+--------+-------------------+----------------+
| 1  | pork ribs| NULL     | pork meat      | meat      | food   | 400               | 130            |
+----+----------+----------+----------------+-----------+--------+-------------------+----------------+
| 2  | tomatoes | Mr Red   | NULL           | vegetables| food   | 280               | 100            |
+----+----------+----------+----------------+-----------+--------+-------------------+----------------+
| 3  | lettuce  | NULL     | Leaf vegetables| NULL      | food   | 280               | NULL           |
+----+----------+----------+----------------+-----------+--------+-------------------+----------------+
| 4  | Bananas  | NULL     | NULL           | NULL      | food   | NULL              | NULL           |
+----+----------+----------+----------------+-----------+--------+-------------------+----------------+
| 5  | hamburger| MaxBurg  | cow meat       | meat      | food   | 220               | 150            |
+----+----------+----------+----------------+-----------+--------+-------------------+----------------+
| 6  | hamburger|SuperBurga| NULL           | NULL      | NULL   | 125               | NULL           |
+----+----------+----------+----------------+-----------+--------+-------------------+----------------+

select product,coalesce(brand, 'locally grown') as final_brand from stock;

+-----------+--------------+
| product   | final_brand  |
+-----------+--------------+
|  pork ribs| locally grown|
+-----------+--------------+
|  tomatoes | Mr Red       |
+-----------+--------------+
|  lettuce  | locally grown|
+-----------+--------------+
|  Bananas  | locally grown|
+-----------+--------------+
| hamburger | MaxBurg      |
+-----------+--------------+
| hamburger | SuperBurga   |
+-----------+--------------+


select product,coalesce(subcategory, category, family, 'no product description') as product_and_subcategory from stock;
+-----------+--------------------------+
| product   | product_and_subcategory  |
+-----------+--------------------------+
|  pork ribs| pork meat                |
+-----------+--------------------------+
|  tomatoes | vegetables               |
+-----------+--------------------------+
|  lettuce  | Leaf vegetables          |
+-----------+--------------------------+
|  Bananas  | food                     |
+-----------+--------------------------+
| hamburger | cow meat                 |
+-----------+--------------------------+
| hamburger | no product description   |
+-----------+--------------------------+

select _id, coalesce(quantity_available, minimum_to_have,100) as quantity from stock;
+----+----------+
| _id | quantity|
+-----+---------+
|   1 |  400    |
+-----+---------+
|   2 |  280    |
+-----+---------+
|   3 |  280    |
+-----+---------+
|   4 |  100    |
+-----+---------+
|   5 |  220    |
+-----+---------+
|   6 |  125    |
+-----+---------+

```
