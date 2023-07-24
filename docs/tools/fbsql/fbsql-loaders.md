---
title: fbsql-loaders
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 2
---

# FBSQL Loaders

`fbsql` is a CLI tool used to interact with FeatureBase using SQL. It can also be run in non-interactive mode to load data from supported data sources. These "loaders" connect to a data source, build batches of SQL `BULK INSERT` statements with the data returned from the source, and send those `BULK INSERT` requests to FeatureBase.

Below are the currently supported data sources (with links to the source specific documentation):

- [Kafka](/docs/tools/fbsql/fbsql-loaders-kafka):           use the `--loader-kafka` flag with the `fbsql` binary to run the kafka loader.
- [PostgreSQL](/docs/tools/fbsql/fbsql-loaders-postgres): use the `--loader-postgres` flag with the `fbsql` binary to run the postgres loader.
- [Impala](/docs/tools/fbsql/fbsql-loaders-impala):         use the `--loader-impala` flag with the `fbsql` binary to run the impala loader.

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
| `primay-key` | Exactly one field of the source data should be set as the primary key. The name of the field designated the primary key does not need to map to a column in FeatureBase. | `true` | `false` |

Possible `source-type` values are:

{% include /sql-guide/sql-datatypes.md %}

## Additional Resources
* [Learn about fbsql](/docs/tools/fbsql/fbsql-home)
* [Learn how to install fbsql](/docs/tools/fbsql/fbsql-install)