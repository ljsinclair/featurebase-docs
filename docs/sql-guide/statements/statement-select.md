---
title: SELECT
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 7
---

# SELECT statement

Selects data from a FeatureBase table.

## BNF diagrams

![expr](/assets/images/sql-guide/select_stmt.svg)

### top_clause
![expr](/assets/images/sql-guide/top_clause.svg)

### select_list
![expr](/assets/images/sql-guide/select_list.svg)
![expr](/assets/images/sql-guide/select_item.svg)

### from_clause
![expr](/assets/images/sql-guide/from_clause.svg)
![expr](/assets/images/sql-guide/table_or_subquery.svg)
![expr](/assets/images/sql-guide/table_option.svg)

### where_clause
![expr](/assets/images/sql-guide/where_clause.svg)

### group_by_clause
![expr](/assets/images/sql-guide/group_by_clause.svg)

### having_clause
![expr](/assets/images/sql-guide/having_clause.svg)

### order_by_clause
![expr](/assets/images/sql-guide/order_by_clause.svg)
![expr](/assets/images/sql-guide/order_by_expression.svg)

## Syntax

```
SELECT
  [DISTINCT]
  [<top_clause>]
  {<select_list>}
  {<from_clause>}
  {<where_clause>}
  [<group_by_clause>]
  [<having_clause>]
  [<order_by_clause>];
```

## Arguments

| Argument | Description | Required | Further information |
|---|---|---|---|
| `DISTINCT` | Keyword that specifies only unique rows exist in the output | Optional |  |
| top_clause | Specify a limit to apply to the number of rows returned in the output. | No | The `expr` used in the TOP clause must be an integer literal. |
| select_list | A series of expressions separated by commas contains the items selected to form the output result set. | Yes | [select_list](#select_list-information) |
| from_clause | A list of table_or_subquery expressions that specify which relations to select data from. `WITH`is an optional parenthesized list of query hints that can only be used with a table. Query hints tell queries how to access data in a table. | Yes | [from_clause](#from_clause-information) |
| where_clause | An expression that defines a filter condition for the rows returned by the query. | Yes | Can be any constant, function or combination joined by operators or a subquery. |
| group_by_clause | Separates the results into groups of rows allowing aggregates to be performed on each group. | Optional | [group_by_clause](#group_by_clause-information) |
| having_clause | Pass aggregates to filter on based on conditions. | Optional |  |
| order_by_clause | Comma-separated column name, column alias or column position in the SELECT list used to specify the order data is returned. | Optional | Results can be ordered `ASC`ending or `DESC`ending. |

## Additional information

### select_list information

![expr](/assets/images/sql-guide/select_list.svg)
![expr](/assets/images/sql-guide/select_item.svg)

* `*` wildcard represents all columns
* `<qualifier>.*` limits the results to all columns based on the specified qualifier
* `expr` can be any constant, function or combination thereof joined by operators, or a subquery
* Items in the select_list can be aliased with a column_alias
* Any column referenced in a non-aggregated expression in the select_list must also appear in the group_by list

### from_clause information

![expr](/assets/images/sql-guide/from_clause.svg)
![expr](/assets/images/sql-guide/table_or_subquery.svg)
![expr](/assets/images/sql-guide/table_option.svg)

The table_or_subquery expression can be:
* a table_name or table_valued_function
* a parenthesized `SELECT` statement

Both expressions can be aliased with a table_alias

#### WITH

`WITH`is an optional parenthesized list of query hints that can only be used with a table (not a subquery). Query hints tell queries how to access data in a table. Flatten is the only supported hint currently. 


#### flatten() hint

The `flatten()` hint is used when a query wants to get distinct or group on individual members of [IDSET](/docs/sql-guide/data-types/data-type-idset) and [STRINGSET](/docs/sql-guide/data-types/data-type-stringset) columns

The `flatten()` function can only be used:
* in `SELECT...WITH...GROUP BY` queries
* in `SELECT DISTINCT...` queries
* with one input argument that matches the sole `DISTINCT`/`GROUP BY` column

#### flatten() syntax

```
flatten(column)
```

#### flatten() arguments

| Argument | Data type | Description | Required? | Further information |
|---|---|---|---|---|
| `column` | IDSET/STRINGSET | [IDSET](/docs/sql-guide/data-types/data-type-idset) and [STRINGSET](/docs/sql-guide/data-types/data-type-stringset) columns | Yes | This should only be used with `GROUP BY` queries |

#### flatten() returns

| Data type | Value |
|---|---|
| `ID`/`STRING` | individual values of passed column |

### group_by_clause information

![expr](/assets/images/sql-guide/group_by_clause.svg)

`column_expr` specifies a column or non-aggregate calculation on a column which:
* must exist in the from_clause
* is not required to appear in the select_list

A column must appear in the group_by_clause if it is referenced in a non-aggregated expression in the select_list

### Wildcards

Wildcards are used with the `LIKE` clause.

* [SQL statement wildcards](https://www.w3schools.com/sql/sql_wildcards.asp){:target="_blank"}

## Examples

### SELECT statement with wildcard

```sql
SELECT * FROM services WHERE servicelist LIKE '%free%';
```

### SELECT COUNT

```sql
SELECT COUNT(*) FROM github-stats;
```

### SELECT TOP

```sql
SELECT TOP(10) * FROM github-stats;
```

### Point SELECT

```sql
SELECT * FROM tbl WHERE _id = 1
SELECT fld1, fld2 FROM tbl WHERE _id = 1
SELECT _id, fld FROM tbl WHERE _id = 1
```

### SELECT DISTINCT

```sql
SELECT DISTINCT fld FROM tbl
```

### SELECT COUNT

```sql
SELECT count(*) FROM tbl
SELECT count(*) FROM tbl WHERE fld = 1
SELECT count(*) FROM tbl WHERE fld1 = 1 AND fld2 = 2
SELECT count(distinct fld) FROM tbl
```

### SELECT ids FROM segment
```sql
SELECT _id FROM tbl WHERE fld = 1
SELECT _id FROM tbl WHERE fld in (1, 2)
SELECT _id FROM tbl WHERE fld1 = 1 LIMIT 1
SELECT _id FROM tbl WHERE fld1 = 1 AND fld2 = 2
```

### SELECT int function

```sql
SELECT min(fld) FROM tbl
SELECT max(fld) FROM tbl
SELECT sum(fld) FROM tbl
SELECT avg(fld) FROM tbl
SELECT min(fld) FROM tbl WHERE fld = 1
SELECT max(fld) FROM tbl WHERE fld = 1
SELECT sum(fld) FROM tbl WHERE fld = 1
SELECT avg(fld) FROM tbl WHERE fld = 1
```

### GROUP BY

```sql
SELECT fld, count(*) FROM tbl GROUP BY fld
SELECT fld1, fld2, count(*) FROM tbl GROUP BY fld1, fld2
SELECT fld1, fld2, count(*) FROM tbl GROUP BY fld1, fld2 LIMIT 1
SELECT fld1, fld2, count(*) FROM tbl WHERE fld1 = 1 GROUP BY fld1, fld2
SELECT fld1, count(*) FROM tbl GROUP BY fld1 having count(*) > 1
SELECT fld1, fld2, sum(fld3) FROM tbl WHERE fld1 = 1 GROUP BY fld1, fld2
SELECT fld1, fld2, sum(fld3) FROM tbl WHERE fld1 = 1 GROUP BY fld1, fld2 having count(*) > 1
SELECT fld, count(fld) FROM tbl GROUP BY fld
SELECT fld1, count(fld1) FROM tbl WHERE fld2=1 GROUP BY fld1
```

### GROUP BY with STRINGSET without flatten() that counts combinations of values example

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

### GROUP BY with flatten() that counts individual values example
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

