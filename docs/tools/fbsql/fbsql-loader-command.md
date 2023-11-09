---
title: fbsql loader command
layout: default
parent: fbsql CLI SQL tool
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
* [fbsql loader TOML configuration file settings](/docs/tools/fbsql/fbsql-loader-toml-config)

## Syntax

```sh
(fbsql <featurebase-connection> | \)loader-(impala | kafka | postgres) filename.toml
```

## Arguments

| Argument | Description | Required | Additional information |
|---|---|---|---|
| `fbsql <featurebase-connection>` | Used when running `loader` from the CLI | <db-connection-string> | * [fbsql connect to FeatureBase Cloud](/docs/tools/fbsql/fbsql-connect-cloud-db)<br/>* [fbsql connect to FeatureBase Community](/docs/tools/fbsql/fbsql-connect-com-db) |
| `\` | Used when running `loader` from the fbsql interface |  |  |
| `--loader-(impala | kafka | postgres)` | Choose a data source for the loader to read from | Yes |  |
| `filename.toml` | TOML configuration file containing key/values for data source and target table | [TOML configuration file for fbsql loader](/docs/tools/fbsql/fbsql-loader-toml-config) |

## Additional information

### fbsql loader operations

| Data source | Operation |
|---|---|
| Kafka | Reads messages from Kafka topic specified in TOML configuration |
| Impala or PostgreSQL | Reads tuples from SELECT statement included in TOML configuration |

## Further information

* [TOML configuration file for fbsql loader](/docs/tools/fbsql/fbsql-loader-toml-config)
* [fbsql loader examples](/docs/tools/fbsql/fbsql-loader-eg-generic)
