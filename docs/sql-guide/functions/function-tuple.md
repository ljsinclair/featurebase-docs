---
title: TUPLE()
layout: default
parent: Functions
grand_parent: SQL guide
---

# TUPLE() function

`TUPLE()` is a mathematical function that returns an ordered list of values corresponding to and derived from a supplied argument.

It is especially important for use in `BULK INSERT` statements to combine values intended for `SETQ` columns.

## Before you begin

* [SELECT statement](/docs/sql-guide/statements/statement-select)
* [BULK INSERT statement](/docs/sql-guide/statements/statement-insert-bulk)
* [SETQ data type](/docs/sql-guide/data-types/data-type-set-setq)

## Syntax

```sql
TUPLE ([@<map-position>,...] | [<column-name>,... ])
```
<!-- original syntax
TUPLE(expr1,expr2,...)
-->

## Arguments

| Argument | Description | Required | Additional information |
|---|---|---|---|
| `@<map-position>,...` | Used with `BULK INSERT` statements in the `TRANSFORM` clause to combine two or more values represented in the `MAP` clause |  | [BULK INSERT...MAP]() |
| `<column-name>,...` | Used in a `SELECT` statement to combine values from one or more columns in a given table |

## Returns

| Data type | Value |
|---|---|---|
| `TUPLE` | tuple with an element per evaluated expression `(eval_expr1,eval_expr2,...)` |

{% include /sql-guide/setq-tuple-returns.md %}

## Examples

{% include /sql-guide/create-table-tuple-demo-eg.md %}

{% include /sql-guide/insert-bulk-transform-tuple-eg.md %}

{% include /sql-guide/select-with-tuple-eg.md %}
