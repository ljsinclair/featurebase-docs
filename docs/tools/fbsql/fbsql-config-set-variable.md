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
<prefix>
  [
    [set <variable-name> [variable-value,...]] |
    [unset <variable-name>]
  ]
```

{% include /fbsql/fbsql-meta-prefix.md %}

## Flags

| Flag | Description |
|---|---|
| `\set` | List all variable names |
| `\set|unset <variable-name>` | Set or unset named variable |
| `\set <variable-name> <variable-value>` | Set a variable name and value. Multiple variables are concatenated. |

## Additional information

Variable names are case-sensitive and can be inserted into SQL statements in two ways:
* `:<variable-name>`
* `:"<variable-name>"`

## Examples

### Define variable

```
fbsql -c \set myval doctest
```
### Use variable in SQL statement

```sql
SELECT * from :myval;
```
-->
