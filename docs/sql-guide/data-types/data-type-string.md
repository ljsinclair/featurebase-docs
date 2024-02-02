---
title: STRING
layout: default
parent: Data types & constraints
grand_parent: SQL guide
nav_order: 7
---

# STRING data type

The `STRING` data type has a `keyed-mutex` internal type and is recommended for queries:
* on discrete values,
* with `group by` where cardinality is low

## Syntax

```
STRING
```

## Arguments

| Argument | Description |
|---|---|
| STRING | Used for STRING, CHAR and VARCHAR data. |

## Additional information

{% include /sql-guide/unique-id-string-warning.md %}

### Constraining string values

Single quotation marks are used for string values in the following statements:
* [INSERT/REPLACE](/docs/sql-guide/statements/statement-insert)
* [SELECT](/docs/sql-guide/statements/statement-select)

## Examples

{% include /sql-guide/table-create-prod-sale-string-eg.md %}

{% include /sql-guide/select-string-type-eg.md %}
