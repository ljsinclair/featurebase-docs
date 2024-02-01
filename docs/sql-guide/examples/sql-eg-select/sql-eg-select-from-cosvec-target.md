---
title: SELECT FROM cosvec-target
layout: default
parent: SQL Examples
grand_parent: SQL guide
nav_exclude: true
---
# SELECT FROM cosvec-target

## Before you begin
* [SELECT examples](/docs/sql-guide/examples/sql-eg-home/#select-examples)
* [SELECT statement](/docs/sql-guide/statements/statement-select)
* [COSINE_DISTANCE and EUCLIDEAN_DISTANCE functions](/docs/sql-guide/functions/function-vector-distances)
* [CREATE TABLE cosvec-target](/docs/sql-guide/examples/sql-eg-table/sql-eg-table-create-cosvec-target)
* [INSERT INTO cosvec-target](/docs/sql-guide/examples/sql-eg-insert/sql-eg-insert-cosvec-target)

## Comparing distance metrics

FeatureBase supplies two functions to measure `VECTOR` data type values:
* **cosine_distance** measures the similarity of angles between two vectors, and is unaffected by their magnitude
* **euclidean distance** measures the distance between points, rather than the angle between vectors

The following example illustrates the difference between these measures:

```sql
SELECT cosine_distance([1.0, 0.0], [0.0, 1.0]) as cos_1_0,
       euclidean_distance([1.0, 0.0], [0.0, 1.0]) as euc_1_0,
       cosine_distance([2.0, 0.0], [0.0, 2.0]) as cos_2_0,
       euclidean_distance([2.0, 0.0], [0.0, 2.0]) as euc_2_0;

 cos_1_0 |   euc_1_0 | cos_2_0 |  euc_2_0
---------+-----------+---------+----------
       1 | 1.4142135 |       1 | 2.828427
```

## Further information

* [SQL Guide examples](/docs/sql-guide/examples/sql-eg-home)
