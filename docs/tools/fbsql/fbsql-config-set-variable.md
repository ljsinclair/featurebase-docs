---
title: FBSQL set variable reference
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 1
---

# FBSQL SET variable reference

## Before you begin

{% include /fbsql/fbsql-before-begin.md %}
* [Connect to FBSQL](/docs/tools/fbsql/fbsql-connect)

## Set Variable syntax

```sh
\set [ name [ value [ ... ] ] ]
```

## Arguments

| Argument | Description |
|---|---|
| name |  |
| value |  |

Sets the fbsql variable **name** to **value**, or if more than one value is given, to the concatenation of all of them. If only one argument is given, the variable is set to an empty-string value. To unset a variable, [use the `\unset` command](#unset-variable).

`\set` without any arguments displays the names and values of all currently-set fbsql variables.

Variable names are case-sensitive.
