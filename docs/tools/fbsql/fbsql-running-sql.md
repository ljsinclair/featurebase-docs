---
title: Running SQL queries
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 4
---

# How do I run SQL queries with FBSQL?

Valid SQL queries can be run directly in the FBSQL interface and via files in accessible directories.

{: .note}
You can also run SQL from a file when you connect to a database.

This reference explains FBSQL flags relating to database connections and schema

## Before you begin

* [Install FBSQL](/docs/tools/fbsql/fbsql-install)
* Connect to a database:
  * [Connect to a Cloud database](/docs/tools/fbsql/fbsql-connect-cloud-db)
  * [Connect to a Community database](/docs/tools/fbsql/fbsql-connect-community-db)

{% include /fbsql/fbsql-help-quit.md %}

## Syntax

```
<meta-flag-prefix>
  [
    [ c|connect [ <cloud-database-name> | - ] ] |
    [
      [ d[<tablename> | t | v] ] |
      [ l|list ]
    ]
    [ t|timing [on|off] ]
    [ i|include <filename.sql> ] |
    [ w|watch <second-val> ] |
  <query-output-flags> |
  <set-variables-flags> |
]
<sql-query>

```

{% include /fbsql/fbsql-meta-flag-prefix.md %}

## Database flags

| Argument | Description | Default | Additional information |
|---|---|---|---|
| `c <cloud-database-name>`<br/>`connect <cloud-database-name>` | Connect to an available database in the currently connected cloud account. |  | [Connect cloud database additional](#connect-cloud-database-additional) |
| `c -` <br/> `connect -` | Disconnect from the current cloud database |  |  |
| `d` | List all tables in the connected database. Equivalent to Cloud `SHOW DATABASE` statement |  | [SHOW DATABASE](/docs/sql-guide/statements/statement-database-show) |
| `d <tablename>` | Equivalent to `SHOW COLUMNS` statement |  | [SHOW COLUMNS](/docs/sql-guide/statements/statement-columns-show) |
| `dt` | Equivalent to `SHOW TABLES` statement |  | [SHOW TABLES](/docs/sql-guide/statements/statement-table-show) |
| `dv` | Show definition of all views |  | [CREATE VIEWS](/docs/sql-guide/statements/statement-view-create) |
| `l`<br/>`list` | List databases in connected Cloud database |  |  |
| `timing` | Toggle time SQL statement takes to execute | off |  |
| `watch <second-val>` | Interval of <second-val> to repeat query in buffer or in history until manual break or fails |  |

## File flags

| Flag | Description | Additional information |
|---|---|---|
| * `i <filename.sql>`<br/>* `include <filename.sql>` | Run SQL statements from file | Equivalent to `fbsql --file` command |
| `file <filename> [<alias>]` | Create alias for filename to use in SQL queries | [Filename alias examples](#create-filename-aliases) |

## Query output flags

* [FBSQL query output](/docs/tools/fbsql/fbsql-config-output) |

## Set variable flags

* [SET variable flag](/docs/tools/fbsql/fbsql-config-set-variable)

## SQL syntax

* [SQL guide](/docs/sql-guide/sql-guide-home) |

## Additional information

{% include /fbsql/fbsql-flags-execution-extra.md %}

{% include /fbsql/fbsql-query-buffer-extra.md %}

### Cloud database connect additional

{% include /fbsql/fbsql-db-connect-same.md %}

## Create filename aliases

### Filename alias for CSV file

Create a filename alias for file containing CSV data:

```
fbsql=# \file insert_test.csv icsv
```

Use the alias in SQL statement:

```sql
fbsql-# bulk replace
     -#     into insert_test (_id, int1, string1, timestamp1)
     -#     map (0 id, 1 int, 2 string)
     -#     transform (@0, @1, @2, current_timestamp)
     -# from
     -#     'icsv'
     -# with
     -#     format 'CSV'
     -#     input 'STREAMX';
```

#### Alias for SQL file

Create `docviewtest.sql` and add the following SQL statement:

```sql
SELECT * from doctest where _id = 0;
```

Add filename alias:

```
\file docviewtest.sql mynewview
```

Use the alias in a SQL statement:

```sql
CREATE VIEW docview AS :mynewview;
```


## Further information

* [SQL Guide](/docs/sql-guide/sql-guide-home)
