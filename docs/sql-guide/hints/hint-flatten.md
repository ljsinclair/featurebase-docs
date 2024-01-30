---
title: FLATTEN()
layout: default
parent: SQL hints
grand_parent: SQL guide
---

# FLATTEN() hint

{% include /sql-guide/datatype-set-setq-summary.md %}

{% include /sql-guide/select-set-setq-unexpected-results.md %}

The `FLATTEN()` hint overcomes this issue.

## Before you begin

* [SQL SELECT statement](/docs/sql-guide/statements/statement-select)
* [SET and SETQ data types](/docs/sql-guide/data-types/data-types-home/#low-cardinality-data-types)

## Syntax

```sql
  (FLATTEN(<colname>))
```

## Arguments

| Argument | Description | Data type | Required? |
|---|---|---|---|
| `<colname>` | `SET` or `SETQ` column | [SET or SETQ](/docs/sql-guide/data-types/data-types-home/#low-cardinality-data-types) | Yes |

## Returns

Individual values are returned from the specified column based on the source data type

| Source column type | Returned data type |
|---|---|
| IDSET/IDSETQ | ID (unsigned integer) |
| STRINGSET/STRINGSETQ | String |

## Additional information

{% include /sql-guide/issue-select-set-setq-link.md%}

## Examples

<!-- replace with all-datatypes-->

```sql
CREATE TABLE demo-table (_id id, hobby stringset, income int);

INSERT INTO demo-table VALUES
  (0, ['running', 'biking', 'swimming'], 80000),
  (1, ['biking'], 100000);
```

A `SELECT` query returns:

```sql
SELECT * FROM demo-table;
 _id | hobby                             | income
-----+-----------------------------------+--------
   0 | ['running', 'biking', 'swimming'] |  80000
   1 | ['biking']                        | 100000
```

### Unexpected results

Both queries return results based on the number of fields, rather than the results themselves.

```sql
SELECT hobby, sum(income) FROM demo-table GROUP BY hobby;
 hobby                             |        
-----------------------------------+--------
 ['biking']                        | 100000
 ['running', 'biking', 'swimming'] |  80000
```

```sql
SELECT COUNT(DISTINCT hobby) FROM demo-table;
```

### Expected results

Use the `FLATTEN()` hint to return expected results.

```sql
SELECT hobby, sum(income) FROM demo-table WITH (flatten(hobby)) GROUP BY hobby;
```

```sql
SELECT COUNT(DISTINCT hobby) FROM demo-table WITH (FLATTEN(hobby));
```
