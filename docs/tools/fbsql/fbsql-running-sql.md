---
title: Running SQL queries
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 4
---

# How do I run SQL queries with FBSQL?

Valid SQL queries can be run directly in the FBSQL interface or via defined files

## Before you begin

* [Install FBSQL](/docs/tools/fbsql/fbsql-install)
* [Connect to FeatureBase database with FBSQL](/docs/tools/fbsql/fbsql-connect-db)
* [SQL Guide](/docs/sql-guide/sql-guide-home)

-c <dbname> > connect to database in currently connected FeatureBase instance

## Syntax

```sh
  (-[d|-dbname] database)
  [ -[c|-command]

  filename.sql] | <sql-statement> ]
```

## Arguments

| Argument | Description | Default | Additional information |
|---|---|---|---|
| `-d`<br/>`--dbname` | Specify a database to connect to |  |  |
|


| `-f`<br>`--file` | Read commands from the file **filename**, rather than standard input.
This option can be repeated with the `-c` option.
All `-c` options will be processed before all `-f` options are processed.
When either `-c` or `-f` is specified, fbsql does not read commands from standard input;
instead it terminates after processing all the `-c` and `-f` options in sequence.
Except for that, this option is largely equivalent to the meta-command `\i`. | |


## fbsql flags

The following flags can be provided when running fbsql. None of the flags are required to start fbsql.



| Flag | Description | Default |
|---|---|---|
| `-c`<br>`--command` | Specifies that fbsql is to execute the given command string (enclosed in either single or double quotes). This option can be repeated and combined with the `-f` option. All `-c` options will be processed before all `-f` options are processed. When either `-c` or `-f` is specified, fbsql does not read commands from standard input; instead it terminates after processing all the `-c` and `-f` options in sequence. | |



| `--history-path` | File in which to store command history. This defaults to `.featurebase/fbsql_history` in the current user's home directory. | |




| `--org-id` | Specified the Organization ID to use. Organizations are a concept used in FeatureBase Cloud, and in that case they are determined automatically based on user authorization. They are exposed here in case on-prem installations want to mimic that functionality. | |
