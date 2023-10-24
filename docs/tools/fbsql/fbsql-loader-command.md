---
title: Load data
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 20
---

# Load data from TOML configuration files

Run the `loader` command with appropriate flags to load data from a specified data source to an existing FeatureBase database.

## Before you begin

{% include /fbsql/fbsql-before-begin.md%}
{% include /fbsql/fb-db-create.md %}
* [Create a FeatureBase table](/docs/sql-guide/statements/statement-table-create)
* [Learn how to setup a TOML configuration file]()

## Syntax

```sh
(<cli-flag-prefix>)
  <db-connection-string> \
(--loader-(impala|kafka|postgres)) filename.toml
```

{% include /fbsql/fbsql-prefix-cli-flags.md %}

### Arguments

| Argument | Description | Required | Additional information |
|---|---|---|---|
| `<db-connection-string>` | fbsql connection string to FeatureBase database | Yes | * [fbsql connect to FeatureBase Cloud](/docs/tools/fbsql/fbsql-connect-cloud-db)<br/>* [fbsql connect to FeatureBase Community](/docs/tools/fbsql/fbsql-connect-com-db) |
| `--loader-impala` | Designate a configuration file containing Impala database credentials FeatureBase will read from. | For Impala data sources | [Load Impala Data With fbsql](/docs/tools/fbsql/fbsql-loaders-impala) |
| `--loader-kafka` | Designate a configuration file containing Kafka Avro JSON files | For Apache Kafka data sources | [Load Kafka Data With fbsql](/docs/tools/fbsql/fbsql-loaders-kafka) |
| `--loader-postgres` | Run fbsql in non-interactive mode to load data from PostgreSQL. | For PostgreSQL data sources | [Load PostgreSQL Data With fbsql](/docs/tools/fbsql/fbsql-loaders-postgres) |
| `filename.toml` | filename and path to toml configuration file configured according to the data source | [TOML configuration](#toml-configuration) |
