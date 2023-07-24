---
title: Connect to FBSQL
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 2
---
# How do connect to FBSQL?

## Before you begin

{% include /fbsql/fbsql-before-begin.md %}
* [Install FBSQL](/docs/tools/fbsql/fbsql-install)
* Open a CLI then CD to `fbsql/featurebase`

## Syntax

```sh
fbsql (-)

```
```sh
CD fbsql/featurebase
fbsql
```

A successful connection displays the following status information:

| Status | Description |
|---|---|
| Detected on-prem, classic deployment | FBSQL installed locally |
| Host: http://localhost  | No FeatureBase Community instance detected |
| Host: http://localhost:10101 | FeatureBase Community instance running on default port |
| You are not connected to a database | Started without connecting |
| connecting to database: invalid database: dbname | error in database name |
|

```sh
FeatureBase CLI ()
Type "\q" to quit.
Detected on-prem, classic deployment.
Host: http://localhost:10101
You are not connected to a database.
fbsql=#
```

## Next step

* [Connect to a FeatureBase database](/docs/tools/fbsql-connect-db)
