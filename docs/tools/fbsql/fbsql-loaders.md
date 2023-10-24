---
title: Import data using fbsql
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 20
---

# How do I load data to FeatureBase using fbsql?

The `fbsql-loader` command can be run from the fbsql CLI to:
* read data from a specified Impala, Kafka or Postgres data source
* `BULK INSERT` this data to an existing FeatureBase database and table.

The command requires a suitably configured TOML file which defines the data source and other settings.

## Before you begin

* Determine a unique identifier for each row of data to be loaded from your data source to FeatureBase
* [Learn about SQL BULK INSERT](/docs/sql-guide/statements/statement-insert-bulk)
* [Learn about TOML format](https://toml.io/)
{% include /fbsql/fbsql-before-begin.md%}
{% include /fbsql/fb-db-create.md %}

## How do I setup a TOML configuration file for my data source?

### Common keys

| TOML key | Description | Default | Required | Additional information |
|---|---|---|---|---|
|  

The table below holds the key/value pairs supported in the TOML file independent of the source you want to connect to:

| Key | Description | Example Value | Default |
|---|---|---|---|
| `table` | The name of the FeatureBase table into which data, consumed by fbsql, will be written. The table must exist prior to running `fbsql`. | `"tablename"` | |

| `batch-size` | The size of the `BULK INSERT` batches sent to FeatureBase. The ideal value will depend on the data model, available resources, and target load rates. Generally speaking, larger values will increase the rate at which data is loaded but will use more resources. | `100000` | `1`|


### Fields

Providing field configuration in the TOML configuration file is optional. If no fields are provided, fbsql will try to map each source data field to a FeatureBase columns from the table specified in the configuration file.

Fields are specified as a TOML [arrays of tables](https://toml.io/en/v1.0.0#array-of-tables). Each source data field will need an entry in the file.

The table below holds the key/value pairs supported in the TOML file independent of the source you want to connect to:

| Key | Description | Required | Default | Additional information |
|---|---|---|---|---|
| `name` | Specify destination column in FeatureBase table to write data. | Yes | none | [CREATE TABLE statement](/docs/sql-guide/statements/statement-table-create) |
| `source-type` | Specify destination column data type to format incoming data  |  | [Featurebase data types](/docs/sql-guide/data-types/data-types-home) |
| `primary-key` | Specify a unique identifier from your data source to map to the FeatureBase table `_id` column in each row of data | [CREATE TABLE statement](/docs/sql-guide/statements/statement-table-create) |

## Further information

* [Learn about fbsql](/docs/tools/fbsql/fbsql-home)
* [Learn how to install fbsql](/docs/tools/fbsql/fbsql-install)
