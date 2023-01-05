---
title: STRING
layout: default
parent: Data types
grand_parent: SQL preview
nav_order: 5
---

# STRING data type

## Syntax

```
STRING
```

## Arguments

| Argument | Description |
|---|---|
| STRING | Used for STRING, CHAR and VARCHAR data. |

## Additional information

The STRING data type:
* has a `keyed mutex` internal data type
* works best when:
  * Looking for discrete values,
  * `group by` where cardinality is low

If data has high cardinality:
* performance can decrease
* storage will increase
