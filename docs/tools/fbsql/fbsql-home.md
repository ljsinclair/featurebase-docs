---
title: CLI SQL tool
layout: default
parent: Tools
has_children: true
nav_order: 1
has_toc: false
---

# How do I run SQL queries from the command-line?

The FBSQL Command Line Interface tool for Linux and MacOS systems supports:
* API-key and user authenticated connections to FeatureBase databases
* SQL statements input via text files or the FBSQL interface
* meta-commands to control output and task scripting and automation

## Before you begin

{% include /fbsql/fbsql-before-begin.md %}
* [Setup a FeatureBase Cloud database](/docs/cloud/cloud-home), OR
* [Setup a FeatureBase Community database](/docs/community/com-home)

## How do I install FBSql?

* [Learn How To Install fbsql](/docs/tools/fbsql/fbsql-install)

## How do I open and quit the FBSQL interface?

| Task | Actions |
|---|---|
| Open FBSQL interface | * Open a CLI<br/>* Enter `fbsql` |
| Quit the FBSQL interface | `\q` or `\quit` at the `=#` prompt |

## How do I connect to a FeatureBase database?

* [Connect to a FeatureBase cloud database](/docs/tools/fbsql/fbsql-connect-cloud-db)
* [Connect to a FeatureBase community database](/docs/tools/fbsql/fbsql-connect-com-db)

## How do I run SQL queries?

Run SQL queries in the FBSQL interface or using text files:

* [Learn how to run SQL on FBSQL](/docs/tools/fbsql/fbsql-running-sql.md)

## How do I format SQL query output?

FBSQL meta-commands give you full control over query output:

* [FBSQL output reference](/docs/tools/fbsql/fbsql-config-output)

## Further information

* [SQL Guide](/docs/sql-guide/sql-guide-home)
* [Learn about FBSql loaders](/docs/tools/fbsql/fbsql-loaders)
