---
title: SELECT
layout: default
parent: Statements
grand_parent: SQL guide
---

# SELECT statement

Selects data from a FeatureBase table.

## BNF diagrams

![expr](/assets/images/sql-guide/select_stmt.svg)
![expr](/assets/images/sql-guide/top_clause.svg)
![expr](/assets/images/sql-guide/select_list.svg)
![expr](/assets/images/sql-guide/select_item.svg)
![expr](/assets/images/sql-guide/from_clause.svg)
![expr](/assets/images/sql-guide/table_or_subquery.svg)
![expr](/assets/images/sql-guide/table_option.svg)
![expr](/assets/images/sql-guide/where_clause.svg)
![expr](/assets/images/sql-guide/group_by_clause.svg)
![expr](/assets/images/sql-guide/having_clause.svg)
![expr](/assets/images/sql-guide/order_by_clause.svg)
![expr](/assets/images/sql-guide/order_by_expression.svg)

## DDL Syntax

```
SELECT
  DISTINCT
  TOP_clause
  SELECT_list
  FROM_clause
  WHERE_clause
  GROUP_BY_clause
  HAVING_clause
  ORDER_BY_clause
```

## Arguments

| Argument | Description | Required | Further information |
|---|---|---|---|
| `DISTINCT` | Optional keyword that specifies only unique rows exist in the output |  |
| TOP_clause | specifies that a limit is applied to the number of rows returned in the output. the expr used in the TOP clause must be an integer literal. | No |  |
| SELECT_list | A series of expressions separated by commas contains the items selected to form the output result set. | Yes | [SELECT_list](/statement-select#select_list) |
| FROM_clause | Specifies which relations to select data from. It is a list of table_or_subquery expressions. | [FROM clause](/statement-select#from-clause) |
| WHERE_clause | An expression that defines a filter condition for the rows returned by the query. Can be any constant, function or combination joined by operators or a subquery. | Yes |  |
| GROUP_BY_clause | Separates the results into groups of rows allowing aggregates to be performed on each group. | Optional | [GROUP_BY clause](/statement-select#group-by-clause) |
| HAVING_clause |
| ORDER_BY_clause | Comma-separated column name, column alias or column position in the SELECT list used to specify the order data is returned. | Results can be ordered `ASC`ending or `DESC`ending. |

## Additional information

### SELECT_list

![expr](/img/sql/select_list.svg)
![expr](/img/sql/select_item.svg)

* `*` wildcard represents all columns
* `<qualifier>.*` limits the results to all columns based on the specified qualifier
* `expr` can be any constant, function or combination thereof joined by operators, or a subquery
* Items in the `select_list` can be aliased with a column_alias

### FROM_clause

![expr](/img/sql/from_clause.svg)
![expr](/img/sql/table_or_subquery.svg)

The table_or_subquery expression can be:
* a table_name or table_valued_function
* a parenthesized `SELECT` statement
Both expressions can be aliased with a table_alias

![expr](/img/sql/table_option.svg)

The SHARDS option allows you to specify against with shards the query will run.

### GROUP_BY clause

![expr](/img/sql/group_by_clause.svg)

`column_expr` specifies a column or non-aggregate calculation on a column which:
* must exist in the SELECT...FROM clause
* is not required to appear in the SELECT list

A column must appear in the GROUP_BY list if it is referenced in a non-aggregated expression in the SELECT list

## Examples

```sql
SELECT COUNT(*) FROM github-stats;
```

```sql
SELECT TOP(10) * FROM github-stats;
```
