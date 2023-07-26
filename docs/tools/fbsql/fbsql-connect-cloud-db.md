---
title: Connect to cloud db
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 3
---

# How do I login to a FeatureBase cloud database in FBSQL?

Login to your FeatureBase cloud database when you startup FBSQL.

## Before you begin

{% include /fbsql/fbsql-before-begin.md%}
{% include * [install FBSQL](/docs/tools/fbsql/fbsql-install) %}
* [Login to FeatureBase Cloud](/docs/cloud/cloud-login) to verify your system is running
* Open a CLI then CD to `fbsql/featurebase`

## Syntax

```sh
fbsql
  (
    (
    --host="<hostname>" \
    -(p|-port)="<port-num>"\
    )
    (
      [--api-key="<public-key>"] |
      [--email="user-email" \ --password="<user-pass"] |
      [--config=filename.toml]
    )
    [
      --file example.sql |
      --fbsql-loader (impala|kafka|postgres)
    ]
  )
```

## Arguments

| Argument | Description | Default | Additional information |
|---|---|---|
| `-d`<br/>`-featurebase-com` | Connect to locally hosted FeatureBase Community database. | FeatureBase | Database name found in `*/featurebase/opt/featurebase.conf`**name** parameter |
| `--host="<hostname>"` | Specifies remote host name IP address or URL of the machine on which FeatureBase is running | `localhost` |  | |
| `-p`<br>`--port` | Specify TCP port or local Unix-domain socket file extension on which FeatureBase is listening for connections. | Local: `10101`<br/>Cloud serverless: `8080` |  |
| `--api-key="<public-key>"` | API public key flag that can be used for authn/authz for cloud |  | [Obtain Cloud API key](#obtain-cloud-api-key-additional) |
| `--email="user@example.com" \ --password="a1b2c3d4e5f6"` | User email and password credentials for FeatureBase application |  | [Create Cloud users](/docs/cloud/cloud-users/cloud-users-manage)
 |
{% include /fbsql/fbsql-config-filename-arg.md %}
{% include /fbsql/fbsql-load-sql-file-arg.md %}
{% include /fbsql/fbsql-loader-arg.md %}

## Additional information

### Obtain Cloud API key

There are several ways to create an API key for your FeatureBase Cloud account:

* [Create Cloud API key via API](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/postKey)
* [Create a Cloud API key](/docs/cloud/cloud-auth/cloud-auth-manage)
* [Create a Community API key](/docs/community/com-auth/com-auth-key)

{% include /fbsql/fbsql-toml-connection-file-extra.md %}

{% include /fbsql/fbsql-status-table.md %}

## Examples

### Connect with API key

```sh
fbsql --host="https://query.featurebase.com" \
--api-key="asdf-f345-sg-hjyjk-345323"
```

### Connect with user credentials

```sh
fbsql --host="https://query.featurebase.com" \
--email="user@example.com" \
--password="a1b2c3d4e5f6"
```

### Connect with API key in file

Source file: `cloud-api-connect.toml`
```toml
host = "https://query.featurebase.com"
api-key="asdf-f345-sg-hjyjk-345323"
```
Connection string:
```sh
fbsql --config=cloud-user-connect.toml
```

### Connect with user credentials in file

Source file: `cloud-user-connect.toml`
```toml
host = "https://query.featurebase.com"
email     = 'user@example.com'
password  = 'a1b2c3d4e5f6'
```
Connection string:
```sh
fbsql --config=cloud-user-connect.toml
```

## Next step

* [Specify a database to run SQL against](/docs/tools/fbsql/fbsql-running-sql)
