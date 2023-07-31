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
<prefix>
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

{% include /fbsql/fbsql-meta-prefix.md %}

## Database flags

| Argument | Description | Default | Additional information |
|---|---|---|---|
| `\c <cloud-database-name>`<br/>`\connect <cloud-database-name>` | Connect to an available database in the currently connected cloud account. | [Connect cloud database additional](#connect-cloud-database-additional) |
| `c -` <br/> `connect -` | Disconnect from the current database |  |  |
| `d` | List all tables in the connected database. Equivalent to Cloud `SHOW DATABASE` statement |  | [SHOW DATABASE](/docs/sql-guide/statements/statement-database-show) |
| `d <tablename>` | Equivalent to `SHOW COLUMNS` statement |  | [SHOW COLUMNS](/docs/sql-guide/statements/statement-columns-show) |
| `dt` | Equivalent to `SHOW TABLES` statement |  | [SHOW TABLES](/docs/sql-guide/statements/statement-table-show) |
| `dv` | Show definition of all views |  | [CREATE VIEWS](/docs/sql-guide/statements/statement-view-create) |
| `l`<br/>`list` | List databases in connected Cloud database |  |  |
| `i <filename.sql>`<br/>`include <filename.sql>` | Run SQL statements from file |  | Equivalent to `fbsql --file` command |
| `timing` | Toggle time SQL statement takes to execute | off |  |
| `watch <second-val>` | Interval of <second-val> to repeat query in buffer or in history until manual break or fails |  |

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

## Further information

* [SQL Guide](/docs/sql-guide/sql-guide-home)
