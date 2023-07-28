---
title: Import data using FBSQL
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 20
---

<!--
From original | `--loader-impala` | Run fbsql in non-interactive mode to load data from Impala. Based on the configuration file provided as an argument to this flag, fbsql will query Impala and send the data to FeatureBase via BULK INSERT statements. In this mode, fbsql processes messages until all the tuples from Impala are loaded. For more information, see [Load Impala Data With fbsql](/docs/tools/fbsql/fbsql-loaders-impala) | |
| `--loader-kafka` | Run fbsql as a Kafka consumer in non-interactive mode. Based on the configuration file provided as an argument to this flag, fbsql will read messages from a Kafka topic and submit them to FeatureBase via BULK INSERT statements. In this mode, fbsql processes messages until terminated by the user. For more information, see [Load Kafka Data With fbsql](/docs/tools/fbsql/fbsql-loaders-kafka) | |
| `--loader-postgres` | Run fbsql in non-interactive mode to load data from PostgreSQL. Based on the configuration file provided as an argument to this flag, fbsql will query PostgreSQL and send the data to FeatureBase via BULK INSERT statements. In this mode, fbsql processes messages until all the tuples from PostgreSQL are loaded. For more information, see [Load PostgreSQL Data With fbsql](/docs/tools/fbsql/fbsql-loaders-postgres) | |

-->

# Define a datasource with FBSQL loaders

FBSQL loaders are run when connecting to a FeatureBase database and:
* rely on a suitably configured TOML file
* allowing FeatureBase to read data from the data source then `BULK INSERT` this into an existing FeatureBase table.

During processing no SQL or FBSQL commands can be run

## Before you begin

* [Learn about SQL BULK INSERT](/docs/sql-guide/statements/statement-insert-bulk)
* [Install FBSQL](/docs/tools/fbsql/fbsql-install)
* [Connect to a FeatureBase database with FBSQL](/docs/tools/fbsql/fbsql-connect-db)

## Syntax

```sh
fbsql
<db-connection-string> \
(--loader-(impala|kafka|postgres)) filename.toml
```

### Arguments

| Argument | Description | Additional information |
|---|---|---|
| `<db-connection-string>` | FBSQL connection string to FeatureBase database | [Connect to FeatureBase database](/docs/tools/fbsql/fbsql-connect-db) |
| `--loader-impala` | Designate a configuration file containing Impala database credentials FeatureBase will read from. | [Load Impala Data With fbsql](/docs/tools/fbsql/fbsql-loaders-impala) |
| `--loader-kafka` | Designate a configuration file containing Kafka Avro JSON files | [Load Kafka Data With fbsql](/docs/tools/fbsql/fbsql-loaders-kafka) |
| `--loader-postgres` | Run fbsql in non-interactive mode to load data from PostgreSQL. | [Load PostgreSQL Data With fbsql](/docs/tools/fbsql/fbsql-loaders-postgres) |
| filename


## Source Independent Configuration Options

The configuration file must be in [TOML](https://toml.io/) format.

### General

The table below holds the key/value pairs supported in the TOML file independent of the source you want to connect to:

| Key | Description | Example Value | Default |
|---|---|---|---|
| `table` | The name of the FeatureBase table into which data, consumed by fbsql, will be written. The table must exist prior to running `fbsql`. | `"tablename"` | |
| `batch-size` | The size of the `BULK INSERT` batches sent to FeatureBase. The ideal value will depend on the data model, avaliable resources, and target load rates. Generally speaking, larger values will increase the rate at which data is loaded but will use more resources. | `100000` | `1`|


### Fields

Providing field configuration in the TOML configuration file is optional. If no fields are provided, fbsql will try to map each source data field to a FeatureBase columns from the table specified in the configuration file.

Fields are specified as a TOML [arrays of tables](https://toml.io/en/v1.0.0#array-of-tables). Each source data field will need an entry in the file.

The table below holds the key/value pairs supported in the TOML file independent of the source you want to connect to:

| Key | Description | Example Value | Default |
|---|---|---|---|
| `name` | Specifies the name of the FeatureBase column into which data will be written. | `col_name` | |
| `source-type` | Specifies the FeatureBase column type the incoming data will be formatted as. For example, if a kafka message message contains `"foo":"6"` the configuration for foo should contain `source-type = "string"` even if the `foo` column in FeatureBase is an `Int` type. If a `source-type` is not provided, it will default to the FeatureBase field's type.  | `"idset"` | FeatureBase Column Type |
| `primary-key` | Exactly one field of the source data should be set as the primary key. The name of the field designated the primary key does not need to map to a column in FeatureBase. | `true` | `false` |

Possible `source-type` values are:

{% include /sql-guide/sql-datatypes.md %}

## Additional Resources
* [Learn about fbsql](/docs/tools/fbsql/fbsql-home)
* [Learn how to install fbsql](/docs/tools/fbsql/fbsql-install)
