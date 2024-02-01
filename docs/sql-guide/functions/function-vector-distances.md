---
title: vector distance functions
layout: default
parent: Functions
grand_parent: SQL guide
---
# Vector distance functions

COSINE_DISTANCE() or EUCLIDEAN_DISTANCE() measure the difference between two vectors.

## Syntax

```sql
[COSINE | EUCLIDEAN]_DISTANCE (<vector1>, <vector2>)
```

## Arguments

{: .note}
COSINE and EUCLIDEAN distance is identical for unit-length vectors.

| Argument | Description |
|---|---|
| `COSINE_DISTANCE` | A measure of the angle between `<vector1>` and `<vector2>` to return a measure of similarity between the values while ignoring their magnitude |
| `EUCLIDEAN_DISTANCE` |  The distance metric most commonly used when referring to distances between points on a plain. The resulting value is calculated as: \sqrt{\left( <vector1>^{2} + <vector2>^{2}\right)} |
| `<vector1>, <vector2>` | Vector literal or Vector expressions with the same number of dimensions to compare. |

## Examples

* [SELECT using DISTANCE functions](/docs/sql-guide/examples/sql-eg-select/sql-eg-select-from-cosvec-target)
