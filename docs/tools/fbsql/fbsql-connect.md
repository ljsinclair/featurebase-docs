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

## Connect to FBSQL interface

* Open a CLI then CD to `fbsql/featurebase` then run fbsql

```sh
CD fbsql/featurebase
fbsql
```

A successful connection displays the following information:

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
