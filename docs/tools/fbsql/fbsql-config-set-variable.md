---
title: FBSQL set variable reference
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 13
---

# FBSQL SET variable reference

## Before you begin

{% include /fbsql/fbsql-before-begin.md %}
* [Install FBSQL](/docs/tools/fbsql/fbsql-install)

{% include /fbsql/fbsql-help-quit.md %}

## Syntax

```
\ [
    [set <variable-name> [variable-value,...]] |
    [unset <variable-name>]
  ]
```

## Flags

| Flag | Description |
|---|---|
| `\set` | List all variable names |
| `\set|unset <variable-name>` | Set or unset named variable |
| `\set <variable-name> <variable-value>` | Set a variable name and value. Multiple variables are concatenated. |

## Additional information

Variable names are case-sensitive.

## Use of variables

| Usage | Description |
|---|---|
| `:<variable-name>` | A defined variable is inserted into a SQL statement |
