---
title: SET
layout: default
parent: Functions
grand_parent: SQL guide
---

# SET functions

SET functions test for one or more values within a `SET` or `SETQ` column.

## Before you begin

* [SET and SETQ data types](/docs/sql-guide/data-types/data-type-set-setq)
* [SELECT statement](/docs/sql-guide/statements/statement-select)
* [FeatureBase operators](/docs/sql-guide/operators/operators-home)

## Syntax

```sql
SET{CONTAINS[ANY | ALL] | EXCLUDES}(<set-column>,<value>)
```

## Arguments

| Argument | Description | Additional information |
|---|---|---|
| `SETCONTAINS` | Test for a value found in `<set-column>` |  |
| `SETCONTAINSANY` | Test for **any** values found in `<set-column>` | Values must be comma-separated and grouped within square brackets `[...]` |
| `SETCONTAINSALL` | Test for **all** supplied values found in `<set-column>` | Values must be comma-separated and grouped within square brackets `[...]` |
| `SETEXCLUDES` | Test a `<value>` **is not** found in `<set-column>` |  |
| `<set-column>` | `SET` or `SETQ` column name | [`SET` and `SETQ` data types](/docs/sql-guide/data-types/data-type-set-setq) |
| `<value>` | `ID` or `STRING` literal value | * [ID data type](/docs/sql-guide/data-types/data-type-id)<br/>* [STRING data type](/docs/sql-guide/data-types/data-type-string) |

## Additional information

### Function operators

`SET` functions work with `AND` and `OR` logical operators

{% include /sql-guide/note-operator-logic-wrong.md %}

## Returns

Values returned depend on the position of the `SET` function within the `SELECT` query:

| Position | Returns | Example | Additional information |
|---|---|---|---|
| Within `<select-list>` | True or False | `SELECT <set-function> (<set-column>, <value>) FROM <table-name>;` | [SELECT list](/docs/sql-guide/statements/statement-select/#select-list) |
| Within `WHERE` clause | Row | `SELECT * FROM <table-name> WHERE <set-function> (<set-column>,<set-value>)` | [WHERE clause](/docs/sql-guide/statements/statement-select/#where-clause) |

## Examples

{% include /sql-guide/create-table-segments.md %}

### Testing set membership in the select list

This query returns `true`.

```sql
SELECT SETEXCLUDES(segment, 'purple')
  AS NOTPURPLE
  FROM segments;  
```

### Testing set membership as a where clause filter

This query returns `true`

```sql
SELECT _id FROM segments WHERE
  SETEXCLUDES(segment, 'purple');
```

### Testing set membership as a where clause filter with multiple set members

This query returns `true` with the selected `_id`.

```sql
SELECT _id FROM segments WHERE
  SETEXCLUDES(segment, 'purple') AND
  SETEXCLUDES(segment, 'yellow');
```

## Further information

* [SET functions](/docs/sql-guide/functions/function-set)
* [RANGE function](/docs/sql-guide/functions/function-rangeq)
