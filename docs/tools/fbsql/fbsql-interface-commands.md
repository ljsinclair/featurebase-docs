---
title: FBSQL interface reference
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 11
---
# FBSQL interface command reference

Interface commands are executable from the FBSQL interface and also known as:
* meta-commands
* slash or backslash commands

## Before you begin

* [Install FBSQL](/docs/tools/fbsql/fbsql-install)
* Connect to `fbsql` interface:
  * Open a CLI then enter `fbsql`, or
  * [Connect to cloud database](/docs/tools/fbsql/fbsql-connect-cloud-db)
  * [Connect to community database](/docs/tools/fbsql/fbsql-connect-community-db)

## Syntax

```
\
  [
    [<file-flags] |
    [<output-flags>] |
    [<variable-flags] |
    [query-flags] |
  ]
```

## File flags

| Flag | Description | Default | Additional information |
|---|---|---|---|
| `\cd [directory-name]` |

## Output flags

* [Learn about FBSQL output flags](/docs/tools/fbsql/fbsql-config-output)

## Set variable flag

* [Learn how to set a named variable]

## Query flags

* [Learn how to setup query output and write SQL queries in FBSQL]

## Additional information

{% include /fbsql/fbsql-flags-execution-extra.md %}
