---
title: VECTOR
layout: default
parent: Data types & constraints
grand_parent: SQL guide
nav_order: 12
---

# VECTOR() data type

Vector data types store a specified number of floating point values in an array.

These vectors can be compared using the [COSINE_DISTANCE() function](#further-information).

## Syntax

```
VECTOR({<length>})
```

## Arguments

| Argument | Description | Additional information |
|---|---|---|
| `<length>` | Integer value representing the number of elements in the array | Cannot have a zero length |

## Additional information

* values in the array must be floats
* vector itself can be null
* maximum precision is 64-bit float

## Value definition

| Column data type | Assignment | Additional information |
|---|---|---|
{% include /sql-guide/vector-value-def.md %}

{% include /sql-guide/vector-csv-definition.md %}

## Examples

* [CREATE TABLE with VECTOR data type](/docs/sql-guide/examples/sql-eg-table/sql-eg-table-create-cosvec-target)
* [INSERT INTO VECTOR data type](/docs/sql-guide/examples/sql-eg-insert/sql-eg-insert-cosvec-target)
* [SELECT FROM VECTOR data type](/docs/sql-guide/examples/sql-eg-select/sql-eg-select-from-cosvec-target)

## Further information

* [VECTOR distance functions](/docs/sql-guide/functions/function-vector-distances)
