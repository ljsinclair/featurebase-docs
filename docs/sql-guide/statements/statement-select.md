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

## DDL Syntax

```
SELECT
  DISTINCT
  top_clause
  select_list
  from_clause
  where_clause
  group_by_clause
  having_clause
  order_by_clause;
```

## Arguments

| Argument | Description | Required | Further information |
|---|---|---|---|
| `DISTINCT` | Optional keyword that specifies only unique rows exist in the output |  |
| top_clause | specifies that a limit is applied to the number of rows returned in the output. the expr used in the TOP clause must be an integer literal. | No |  |
| select_list | A series of expressions separated by commas contains the items selected to form the output result set. | Yes | [SELECT_list](/statement-select#select_list) |
| from_clause | Specifies which relations to select data from. It is a list of table_or_subquery expressions. | [FROM clause](/statement-select#from-clause) |
| where_clause | An expression that defines a filter condition for the rows returned by the query. Can be any constant, function or combination joined by operators or a subquery. | Yes |  |
| group_by_clause | Separates the results into groups of rows allowing aggregates to be performed on each group. | Optional | [GROUP_BY clause](/statement-select#group-by-clause) |
| having_clause |  |  |  |
| order_by_clause | Comma-separated column name, column alias or column position in the SELECT list used to specify the order data is returned. | Results can be ordered `ASC`ending or `DESC`ending. |

## Additional information

### select_list

![expr](/assets/images/sql-guide/select_list.svg)
![expr](/assets/images/sql-guide/select_item.svg)

* `*` wildcard represents all columns
* `<qualifier>.*` limits the results to all columns based on the specified qualifier
* `expr` can be any constant, function or combination thereof joined by operators, or a subquery
* Items in the select_list can be aliased with a column_alias
* Any column referenced in a non-aggregated expression in the select_list must also appear in the group_by list

### from_clause

![expr](/assets/images/sql-guide/from_clause.svg)
![expr](/assets/images/sql-guide/table_or_subquery.svg)

The table_or_subquery expression can be:
* a table_name or table_valued_function
* a parenthesized `SELECT` statement
Both expressions can be aliased with a table_alias

![expr](/assets/images/sql-guide/table_option.svg)

The SHARDS option allows you to specify against with shards the query will run.

### group_by_clause

![expr](/assets/images/sql-guide/group_by_clause.svg)

`column_expr` specifies a column or non-aggregate calculation on a column which:
* must exist in the from_clause
* is not required to appear in the select_list

A column must appear in the group_by_list if it is referenced in a non-aggregated expression in the select_list

## Examples

```sql
SELECT COUNT(*) FROM github-stats;
```

```sql
SELECT TOP(10) * FROM github-stats;
```
