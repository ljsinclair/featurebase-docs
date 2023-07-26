---
title: FBSQL config reference
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 11
---

# FBSQL Configuration reference

FBSQL configuration commands are run from the FBSQL interface and do not require a database connection.

## Before you begin

{% include /fbsql/fbsql-before-begin.md %}
* [Connect to FBSQL](/docs/tools/fbsql/fbsql-connect)

## Configuration syntax

```
\
  [
    -[c|-command] "<command-options"
    - |



  ]

\[
  [o | output]
  [timing [ on | off ]]
  [unset <variable-name>]
  [x [on | off]]
]

```

## Arguments

| Argument | Description | Default | Additional information |
|---|---|---|---|
| `-c "<command-options>"`<br/>`--command "<command-options>"` | Execute the command string `<command-options>` |  | [Command argument](#command-argument) |

 Specifies that fbsql is to execute the given command string (enclosed in either single or double quotes). This option can be repeated and combined with the -f option. All -c options will be processed before all -f options are processed. When either -c or -f is specified, fbsql does not read commands from standard input; instead it terminates after processing all the -c and -f options in sequence.

## Additional information

### Command argument




## Commands and arguments

| Command | Description | Arguments | Additional information |
|---|---|---|---|
| `o` | set output channel |
| `timing [ on | off ]` | Toggle timing of display of SQL statement |
| `unset <variable-name>` | Delete the FBSQL variable of <variable-name> |
| `x [on | off]` | Toggle table formatting mode |  | Equivalent to ['\pset expanded'](/docs/tools/fbsql/fbsql-config/pset) |
