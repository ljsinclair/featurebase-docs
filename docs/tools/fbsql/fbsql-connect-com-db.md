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

* [Learn about docopt Command line notation standards](http://docopt.org/){:target="_blank"} used for this page
{% include /fbsql/fbsql-before-begin.md%}
* [Install FBSQL](/docs/tools/fbsql/fbsql-install)
* Startup FeatureBase Community at the CLI:
  * [Startup FeatureBase](/docs/community/com-startup-connect) OR
  * [Startup FeatureBase systemctl service](/docs/community/com-config/com-config-service-fb-manage)
* CD to `*/fbsql/featurebase` directory

## Syntax

```sh
fbsql
  (
    (--host="<hostname>" \ -(p|-port)="<port-num>") |
    (--config=filename.toml)
  )
  [
    --file example.sql |
    --fbsql-loader (impala|kafka|postgres)
  ]
```

## Required Arguments

| Argument | Description | Default | Additional information |
|---|---|---|---|
| `--host="<hostname>"` | Specifies remote host name IP address or URL of the machine on which FeatureBase is running | `localhost` |  |  |
| `-p`<br>`--port` | Specify TCP port or local Unix-domain socket file extension on which FeatureBase is listening for connections. | `10101` | [Set port in featurebase.conf configuration](/docs/community/com-config/com-config-flags) |
{% include /fbsql/fbsql-config-filename-arg.md %}

## Optional arguments

| Argument | Description | Default | Additional information |
|---|---|---|---|
{% include /fbsql/fbsql-load-sql-file-arg.md %}
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
