---
title: Running SQL queries
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 4
---

# How do I run SQL queries with FBSQL?

Valid SQL queries can be run directly in the FBSQL interface or via defined files.

{: .note}
You can also run SQL from a file when you connect to a database.

## Before you begin

* [Install FBSQL](/docs/tools/fbsql/fbsql-install)
* Connect to a database:
  * [Connect to a Cloud database](/docs/tools/fbsql/fbsql-connect-cloud-db)
  * [Connect to a Community database](/docs/tools/fbsql/fbsql-connect-community-db)
* [SQL Guide](/docs/sql-guide/sql-guide-home)

{% include /fbsql/fbsql-help-quit.md %}

## Syntax

```
(\[
    [ c|connect <cloud-database-name> ] |
    [
      [ d[<tablename> | t | v] ] |
      [ l|list ]
    ]
    [ t|timing [on|off] ]
    [ i|include <filename.sql> ] |
  ]

  (<sql-statement>)
```

## Arguments


| Argument | Description | Default | Additional information |
|---|---|---|---|
| `c <cloud-database-name>`<br/>`connect <cloud-database-name>` | Connect to a valid database in the current connection |  | [Connect cloud database additional](#connect-cloud-database-additional) |
| `d` | Equivalent to Cloud `SHOW DATABASE` statement |  | [SHOW DATABASE](/docs/sql-guide/statements/statement-database-show) |
| `d <tablename>` | Equivalent to `SHOW COLUMNS` statement |  | [SHOW COLUMNS](/docs/sql-guide/statements/statement-columns-show) |
| `dt` | Equivalent to `SHOW TABLES` statement |  | [SHOW TABLES](/docs/sql-guide/statements/statement-table-show) |
| `dv` | Show definition of all views |  | [CREATE VIEWS](/docs/sql-guide/statements/statement-view-create) |
| `l`<br/>`list` | List databases in Cloud connection. |  |  |
| `i <filename.sql>`<br/>`include <filename.sql>` | Run SQL statements from file |  | Equivalent to `fbsql --file` command |
| `\timing` | Toggle time SQL statement takes to execute | off |  |
| `<sql-statement>` | Valid SQL statements |  | [SQL Guide](/docs/sql-guide/sql-guide-home) |

## Additional information

### Cloud database connect additional

{% include /fbsql/fbsql-db-connect-same.md %}

A FeatureBase cloud database connection is required to use `\c`:
* [Connect to a Cloud database](/docs/tools/fbsql/fbsql-connect-cloud-db)
* [Connect to a Community database](/docs/tools/fbsql/fbsql-connect-community-db)

## Examples

### Table definition and INSERT statements

The following statements can be run direct from the FBSQL interface or saved to a file.

```sql
CREATE TABLE people (_id id, name string, age int);
INSERT INTO people VALUES (1, 'Amy', 42), (2, 'Bob', 27), (3, 'Carl', 33);
```

### Connect to database then Run SQL from file

### Run SQL statement from FBSQL interface

```sql
select * from people;
```

### Run SQL from file using meta command

Create `select_all_people.sql`:
```tex
select * from people;
```

Run the SQL from the file in the FBSQL interface
```sql
\include select_all_people.sql
```

### Results for both methods

```
 _id | name | age
-----+------+-----
   1 | Amy  |  42
   2 | Bob  |  27
   3 | Carl |  33
```
