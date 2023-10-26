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
| `--loader-<datasource>` |
| `--loader-impala` | Designate a configuration file containing Impala database credentials FeatureBase will read from. | For Impala data sources | [Load Impala Data With fbsql](/docs/tools/fbsql/fbsql-loaders-impala) |
| `--loader-kafka` | Designate a configuration file containing Kafka Avro JSON files | For Apache Kafka data sources | [Load Kafka Data With fbsql](/docs/tools/fbsql/fbsql-loaders-kafka) |
| `--loader-postgres` | Run fbsql in non-interactive mode to load data from PostgreSQL. | For PostgreSQL data sources | [Load PostgreSQL Data With fbsql](/docs/tools/fbsql/fbsql-loaders-postgres) |
| `filename.toml` | filename and path to toml configuration file configured according to the data source | [TOML configuration](#toml-configuration) |


If fbsql is provided the `--loader-kafka=filename` flag, it will run
as a Kafka consumer in non-interactive mode.

Based on the configuration provided in **filename**, fbsql will
read messages from a Kafka topic
and submit them to FeatureBase via `BULK INSERT` statements.

 In this mode, fbsql processes messages until terminated by the user.

If fbsql is provided the `--loader-impala=filename` flag, it will
run in non-interactive mode. 

Based on the configuration provided in filename, fbsql will
query Impala,
read tuples returned,
and submit them to FeatureBase via `BULK INSERT` statements.

In this mode, fbsql processes messages until all tuples returned by the query are processed.


If fbsql is provided the `--loader-postgres=filename` flag, it will run in

non-interactive mode.

Based on the configuration provided in filename, fbsql will
query PostgreSQL,
read tuples returned,
and submit them to FeatureBase via `BULK INSERT` statements.

In this mode, fbsql processes messages until all tuples returned by the query are processed.
