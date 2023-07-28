---
title: fbsql delete when ready
layout: default
parent: Tools
has_children: true
nav_order: 1
has_toc: false
---


####  local file reference


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

####  set table formatting mode

```shell
\x [ on | off ]
```

Sets or toggles expanded table formatting mode. As such it is equivalent to \pset expanded.

####  send command to the shell

```shell
\! [ command ]
```

The **command** is simply passed literally to the shell.

## Further Information

* [FBSQL Data Loaders](/docs/tools/fbsql/fbsql-loaders)
