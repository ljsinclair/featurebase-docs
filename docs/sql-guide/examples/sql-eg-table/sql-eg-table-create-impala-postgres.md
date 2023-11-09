---
title: CREATE TABLE loader-target
layout: default
parent: SQL Examples
grand_parent: SQL guide
nav_exclude: true
---

# CREATE TABLE loader-target

The `loader-target` table is used as destination table for `fbsql loader` examples.

## Syntax

```sql
CREATE TABLE loader-target (
    _id id,
    intf int,
    stringf string,
    idf id,
    stringsetf stringset,
    idsetf idset);
```

## Next step

Choose from the following:
* [Setup an Apache Impala data source and TOML configuration file](/docs/tools/fbsql/examples/fbsql-loader-impala-source), OR
* [Setup a PostgreSQL data source and TOML configuration file](/docs/tools/fbsql/examples/fbsql-loader-postgres-source)
