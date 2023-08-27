---
title: Vector
layout: default
parent: Data types & constraints
grand_parent: SQL guide
nav_order: 11
---

# VECTOR() data type

Vector data types store a specified number of floating point values in an array.

These vectors can be compared using the cosine_distance function.

## Syntax

```
VECTOR({length})
```

## Arguments

| Argument | Description | Additional information |
|---|---|---|
| length | An integer value representing the number of elements in the array | Cannot have a zero length |

## Additional information

* values in the array must be floats
* vector itself can be null
* maximum precision is 64-bit float

## Examples

### CREATE TABLE statement with Vector

{% include /sql-guide/table-create-vector.md %}
