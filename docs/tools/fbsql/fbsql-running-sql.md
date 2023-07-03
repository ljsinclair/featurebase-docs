---
title: Running SQL queries
layout: default
parent: fbsql
grand_parent: Tools
nav_order: 2
---

# How do I run SQL queries with FBSQL?


## Before you begin

* [Learn about FBSQL](/docs/tools/fbsql/fbsql-home)
* [Install FBSQL](/docs/tools/fbsql/fbsql-install)


CUT FROM ORIGINAL FBSQL HOME


## fbsql flags

The following flags can be provided when running fbsql. None of the flags are required to start fbsql.

| Flag | Description | Default |
|---|---|---|
| `--api-key` | [Cloud API key](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/postKey) that can be used for authn/authz for cloud as an alternative to `--email` and `--password`.  | |
| `-c`<br>`--command` | Specifies that fbsql is to execute the given command string (enclosed in either single or double quotes). This option can be repeated and combined with the `-f` option. All `-c` options will be processed before all `-f` options are processed. When either `-c` or `-f` is specified, fbsql does not read commands from standard input; instead it terminates after processing all the `-c` and `-f` options in sequence. | |
| `--config` | Configuration file to read from. | |
| `--csv` | Switches to CSV (Comma-Separated Values) output mode. This is equivalent to `\pset format csv`. | |
| `-d`<br>`--dbname` | Specifies the name of the database to connect to. | |
| `--email` | Email address for FeatureBase Cloud access. | |
| `-f`<br>`--file` | Read commands from the file **filename**, rather than standard input. This option can be repeated with the `-c` option. All `-c` options will be processed before all `-f` options are processed. When either `-c` or `-f` is specified, fbsql does not read commands from standard input; instead it terminates after processing all the `-c` and `-f` options in sequence. Except for that, this option is largely equivalent to the meta-command `\i`. | |
| `--history-path` | File in which to store command history. This defaults to `.featurebase/fbsql_history` in the current user's home directory. | |
| `--host` | Specifies the host name of the machine on which the server is running. This can be a URL to a cloud instance of FeatureBase. In that case, the value of **hostname** might be something like `https://query.featurebase.com`. | `localhost`|
| `--loader-impala` | Run fbsql in non-interactive mode to load data from Impala. Based on the configuration file provided as an argument to this flag, fbsql will query Impala and send the data to FeatureBase via BULK INSERT statements. In this mode, fbsql processes messages until all the tuples from Impala are loaded. For more information, see [Load Impala Data With fbsql](/docs/tools/fbsql/fbsql-loaders-impala) | |
| `--loader-kafka` | Run fbsql as a Kafka consumer in non-interactive mode. Based on the configuration file provided as an argument to this flag, fbsql will read messages from a Kafka topic and submit them to FeatureBase via BULK INSERT statements. In this mode, fbsql processes messages until terminated by the user. For more information, see [Load Kafka Data With fbsql](/docs/tools/fbsql/fbsql-loaders-kafka) | |
| `--loader-postgres` | Run fbsql in non-interactive mode to load data from PostgreSQL. Based on the configuration file provided as an argument to this flag, fbsql will query PostgreSQL and send the data to FeatureBase via BULK INSERT statements. In this mode, fbsql processes messages until all the tuples from PostgreSQL are loaded. For more information, see [Load PostgreSQL Data With fbsql](/docs/tools/fbsql/fbsql-loaders-postgres) | |
| `--org-id` | Specified the Organization ID to use. Organizations are a concept used in FeatureBase Cloud, and in that case they are determined automatically based on user authorization. They are exposed here in case on-prem installations want to mimic that functionality. | |
| `--password` | Password for FeatureBase Cloud access. | |
| `-p`<br>`--port` | Specifies the TCP port or the local Unix-domain socket file extension on which FeatureBase is listening for connections. | Attempts to detect `10101` or `8080` (for serverless) |
| `-P`<br>`--pset` | Specifies printing options, in the style of `\pset`. Note that here you have to separate name and value with an equal sign instead of a space. For example, to set the output format to CSV, you could write -P format=csv. | |

## How do I connect to a FeatureBase database?




## How do I run SQL queries?
