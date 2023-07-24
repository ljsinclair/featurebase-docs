---
title: FBSQL config reference
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 10
---

# FBSQL Configuration reference

## Before you begin

{% include /fbsql/fbsql-before-begin.md %}
* [Connect to FBSQL](/docs/tools/fbsql/fbsql-connect)

## Configuration syntax

```
\[
  [o | output]
  [timing [ on | off ]]
  [unset <variable-name>]
  [x [on | off]]
]

```

## Commands and arguments

| Command | Description | Arguments | Additional information |
|---|---|---|---|
| `o` | set output channel |
| `timing [ on | off ]` | Toggle timing of display of SQL statement |
| `unset <variable-name>` | Delete the FBSQL variable of <variable-name> |
| `x [on | off]` | Toggle table formatting mode |  | Equivalent to ['\pset expanded'](/docs/tools/fbsql/fbsql-config/pset) |
