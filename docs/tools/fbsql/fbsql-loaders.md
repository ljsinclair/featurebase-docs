---
title: fbsql-loaders
layout: default
parent: fbsql
grand_parent: Tools
nav_order: 2
---

# FBSQL Loaders

`fbsql` is a CLI tool used to interact with FeatureBase using SQL. It can also be run in non-interactive mode to load data from supported data sources. These "loaders" connect to a data source, build batches of SQL `BULK INSERT` statements with the data returned from the source, and send those `BULK INSERT` requests to FeatureBase.

Below are the currently supported data sources (with links to the source specific documentation):

- [Kafka](#kafka-loader)
- [PostgreSQL](#postgresql-loader)
- [Impala](#impala-loader)

## Before you begin
* [Learn About fbsql](/docs/tools/fbsql/fbsql-home)
* [Learn How To Install fbsql](/docs/tools/fbsql/fbsql-install)

## Source Independent Configuration Options

The configuration file must be in [TOML](https://toml.io/) format.

### General

The below table holds the key/value pairs supported in the TOML file independent of the source you want to connect to:

| Key | Description | Example Value | Default |
|---|---|---|---|
| `table` | The name of the FeatureBase table into which data, consumed by fbsql, will be written. The table must exist prior to using it as a kafka message destination. | `"tablename"` | |
| `batch-size` | The size of the `BULK INSERT` batches sent to FeatureBase. The ideal value will depend on the data model, avaliable resources, and target load rates. Generally speaking, larger values will increase the rate at which data is loaded but will use more resources. | `100000` | `1`|


### Fields

Providing field configuration in the TOML file is optional. If no fields are provided, fbsql will determine a basic field configuration to use by inspecting the FeatureBase table specified in the `table` configuration option. In this case, the Kafka keys in the Kafka messages should map directly to the fields in the FeatureBase table.

Fields are specified as a TOML [arrays of tables](https://toml.io/en/v1.0.0#array-of-tables). Each key in the kafka message will need an entry in the file like below.

The below holds the key/value pairs supported in the TOML table independent of the source you want to connect to:

| Key | Description | Example Value | Default |
|---|---|---|---|
| `name` | Specifies the name of the FeatureBase column into which data will be written. | `col_name` | |
| `source-type` | Specifies the type that fbsql should expect the message data for the field to be represented in the Kafka message. For example, if the message contains `"foo":"6"` (even though field `foo` is defined as an `int` on the FeatureBase table), the configuration for `foo` should contain `source-type = "string"`. If a `source-type` is not provided, it will default to the FeatureBase field's type.  | `"idset"` | FeatureBase Column Type |
| `primay-key` | Exactly one field of the kafka message should be set as the primary key. The name of the field designated the primary key does not need to map to a column in FeatureBase. | `true` | |

Possible `source-type` values are:

{% include /sql-guide/sql-datatypes.md %}


## Kafka Loader

If fbsql is provided the `--loader-kafka=filename` flag, it will run as a Kafka consumer in non-interactive mode. Based on the configuration provided in **filename**, fbsql will read messages from a Kafka topic and submit them to FeatureBase via `BULK INSERT` statements. In this mode, fbsql processes messages until terminated by the user.

### Kafka Specific Configuration Options

Messages from Kafka must be in JSON format.

The below talble holds the key/value pairs supported in the TOML configuration file if you are connecting to kafka: 

| Key | Description | Example Value | Default |
|---|---|---|---|
| `hosts` | Specifies one more more Kafka broker hosts. If only one host is needed, this value can be provided without brackets. | `["host1", "host2"]` | |
| `group` | Kafka consumer group. See the [Confluent Documentation](https://docs.confluent.io/platform/current/clients/consumer.html) for more information. | `"groupname"` | |
| `topics` | Specifies one more more Kafka topics to consumer from. If only one topic is needed, this value can be provided without brackets. | `["topic1", "topic2"]` | |
| `batch-max-staleness` | Maximum length of time that the oldest record in a batch can exist before flushing the batch. Note that this can potentially stack with timeouts waiting for the source. The format of this value should be provided as a duration string, which is a possibly signed sequence of decimal numbers, each with optional fraction and a unit suffix, such as "300ms", "-1.5h" or "2h45m". Valid time units are "ns", "us" (or "µs"), "ms", "s", "m", "h". Set this value to `0` to disable timeouts. | `2h` | `1s`|
| `timeout` | Time to wait for more records from Kafka before flushing a batch. The format of this value should be provided as a duration string, which is a possibly signed sequence of decimal numbers, each with optional fraction and a unit suffix, such as "300ms", "-1.5h" or "2h45m". Valid time units are "ns", "us" (or "µs"), "ms", "s", "m", "h". Set this value to `0` to disable timeouts.  | `1m` | `1s`|


The below talble holds the key/value pairs supported in the TOML fields array if you are connecting to kafka:

| Key | Description | Example Value | Default |
|---|---|---|---|
| `source-path` | If the data for a particular FeatureBase column needs to be extracted from a nested JSON object, that can be specified using `source-path`. Each additional element in the array represents a nested key. If `source-path` is not provided, it will default to the value provided in `name`. | `["key", "sub-key"]` | value of `name` |


### Examples

#### Event stream with general data types

```sql
create table events (
    _id id,
    name string,
    qty int,
    categories stringset,
    level decimal(2),
    ts timestamp
)
```

```json
{
    "event_id":30,
    "name":"name-30",
    "qty":4,
    "demo":{
        "categories":["A", "C"],
        "level":24.56
    },
    "ts":"2023-02-27T12:26:25.091284-06:00"
}
```

```toml
hosts = ["localhost:9092"]
group = "grp"
topics = "events"
table = "events"
batch-size = 300
batch-max-staleness = "5s"
timeout = "5s"

[[fields]]
name        = "event_id"
source-type = "id"
primary-key = true

[[fields]]
name        = "name"
source-type = "string"

[[fields]]
name        = "qty"
source-type = "int"

[[fields]]
name        = "categories"
source-type = "stringset"
source-path = ["demo", "categories"]

[[fields]]
name        = "level"
source-type = "decimal(2)"
source-path = ["demo", "level"]

[[fields]]
name        = "ts"
source-type = "timestamp"
```

## PostgreSQL Loader

If fbsql is provided the `--loader-postgres=filename` flag, it will run in non-interactive mode. Based on the configuration provided in filename, fbsql will query PostgreSQL, read tuples returned, and submit them to FeatureBase via `BULK INSERT` statements. In this mode, fbsql processes messages until all tuples returned by the query are processed.

### PostgreSQL Specific Configuration Options

The below talble holds the key/value pairs supported in the TOML configuration file if you are connecting to kafka: 

| Key | Description | Example Value | Default |
|---|---|---|---|
| connection-string | PostgreSQL connection string used to connect to the PostgreSQL source. | `"postgres://user:password@localhost:5432/defaultindex?sslmode=disable"` | |
| query | The query sent to PostgreSQL to get the data to store in FeatureBase. | `"select col1, col2, col3 from pg_table;"` | |
| driver | This must be specified and set to `"postgres"` | `"postgres"` | |


The below table holds the key/value pairs supported in the TOML fields array if you are connecting to kafka:

| Key | Description | Example Value | Default |
|---|---|---|---|
| `source-column` | The column name in the response from `query` that should be used to populate the current field. If `source-column` is not provided, it will default to the value provided in `name`. | `"col1"` | value of `name` |

### Example

PostgreSQL `CREATE TABLE` statement:
```
CREATE TABLE postgres_table (idkey int, intf int, stringf varchar(30), idf int, stringsetf varchar(30), idsetf varchar(30));
```

PostgreSQL `INSERT` statement:
```
INSERT INTO postgres_table VALUES
	(0, 0, 'a', 0, 'a', '3'),
	(1, 0, 'a', 0, 'c', '4'),
	(2, 0, 'a', 0, 'd', '5');
```

FeatureBase `CREATE TABLE` statement:
```
CREATE TABLE tbl (
    _id id, 
    intf int, 
    stringf string, 
    idf id, 
    stringsetf stringset,
    idsetf idset);
```

```
table = "tbl"
query = "select idkey, intf, stringf, idf, stringsetf, idsetf from postgres_table;"
driver = "postgres"
connection-string = "postgres://postgres_uesr:user_password@localhost:5432/mydatabase?sslmode=disable"
batch-size = 1

[[fields]]
name		= "idkey"
source-type	= "id"
primary-key	= true

[[fields]]
name		= "intf"
source-type	= "int"

[[fields]]
name		= "stringf"
source-type	= "string"

[[fields]]
name		= "idf"
source-type	= "id"

[[fields]]
name		= "stringsetf"
source-type	= "stringset"

[[fields]]
name		= "idsetf"
source-type	= "idset"
```

## Impala Loader

If fbsql is provided the `--loader-impala=filename` flag, it will run in non-interactive mode. Based on the configuration provided in filename, fbsql will query Impala, read tuples returned, and submit them to FeatureBase via `BULK INSERT` statements. In this mode, fbsql processes messages until all tuples returned by the query are processed.

The below talble holds the key/value pairs supported in the TOML configuration file if you are connecting to kafka: 

| Key | Description | Example Value | Default |
|---|---|---|---|
| connection-string | PostgreSQL connection string used to connect to the PostgreSQL source. | `"impala://localhost:21050/database=testdb"` | |
| query | The query sent to PostgreSQL to get the data to store in FeatureBase. | `"select col1, col2, col3 from impala_table;"` | |
| driver | This must be specified and set to `"impala"` | `"impala"` | |


The below table holds the key/value pairs supported in the TOML fields array if you are connecting to kafka:

| Key | Description | Example Value | Default |
|---|---|---|---|
| `source-column` | The column name in the response from `query` that should be used to populate the current field. If `source-column` is not provided, it will default to the value provided in `name`. | `"col1"` | value of `name` |

### Example

Impala `CREATE TABLE` statement:
```
CREATE TABLE testdb.impala_table (idkey int, intf int, stringf string, idf int, stringsetf string, idsetf string);
```

Impala `INSERT` statement:
```
INSERT INTO postgres_table VALUES
	(0, 0, 'a', 0, 'a', '3'),
	(1, 0, 'a', 0, 'c', '4'),
	(2, 0, 'a', 0, 'd', '5');
```


FeatureBase `CREATE TABLE` statement:
```
CREATE TABLE tbl (
    _id id, 
    intf int, 
    stringf string, 
    idf id, 
    stringsetf stringset,
    idsetf idset);
```

TOML configuration file:
```
table = "tbl"
query = "select idkey, intf, stringf, idf, stringsetf, idsetf from testdb.impala_table;"
driver = "impala"
connection-string = "impala://localhost:21050/database=testdb"
batch-size = 1

[[fields]]
name		= "idkey"
source-type	= "string"
primary-key	= true

[[fields]]
name		= "intf"
source-type	= "int"

[[fields]]
name		= "stringf"
source-type	= "string"

[[fields]]
name		= "idf"
source-type	= "id"

[[fields]]
name		= "stringsetf"
source-type	= "stringset"

[[fields]]
name		= "idsetf"
source-type	= "idset"
```