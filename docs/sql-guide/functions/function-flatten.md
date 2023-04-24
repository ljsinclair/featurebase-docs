---
title: FLATTEN()
layout: default
parent: SQL functions
grand_parent: SQL guide
---

# FLATTEN() function

The `FLATTEN()` function is used when a query wants to get distinct or group on individual members of [IDSET](/docs/sql-guide/data-types/data-type-idset) and [STRINGSET](/docs/sql-guide/data-types/data-type-stringset) columns

## Syntax

```
flatten(column)
```

## Arguments

| Argument | Data type | Description | Required? | Further information |
|---|---|---|---|---|
| `column` | IDSET/STRINGSET | [IDSET](/docs/sql-guide/data-types/data-type-idset) and [STRINGSET](/docs/sql-guide/data-types/data-type-stringset) columns | Yes | This should only be used with `GROUP BY` queries |

## Returns

| Data type | Value |
|---|---|
| `ID`/`STRING` | individual values of passed column |

## Additional information

The `flatten` function can only be used in:
* The [WITH clause](/docs/sql-guide/statements/statement-select/#with_clause)
* `SELECT...WITH...GROUP BY` queries
* `SELECT DISTINCT...` queries
* This only supports one input
* Cannot support additional inputs in DISTINCT/GROUP BY
* Only works with tables (no subqueries)


## Examples

### STRINGSET with flatten() that counts individual values
```sql
create table segments  
    (_id id, segment stringset);  

insert into segments(_id, segment)  
    values (1, ['RED', 'BLUE', 'GREEN']), 
      (2, ['GREEN']),
      (3, ['RED', 'BLUE', 'GREEN']);

select count(*) as cnt, segment from segments
WITH (flatten(segment))
group by segment;

 cnt | segment
-----+-----------
   2 | ['RED']
   2 | ['BLUE']
   3 | ['GREEN']
```

### STRINGSET without flatten() that counts combinations of values

```sql
create table segments  
    (_id id, segment stringset);  

insert into segments(_id, segment)  
    values (1, ['RED', 'BLUE', 'GREEN']), 
      (2, ['GREEN']),
      (3, ['RED', 'BLUE', 'GREEN']);

select count(*) as cnt, segment from segments
group by segment;

 cnt | segment
-----+--------------------------
   2 | ['RED', 'BLUE', 'GREEN']
   1 | ['GREEN']
```