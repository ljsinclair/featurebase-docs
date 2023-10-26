---
title: Import data using fbsql
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 20
---

TEST


| Key | Description | Additional information |
|---|---|---|
| `batch-size` | {% include test1.md %} |  |
| `batch-max-staleness` |  |  |
| `timeout` |  |  |


# How do I import data to FeatureBase using fbsql?

The `loader` command relies on an appropriately formated TOML configuration file that contains:
* FeatureBase target table to insert data
* Connection settings for an Apache Impala, Apache Kafka or PostgreSQL data source
* A series of key/value pairs, added in the order of destination table columns

## Before you begin

* [Learn about Apache Impala](https://impala.apache.org/){:target="_blank"}
* [Learn about Apache Kafka](https://kafka.apache.org/documentation/){:target="_blank"}
* [Learn about PostgreSQL](https://www.postgresql.org/docs/){:target="_blank"}
* [Learn about TOML format](https://toml.io/)
{% include /fbsql/fbsql-before-begin.md%}
{% include /fbsql/fb-db-create.md %}

## Connection keys

| Key | Description | Required | Additional information |
|---|---|---|---|
| `connection-string= "<data-source-type>://<data-source-connection-string>"` | Quoted connection string that includes the data source type | Impala or PostgreSQL | [Data source connection strings](#data-source-connection-strings) |
| `driver="<impala> | <postgres>"` | Direct the fbsql `loader` command to use the specified driver | Impala or PostgreSQL |
| `hosts` | Apache Kafka hosts URL | Apache Kafka |  |

## Database keys

| Key | Description | Required | Additional information |
|---|---|---|---|
| `table="<target-table-name>" | Double-quoted target table to insert data | Yes | [CREATE TABLE statement](/docs/sql-guide/statements/statement-table-create) |
| `query="<SQL Query>" | Valid SQL query to SELECT data from the data source for insertion into the target table | Impala or PostgreSQL |  |

## Optional batching keys

The following keys are optional and determine how much data is batched during ingestion.





## Additional information

### Data source connection strings

* [Impala connection string documentation](https://impala.apache.org/docs/build/html/topics/impala_client.html){:target="_blank"}
* [PostgreSQL connection string documentation](https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-CONNSTRING-URIS){:target="_blank"}






table=
query = "SELECT query on data source tables"
driver = "impala | postgres"
connection-string = "impala | posgres connection string"
batch-size =




```





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
