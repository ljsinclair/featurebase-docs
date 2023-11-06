---
title: fbsql loader command
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 20
---

# fbsql loader command

The fbsql `loader` command:
* specifies a supported data source type
* reads configuration settings from a specified TOML configuration file


## Before you begin

{% include /fbsql/fbsql-before-begin.md%}
{% include /fbsql/fb-db-create.md %}
* [Learn how to setup a TOML configuration file](/docs/tools/fbsql/fsql-loader-toml-config)

## Syntax

```sh
(<cli-flag-prefix>)
  <db-connection-string> \
(--loader-<data-source>) <filename>.toml
```

{% include /fbsql/fbsql-prefix-cli-flags.md %}

## Arguments

| Argument | Description | Required | Additional information |
|---|---|---|---|
| `<db-connection-string>` | fbsql connection string to FeatureBase database | Yes | * [fbsql connect to FeatureBase Cloud](/docs/tools/fbsql/fbsql-connect-cloud-db)<br/>* [fbsql connect to FeatureBase Community](/docs/tools/fbsql/fbsql-connect-com-db) |
| `--loader-<datasource>=<filename>.toml` | Provide data source type and filename containing TOML configuration | [TOML configuration file for fbsql loader](/docs/tools/fbsql/ fbsql-loader-toml-config-impala) |

## Additional information

### fbsql loader operations

| Data source | Operation |
|---|---|
| Kafka | Reads messages from Kafka topic specified in TOML configuration |
| Impala or PostgreSQL | Reads tuples from SELECT statement included in TOML configuration |

## Examples

* Impala
* Kafka
* PostgreSQL
