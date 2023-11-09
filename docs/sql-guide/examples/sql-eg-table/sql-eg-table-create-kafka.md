---
title: CREATE TABLE loader-target
layout: default
parent: SQL Examples
grand_parent: SQL guide
nav_exclude: true
---

# CREATE TABLE loader-target

The `loader-target` table is required for an ingestion process that includes two additional parts:
* Part 2 - create Kafka data source and TOML configuration file
* Part 3 - run fbsql `loader` command to import data to `loader-target`

## Before you begin

* [CREATE TABLE statement](/docs/sql-guide/statements/statement-table-create)
* [FeatureBase SQL editors](/docs/sql-guide/sql-guide-home/#running-sql-queries)

## Create required table

Run the following SQL in a SQL editor:

```sql
CREATE TABLE loader-target (
    _id id,
    name string,
    qty int,
    categories stringset,
    level decimal(2),
    ts timestamp
)
```

## Next step

* [Part 2 - create Kafka data source and TOML configuration file](/docs/tools/fbsql/examples/fbsql-loader-kafka-source)
