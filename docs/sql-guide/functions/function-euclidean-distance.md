---
title: EUCLIDEAN_DISTANCE()
layout: default
parent: Functions
grand_parent: SQL guide
---
# EUCLIDEAN_DISTANCE() function

`EUCLIDEAN_DISTANCE()` is a mathematical function that can be performed on `VECTOR` data type columns.
The Euclidean (or Euclidian) distance between two vectors is the square root of the sum of the squares
the pairwise differences between the vectors. This is the distance metric most commonly used when talking
about distances between locations on a plane.

## Syntax

```sql
EUCLIDEAN_DISTANCE (<vector1>, <vector2>)
```

Vectors can be either vector literals, such as `[0.0, 1.0]` or vector expressions, such as a vector
column in a table. The vectors must have the same number of dimensions.

## Arguments

| Argument | Description |
|---|---|---|
| `<vector1>` | Any vector expression, such as a vector literal or column with `VECTOR()` data type. |
| `<vector2>` | Any vector expression, such as a vector literal or column with `VECTOR()` data type. |

## Examples

* [SELECT using DISTANCE functions](/docs/sql-guide/examples/sql-eg-select/sql-eg-select-from-cosvec-target)
