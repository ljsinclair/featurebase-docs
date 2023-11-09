---
title: fbsql loader toml config
layout: default
parent: fbsql CLI SQL tool
grand_parent: Tools
nav_order: 14
---

# FBSQL loader TOML configuration file

The fbsql `loader` command relies on an appropriately formatted TOML configuration file that contains:
* FeatureBase target table to insert data
* Connection settings for an Apache Impala, Apache Kafka or PostgreSQL data source
* An optional series of key/value pairs that correspond to target table columns.

## Before you begin

* [Learn about Apache Impala](https://impala.apache.org/){:target="_blank"}
* [Learn about Apache Kafka Confluent Consumer](https://docs.confluent.io/platform/current/clients/consumer.html){:target="_blank"}
* [Learn about PostgreSQL](https://www.postgresql.org/docs/){:target="_blank"}
* [Learn about TOML format](https://toml.io/)
{% include /fbsql/fbsql-before-begin.md%}
{% include /fbsql/fb-db-create.md %}
* [Create a destination table](/docs/sql-guide/statements/statement-table-create)

## TOML syntax

```
# kafka keys

hosts = ["<address:port>",...]
group = "<kafka-confluent-group>"
topics = "<kafka-confluent-topics>"

# connection keys

driver= "<datasource-type>"
connection-string = "<datasource-type>://<datasource-connection-string>"

# data keys

table = "<target-table>"
query = "<select-from-impala-or-postgresql-data-source>"

# Ingest batching keys
batch-size = <integer-value>
batch-max-staleness = "<integer-value><time-unit>"
timeout = "<integer-value><time-unit>"

# Optional target table key/value pairs

[[fields]]
name = "<target-table-column>"
source-type = "<target-table-column-data-type>"
source-column = "<target-table-column>"
[primary-key= "true"]
[source-path = ["<kafka-json-parent-key>", "<json-child-key>"]]
```

## Variables

The following variables appear in the syntax:

| Variable | Description | Example | Additional information |
|---|---|---|---|
| `<address:port>` | URL or IP address and port | `hosts = ["localhost:9092"]` |  |
| `<kafka-confluent-group>` | Kafka confluent group name | `group = "grp"` |[Confluent Hosts documentation](https://docs.confluent.io/platform/current/clients/consumer.html){:target="_blank"} |
| `<kafka-confluent-topics>` | Kafka Confluent topic name  `topics = "events"` | [Confluent Hosts documentation](https://docs.confluent.io/platform/current/clients/consumer.html){:target="_blank"} |
| `<datasource-type>` | Impala or PostgreSQL data source | `driver = "impala"` |  |
| `<datasource-db-name>` | Name of Impala or PostgreSQL database | `connection-string = "postgres://<postgres-username>:<postgres-user-password>@localhost:5432/mydatabase?sslmode=disable"` |  |
| `<target-table>` | Name of FeatureBase target table | `table = "loader-target"` |  |
| `<select-from-data-source>` | Valid SELECT statement on Impala or PostgreSQL data source with results that import to FeatureBase `<target-table>` |  |  |
| `<time-unit>` | [Supported time units](#Supported time units) | `batch-max-staleness = "5s"` |  |
| `<target-table-column>` | Column contained in table defined by `table` key | `name = "event_id"` |  |
| `<target-table-column-data-type>` | Column data type | `source-type = "string"` |  |
| `"<kafka-json-parent-key>", "<json-child-key>"` | Nested JSON object parent and child | `source-path = ["demo", "categories"]` |  |

## Connection keys

| Key | Description | Required | Additional information |
|---|---|---|---|
| `connection-string` | Quoted connection string that includes the data source type | Impala or PostgreSQL | [Data source connection strings](#data-source-connection-strings) |
| `hosts` | One or more Kafka confluent consumer hosts. Use `[]` for multiple hosts | Apache Kafka | [Confluent Hosts documentation](https://docs.confluent.io/platform/current/clients/consumer.html){:target="_blank"} |
| `driver` | Driver required for data source | Impala or PostgreSQL |
| `group` | Kafka consumer group | Kafka | [Confluent Hosts documentation](https://docs.confluent.io/platform/current/clients/consumer.html){:target="_blank"} |
| `topics` | One or more Kafka topics | [Confluent Hosts documentation](https://docs.confluent.io/platform/current/clients/consumer.html){:target="_blank"} |

## Database keys

| Key | Description | Required | Additional information |
|---|---|---|---|
| `table` | Double-quoted target table to insert data | Yes | [CREATE TABLE statement](/docs/sql-guide/statements/statement-table-create) |
| `query` | Valid SQL query to SELECT data from the data source for insertion into the target table | Impala or PostgreSQL |  |

## Batching keys

Data is collected into batches before importing to FeatureBase. Default values are used if batching keys are not supplied.

| Key | Description | Required | Default | Additional information |
|---|---|---|---|---|
| `batch-size` | Integer value representing the maximum size of a batch file containing the data to import. | Yes | 1 | Direct correlation to batch size, speed of import and resource usage |
| `batch-max-staleness` | Maximum length of time the oldest record in a batch can exist before the batch is flushed | Kafka | Can result in timeouts while waiting for datasource |
| `timeout` | Time to wait before batch is flushed | Kafka | `"1s"` | Set `timeout = 0s` to disable |

## Fields

{: .note}
Run [SHOW CREATE TABLE `<tablename>`](/docs/sql-guide/statements/statement-table-create-show) to output column names and data types required for `[[fields]]` key-values.

FeatureBase will supply values from specified `table` key when `[[fields]]` values are not supplied.

| Key | Description | Required | Additional information |
|---|---|---|---|
| `name` | Target column name |  |  |
| `source-type` | Target column data type | [Featurebase data types](/docs/sql-guide/data-types/data-types-home) |  |  |
| `source-column` | Target column name | Optional | When omitted, order of `[[fields]]` key-values are correlated to those in `<target-table>` |
| `primary-key` | Set to `"true"` for FeatureBase `_id` column | Only for `_id` column | Omit for other columns |
| `source-path` | Nested JSON object parent and child | For Kafka | Defaults to `name` if not supplied |

## Additional information

### Supported time-units

One or more `<integer-value><time-unit>` combinations, in descending order.

| Time unit | Declaration | Example |
|---|---|---|
| hour | `h` | 24h30m |
| minute | `m` | 30m45s |
| second | `s` | 45s10ms |
| milliseconds | `ms` | 10ms22us |
| microseconds | `us` | 22us28ns |
| nanoseconds | `ns` | 28ns |

### Impala and PostgreSQL connection strings

* [Impala connection string documentation](https://impala.apache.org/docs/build/html/topics/impala_client.html){:target="_blank"}
* [PostgreSQL connection string documentation](https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-CONNSTRING-URIS){:target="_blank"}

## Further information

* [Apache Impala example]
* [Confluent Kafka example]
* [PostgreSQL example]
* [TOML arrays of tables](https://toml.io/en/v1.0.0#array-of-tables)
* [Learn about fbsql](/docs/tools/fbsql/fbsql-home)
* [Learn how to install fbsql](/docs/tools/fbsql/fbsql-install)
