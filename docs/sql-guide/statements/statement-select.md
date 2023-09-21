---
title: SELECT
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 7
---

# SELECT statement
{: .no_toc }

Returns data from FeatureBase tables based on specified rows, columns and clauses.

{% include page-toc.md %}

## BNF diagrams

![expr](/assets/images/sql-guide/select_stmt.svg)

### TOP clause

![expr](/assets/images/sql-guide/top_clause.svg)

### SELECT list
![expr](/assets/images/sql-guide/select_list.svg)
![expr](/assets/images/sql-guide/select_item.svg)

### FROM clause
![expr](/assets/images/sql-guide/from_clause.svg)
![expr](/assets/images/sql-guide/table_or_subquery.svg)
![expr](/assets/images/sql-guide/table_option.svg)

### WHERE clause

![expr](/assets/images/sql-guide/where_clause.svg)

### GROUP BY clause

![expr](/assets/images/sql-guide/group_by_clause.svg)

### HAVING clause

![expr](/assets/images/sql-guide/having_clause.svg)

### ORDER BY clause

![expr](/assets/images/sql-guide/order_by_clause.svg)
![expr](/assets/images/sql-guide/order_by_expression.svg)

## Syntax

```sql
SELECT
  [DISTINCT]
  [<top_clause>]
  {<select_list>}
  {<from_clause>}
  [<where_clause>]
  [<group_by_clause>]
  [<having_clause>]
  [<order_by_clause>];
```

## Arguments

| Argument | Description | Required | Additional information |
|---|---|---|---|
| `DISTINCT` | Keyword that specifies only unique rows exist in the output | Optional | * [DISTINCT additional](#distinct-additional)<br/>* [SELECT...flatten hint](/docs/sql-guide/hints/hint-flatten) |
| top_clause | Specify a limit to apply to the number of rows returned in the output. | Optional | Requires integer literal |
| select_list | A series of expressions separated by commas that contains the items selected to form the output result set. | Yes | [SELECT list and GROUP BY clause](#select-list-and-group-by-clause) |
| from_clause | A list of table or subquery expressions that specify which relations to select data from. | Yes | [FROM table or subquery expression](#from-table-or-subquery) |
| from...with | A list of table query hints | Optional for table queries | [Query hints](/docs/sql-guide/hints/hints-home) |
| where_clause | An expression that defines a filter condition for the rows returned by the query. | Optional | * [`<expr>` filter conditions](#expr-filter)<br/>* [SELECT...flatten hint](/docs/sql-guide/hints/hint-flatten) |
| group_by_clause | Separates the results into groups of rows allowing aggregates to be performed on each group. | Optional | [SELECT...flatten hint](/docs/sql-guide/hints/hint-flatten) |
| column_expr | Specify a column or non-aggregate calculation on a column which is not required to appear in the select_list | Must exist in the from_clause |  |
| having_clause | Pass aggregates to filter on based on conditions. | Optional | [`<expr>` filter conditions](#expr-filter) |
| order_by_clause | Comma-separated column name, column alias or column position in the SELECT list used to specify the order data is returned. | Optional | [Ordering results](#ordering-results) |

## Additional information

### DISTINCT additional

`DISTINCT` can return two kinds of results:

| DISTINCT | Description | Examples |
|---|---|---|
| Values | A query that returns `DISTINCT` values from a table | [SELECT DISTINCT](#select-distinct) |
| Sets | A query that returns a specific array of values from `SET` or `SETQ` data type columns | [Flatten hint](/docs/sql-guide/hints/hint-flatten) |

## `<expr>` filter

`<expr>` can be used in the <select_list> and clauses:

* TOP
* WHERE
* HAVING

`<expr>` can include:

| Filter | Description | Additional information |
|---|---|---|
| Subquery | A SELECT query that is run to obtain specific results required for the main query |  |
| Constant | A literal or scalar value | Can be joined by a subquery or [SQL operators](/docs/sql-guide/operators/operators-home) or subquery |
| Function | [FeatureBase SQL functions](/docs/sql-guide/functions/functions-home) | Can be joined by a subquery or [SQL operators](/docs/sql-guide/operators/operators-home) or subquery |

### SELECT list and GROUP BY clause

SELECT LIST Columns referenced in non-aggregate expressions must also appear in the GROUP BY clause.

### SELECT...LIKE wildcards

Wildcards are used with the `LIKE` clause.

| Wildcard | Description | Additional information |
|---|---|
| `*` | All columns |  |
| <column_alias> | Select List column alias |  |
| `expr` | Filter used to refine the query | [`<expr>` filter](#expr-filter) |
| `<qualifier>.*` | limit the results to all columns based on the specified qualifier |  |

### SELECT with TUPLE() function

When the `TUPLE()` function is used in a `select_list`, the following values are returned:

{% include /sql-guide/setq-tuple-returns.md %}

### FROM table or subquery

The table_or_subquery expression can be:
* a table_name or table_valued_function
* a parenthesized `SELECT` statement

Both expressions can be aliased with a `<table_alias>`

#### Arguments

| Argument | Description |
|---|---|
| col_name | Column name

## Examples

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

### GROUP BY with STRINGSET

This query that counts combinations of values from the `segments` table.

{: .note}
This query can also be run using the [FLATTEN() hint](/docs/sql-guide/hints/hint-flatten)

{% include /sql-guide/table-create-segments-eg.md %}

```sql
select count(*) as cnt, segment from segments
group by segment;

 cnt | segment
-----+--------------------------
   2 | ['RED', 'BLUE', 'GREEN']
   1 | ['GREEN']
```

{: .note}
This query can also be performed using the [`flatten` hint](/docs/sql-guide/hints/hint-flatten/#group-by-with-flatten)

### SELECT statement with wildcard

{% include /sql-guide/select-wildcard.md %}

### SELECT with cosine_distance

{% include /sql-guide/select-cosine-distance.md %}

### SELECT with two RANGEQ() timestamps

{% include /sql-guide/select-from-stringsetq-timeq.md %}

### SELECT with one RANGEQ() timestamp

{% include /sql-guide/select-from-stringsetq-timeq-one-arg.md %}

{% include /sql-guide/create-table-tuple-demo-eg.md %}

{% include /sql-guide/select-with-tuple-eg.md %}

## Further information

* [SQL statement wildcards](https://www.w3schools.com/sql/sql_wildcards.asp){:target="_blank"}
