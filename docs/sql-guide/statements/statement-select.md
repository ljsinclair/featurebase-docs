---
title: SELECT
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 1
---

# SELECT statement

Selects data from a FeatureBase table.

## BNF diagrams

![expr](/assets/images/sql-guide/select_stmt.svg)
![expr](/assets/images/sql-guide/top_clause.svg)
![expr](/assets/images/sql-guide/select_list.svg)
![expr](/assets/images/sql-guide/select_item.svg)
![expr](/assets/images/sql-guide/from_clause.svg)


## DDL Syntax

```
SELECT
  [DISTINCT]
  [TOP | TOPN](expr)
  [
    [select_item [ * | qualifier.* ],...
    [expr [as [column_alias]]]
  ]
  FROM
    [identifier | table_valued_function
      [[AS] | [table_alias | Shards (integer_literal,...)]]
    ] |
    [(select_stmt)
      [[AS] [table_alias]]
    ]
  [WHERE expr]
  [GROUP BY column expr,...]
  [HAVING expr]
  [ORDER BY order_by_expr[asc | desc],...]
  ]
```

## Arguments

| Argument | Description | Required |
|---|---|---|
| `DISTINCT` | Optional keyword that specifies only unique rows exist in the output |  |
| `top(expr)` | Specify the number of records to return.  |  |
| `topn(expr)` |  |  |
| `expr` | String literal expression used in TOP clause |  |
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

## Additional information

## select_list

* You can use a column_alias for items in the select list




The FROM clause specifies which relations to select data from. It is a list of _table_or_subquery_ expressions.

### table_or_subquery

![expr](/assets/images/sql-guide/table_or_subquery.svg)

The _table_or_subquery_ expression can be:

- a _table_name_ or _table_valued_function_
- a parenthesized _select_statement_

both of these expressions can be aliased with a _table_alias_

### table_option

![expr](/assets/images/sql-guide/table_option.svg)

The SHARDS option allows you to specify against with shards the query will run.

### where_clause

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
