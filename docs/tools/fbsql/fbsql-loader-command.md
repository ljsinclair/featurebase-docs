---
title: fbsql loader command
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 13
---

# fbsql loader command

The fbsql `loader` command supports three data sources:
* Apache Impala
* Apache Kafka
* PostgreSQL

When run, the `loader` command reads from a specified TOML configuration file to:
* Connect to the data source
* Ingest data from the data source and saves to a FeatureBase table

## Before you begin

{% include /fbsql/fbsql-before-begin.md%}
* [CREATE TABLE statement](/docs/sql-guide/statements/statement-table-create)
* [TOML configuration file settings](/docs/tools/fbsql/fbsql-loader-toml-config)

## Syntax

```sh
(<cli-flag-prefix>)
  <db-connection-string> \
(--loader-<data-source>) <filename>.toml
```

{% include /fbsql/fbsql-prefix-cli-flags.md %}

## Arguments

| Argument | Description | Required | Additional information |
|---|---|---|---|
| `<db-connection-string>` | fbsql connection string to FeatureBase database | Yes | * [fbsql connect to FeatureBase Cloud](/docs/tools/fbsql/fbsql-connect-cloud-db)<br/>* [fbsql connect to FeatureBase Community](/docs/tools/fbsql/fbsql-connect-com-db) |
| `--loader-<datasource>=<filename>.toml` | Provide data source type and filename containing TOML configuration | [TOML configuration file for fbsql loader](/docs/tools/fbsql/fbsql-loader-toml-config) |

## Additional information

### fbsql loader operations

| Data source | Operation |
|---|---|
| Kafka | Reads messages from Kafka topic specified in TOML configuration |
| Impala or PostgreSQL | Reads tuples from SELECT statement included in TOML configuration |

## Further information

* [TOML configuration file for fbsql loader](/docs/tools/fbsql/fbsql-loader-toml-config)
* [fbsql loader examples](/docs/tools/fbsql/fbsql-loader-eg-generic)
