---
title: DROP DATABASE
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 4
---

# DROP DATABASE statement

Drops the specified database.

## BNF diagram

![expr](/assets/images/sql-guide/drop_db.svg)

## Syntax

```sql
DROP DATABASE database_name;
```

## Arguments

| Argument | Data type | Description | Required |
|---|---|---|---|
| `database_name` | string | Name of the database to delete | yes |

## Example

```sql
DROP DATABASE test_db;
```
