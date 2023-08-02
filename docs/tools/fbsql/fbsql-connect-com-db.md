---
title: Connect to community db
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 3
---

# How do I connect to a FeatureBase Community database with FBSQL?

Connect to a FeatureBase Community database with FBSQL.

## Before you begin

{% include /fbsql/fbsql-before-begin.md%}
* [Startup FeatureBase Community](/docs/community/com-home#startup-featurebase-community), OR
* [Verify your FeatureBase Cloud database is running](/docs/cloud/cloud-login)
{% include /fbsql/fbsql-help-quit.md %}

## Syntax

```sh
(<cli-flag-prefix>)
  (
    (--host="<community-hostname" / -[p|-port]=<port> ) |
    --config=<filename.toml>
  )
  [
    -[f|-file] <filename> |
    --fbsql-loader (impala|kafka|postgres)
  ]
```

{% include /fbsql/fbsql-prefix-cli-flags.md %}

## Database connection flags

{: .note}
FBSQL automatically connects to a local instance of FeatureBase Community

| Argument | Description | Requires | Default | Additional information |
|---|---|---|---|
| `--host="<hostname>"` | Specifies remote host name IP address or URL of the machine on which FeatureBase is running | port specification | `localhost` |  |
| `-p`<br>`--port` | Specify TCP port or local Unix-domain socket file extension on which FeatureBase is listening for connections. | Host specification | `10101` | [Set port in featurebase.conf configuration](/docs/community/com-config/com-config-flags) |
{% include /fbsql/fbsql-config-filename-arg.md %}

## Optional arguments

### Load SQL from a source file

{% include /fbsql/fbsql-load-sql-file-arg.md %}

### Load data to FeatureBase from specified data source

{% include /fbsql/fbsql-loader-arg.md %}

## Additional information

{% include /fbsql/fbsql-toml-connection-file-extra.md %}

{% include /fbsql/fbsql-status-table.md %}

## Examples

### Connect to FeatureBase community database

```sh
fbsql --host="localhost" \ --port="10101"
```

### Connect with host/port in file

Source file `local.toml`
```toml
host = "localhost"
port = "10101"
```
Connection string:
```sh
fbsql --config=local.toml
```

## Next step

* [Specify a database to run SQL against](/docs/tools/fbsql/fbsql-running-sql)
