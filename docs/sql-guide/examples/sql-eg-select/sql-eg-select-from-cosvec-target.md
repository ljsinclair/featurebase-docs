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
* [COSINE_DISTANCE function](/docs/sql-guide/functions/function-cosine-distance)
* [EUCLIDEAN_DISTANCE function](/docs/sql-guide/functions/function-euclidean-distance)
* [CREATE TABLE cosvec-target](/docs/sql-guide/examples/sql-eg-table/sql-eg-table-create-cosvec-target)
* [INSERT INTO cosvec-target](/docs/sql-guide/examples/sql-eg-insert/sql-eg-insert-cosvec-target)

## Comparing the distance metrics

The following example illustrates the difference in behavior between the cosine and
euclidean distance:

```sql
SELECT cosine_distance([1.0, 0.0], [0.0, 1.0]) as cos_1_0,
       euclidean_distance([1.0, 0.0], [0.0, 1.0]) as euc_1_0,
       cosine_distance([2.0, 0.0], [0.0, 2.0]) as cos_2_0,
       euclidean_distance([2.0, 0.0], [0.0, 2.0]) as euc_2_0;

 cos_1_0 |   euc_1_0 | cos_2_0 |  euc_2_0
---------+-----------+---------+----------
       1 | 1.4142135 |       1 | 2.828427
```

The cosine distance between two vectors is unaffected by their magnitude,
and measures only the similarity of their angles. The euclidean distance
is measuring the distance between points, rather than the angle between
vectors.

## Further information

* [SQL Guide examples](/docs/sql-guide/examples/sql-eg-home)
