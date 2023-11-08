---
title: CREATE TABLE loader-target
layout: default
parent: SQL Examples
grand_parent: SQL guide
nav_exclude: true
---

# CREATE TABLE loader-target

This example table is intended as target for Kafka data ingested via the fbsql `loader` command.

## Syntax

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

* [Setup Kafka data source](/docs/tools/fbsql/examples/fbsql-loader-kafka-source)
