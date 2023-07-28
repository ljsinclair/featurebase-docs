---
title: FBSQL interface reference
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 11
---
# FBSQL interface command reference

Interface commands are also known as **meta commands** and are executable from the FBSQL interface.

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
    [cd [directory-name]
    [pset <output-flags>]

  ]
```



####  print output to query output channel

```shell
\qecho text
```

This command is identical to \echo except that the output will be written to the query output channel, as set by \o.



## Flags

| Flag | Description | Additional information |
|---|---|---|
| `\cd` | Change system working directory | Defaults to `$home` |
| `\pset` | Display current output settings | [PSET defaults](#pset-defaults) |

## PSET output flags

* [Learn about FBSQL output flags](/docs/tools/fbsql/fbsql-config-pset)
