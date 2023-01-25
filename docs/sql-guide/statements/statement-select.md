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
  TOP-clause
  SELECT-list
  SELECT-item
  FROM-clause
  [TABLE-clause | SUBQUERY-clause]
```

## Arguments

| Argument | Description | Required |
|---|---|---|
| `DISTINCT` | Optional keyword that specifies only unique rows exist in the output |  |

| `select_item` | named item to select
| `*` | Wildcard that represents all columns in a table |  |
| `qualifier.*` | limits wildcard to columns for the specified qualifier |  |
| `expr` | Any constant, function or combination thereof joined by operators, or a subquery |  |
| FROM | Specifies which relations to select data from |
| identifier |  |  |
| table_valued_function |  |  |
| table_alias |  |  |
| shards (integer_literal) |  |  |
| select_stmnt | nested select statement |  |
| table_alias |  |  |
| WHERE expr |  |  |
| GROUP BY col_expr |  |  |
| HAVING expr |  |  |
| ORDER BY expr |  |  |

## TOP-clause
![expr](/assets/images/sql-guide/top_clause.svg)

```

```

| Argument | Description | Required |
|---|---|---|
| `top(expr)` | Specify the number of records to return.  |  |
| `topn(expr)` |  |  |
| `expr` | String literal expression used in TOP clause |  |

## SELECT-list

![expr](/assets/images/sql-guide/select_list.svg)

```

```

| Argument | Description | Required |
|---|---|---|

## SELECT-item

![expr](/assets/images/sql-guide/select_item.svg)

```

```


| Argument | Description | Required |
|---|---|---|


## FROM-clause

![expr](/assets/images/sql-guide/from_clause.svg)

```

```

| Argument | Description | Required |
|---|---|---|


## TABLE or SUBQUERY

![expr](/assets/images/sql-guide/table_or_subquery.svg)

```

```

| Argument | Description | Required |
|---|---|---|

The _table_or_subquery_ expression can be:

- a _table_name_ or _table_valued_function_
- a parenthesized _select_statement_

both of these expressions can be aliased with a _table_alias_

## TABLE OPTION


![expr](/assets/images/sql-guide/table_option.svg)

The SHARDS option allows you to specify against with shards the query will run.


## where_clause

![expr](/assets/images/sql-guide/where_clause.svg)

The WHERE clause specifies a filter condition for the rows returned by the query. The _expr_ defines the condition to be met for a row to be returned. It can be any constant, function or combination thereof joined by operators, or a subquery

### group_by_clause

![expr](/assets/images/sql-guide/group_by_clause.svg)

The GROUP BY clause seperates the query result into groups of rows allowing aggregates to be performed on each group.

_column_expr_ specifies a column or a non-aggregate calculation on a column. The column must exist in the FROM clause of the SELECT statement, but is not required to appear in the SELECT list.  If a column is referenced in a non-aggregated expression in the SELECT list, it must appear in the GROUP BY list.

### having_clause

![expr](/assets/images/sql-guide/having_clause.svg)

### order_by_clause

![expr](/assets/images/sql-guide/order_by_clause.svg)
![expr](/assets/images/sql-guide/order_by_expression.svg)

The ORDER BY clause allows specification of the order that data is returned. It is a list of _order_by_expression_ that specify a column name or column alias or a column position in the SELECT list and whether the order is ASC or DESC.
