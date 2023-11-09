---
title: CREATE TABLE loader-target
layout: default
parent: SQL Examples
grand_parent: SQL guide
nav_exclude: true
---

# CREATE TABLE loader-target

The `loader-target` table is required for an ingestion process that includes two additional parts:
* Part 2 - create Impala or PostgreSQL data source and TOML configuration file
* Part 3 - run fbsql `loader` command to import data to `loader-target`

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
