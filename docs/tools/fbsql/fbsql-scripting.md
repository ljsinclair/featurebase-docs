---
title: Scripting FBSQL
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 10
---
# FBSQL Scripting reference

FBSQL includes a collection of meta commands which can be used to

<!--rewrite
Anything you enter in fbsql that begins with an unquoted backslash is a fbsql meta-command that is processed by fbsql itself. These commands make fbsql more useful for administration or scripting. Meta-commands are often called slash or backslash commands.

The format of an fbsql command is the backslash, followed immediately by a command verb, then any arguments. The arguments are separated from the command verb and each other by any number of whitespace characters.

-->

## Before you begin

{% include /fbsql/fbsql-before-begin.md %}
* [Connect to FBSQL](/docs/tools/fbsql/fbsql-connect)

## FBSQL command syntax

```sh
\<fbsql-command> <arguments>
<database commands>
<query commands>
<file commands>
<output commands>
<query commands>
[\q | \quit]
```

{: .note}
FBSQL configuration commands link here

## Database commands

| Command | Description | Arguments | Additional information |
|---|---|---|---|
| `c` or `connect` [dbname] | Create new connection to database. |  |
| `\cd [ directory ]` | Changes to the current user home directory | Changes to the current working directory |  |
|   | disconnect from the current database, pass `-` as dbname.|
| `\d [ tablename ]` | List all objects in the connected database | Show all columns and their types |  |
| `\l` or `\list` | Lists the databases on the server |  |  |
| `\dt` | Lists all tables in the connected database |  |  |
| `\dv` | List all views in the connected database |  |  |

## Query commands

| Command | Description | Arguments | Additional information |
|---|---|---|---|
| `\r` or `\reset` | Reset (clear) the SQL query buffer |  |  |
| `\w <filename>` or `\write <filename>` | Write current buffer to designated filename |

{: .note}
If the current query buffer is empty, the most recently executed query is written instead.

## File commands

| Command | Description | Arguments | Additional information |
|---|---|---|---|
| `\file filename [alias]` | Adds a reference to `filename` to the query buffer. | Use an alias to simplify long or complex file names |
| `\i <filename>` or `\include <filename>`| Executes input from <filename> as though it had been typed on the keyboard. |  |  |
| `\o [filename]` or `\out [ filename ]` | Output query results in FBSQL CLI | Output query results to filename |  |

## Output commands

| Command | Description | Arguments | Additional information |
|---|---|---|---|
| `\echo text` | Prints the argument to standard output, followed by a newline. |
| `p` or `print` | Print query buffer to FBSQL CLI |  | Most recent query printed if query buffer is empty |
| `\quecho text` | Prints argument to output channel set by `\o` |

## Additional information

### Parsing arguments

Argument parsing ends:
* at the end of line
* when an unquoted `\` is found

### Query buffer

The **query buffer** holds includes:
* a partial or complete SQL query not yet executed by the server
* previous input lines
* any text appearing on the same line before the meta-command

### Quoting values

Arguments can use any valid value when surrounded by single or double quotes.

Unquoted values included in arguments are processed as follows:

| Value in argument | Unquoted | Example |
|---|---|---|
| Whitespace | Error |
| colon following FBSQL variable name |  SQL interpolation replaces colon with variable value |
| backslash | Beginning of a new meta-command |

### File command additional

Local file references can be use in [BULK INSERT](/docs/sql-guide/statements/statement-insert-bulk/) statements with `INPUT STREAMX`. For example, the following commands will insert contents from local file `insert_test.csv` using an alias `icsv`:

```
fbsql=# \file insert_test.csv icsv
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






####  warn to standard error channel

```shell
\warn text
```

This command is identical to \echo except that the output will be written to fbsql's standard error channel, rather than standard output.

####  re-execute query buffer

```shell
\watch [ seconds ]
```

Repeatedly execute the current query buffer until interrupted or the query fails. Wait the specified number of seconds (default 2) between executions.

If the current query buffer is empty, the most recently sent query is re-executed instead.

####  send command to the shell

```shell
\! [ command ]
```

The **command** is simply passed literally to the shell.
