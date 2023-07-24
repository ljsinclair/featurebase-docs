---
title: Startup FBSQL and connect to db
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 3
---

# How do I connect to a FeatureBase database in FBSQL

Startup FBSQL and connect to a database immediately

## Before you begin

{% include /fbsql/fbsql-before-begin.md%}
{% include /fbsql/fbsql-before-begin-install-connect.md %}
* Ensure the FeatureBase database is running:
  * [Check FeatureBase Community database status](/docs/community/com-config/com-config-service-fb-manage), and/or
  * [Login to FeatureBase Cloud](/docs/cloud/cloud-login)
* Open a CLI then CD to `fbsql/featurebase`

## Syntax

```sh
fbsql
    (
      ((-d|-dbname) featurebase-com) |
      (--host="<hostname>" \
        (--port=10101)
        (--api-key="<public-key>" |
          --email="user@example.com" \ --password="a1b2c3d4e5f6"
        )
      ) |
      ( --config=filename.toml)
    )
```

## Arguments

| Argument | Description | Default | Additional information |
|---|---|---|
| `-d`<br/>`-featurebase-com` | Connect to locally hosted FeatureBase Community database. | FeatureBase | Database name found in `*/featurebase/opt/featurebase.conf`**name** parameter |
| `--host="<hostname>"` | Specifies remote host name IP address or URL of the machine on which FeatureBase is running | `localhost` |  | |
| `--api-key="<public-key>"` | API public key flag that can be used for authn/authz for cloud |  | [Obtain Cloud API key](#obtain-cloud-api-key-additional) |
| `--email="user@example.com" \ --password="a1b2c3d4e5f6"` | User email and password credentials for FeatureBase application |  | [Obtain user credentials](#obtain user-credentials) |
| `--config=filename.toml` | Designate a TOML file containing connection details |  | [TOML connection file](#toml-connection-file)

## Additional information

### Obtain Cloud API key

There are several ways to create an API key for your FeatureBase Cloud account:

* [Create Cloud API key via API](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/postKey)
* [Create a Cloud API key](/docs/cloud/cloud-auth/cloud-auth-manage)
* [Create a Community API key](/docs/community/com-auth/com-auth-key)

### Obtain user credentials

* [Create Cloud users](/docs/cloud/cloud-users/cloud-users-manage)
* [Setup Community users in a group](/docs/community/com-auth/com-auth-manage)

### TOML connection file

The TOML connection file can be saved in the `*/fbsql/featurebase` directory or in an accessible file path.

It must contain:
* a valid combination of arguments and values in form `argument = "value"`,
* on individual lines,
* with leading `--` and trailing `\` omitted.

### FBSQL status

FBSQL displays status information at startup

| Status | Description | Additional information |
|---|---|---|
| Detected on-prem, classic deployment | FeatureBase Community started<br/>Host:http://<hostname>:10101 | [Manage FeatureBase Community systemctl service](/docs/community/com-config/com-service-fb-manage) |
| Could not detect deployment<br/>Host:http://<hostname> | FeatureBase Community service stopped | [Manage FeatureBase Community systemctl service](/docs/community/com-config/com-service-fb-manage) |
| You are not connected to a database | Not connected to remote database |  |
| connecting to database: invalid database: dbname | error in database name |  |

## Examples

### `cloud.toml` connection file

```toml
host = "https://query.featurebase.com"
email     = 'user@example.com'
password  = 'a1b2c3d4e5f6'
```

```toml
host = "https://query.featurebase.com"
api-key="asdf-f345-sg-hjyjk-345323"
```

### `local.toml` connection file

```toml
host = "localhost"
port = "10101"
```

### Connect using `cloud.toml`

```sh
fbsql --config=cloud.toml
```

### Connect using `local.toml`

```sh
fbsql --config=local.toml
```

### Connect to FeatureBase community database on same machine

```sh
fbsql -d featurebase
```

### Connect using command-line flags and user credentials

```sh
fbsql --host="https://query.featurebase.com" \
  --email="user@example.com" \
  --password="a1b2c3d4e5f6"
```

### Connect using command-line flags and API key

```sh
fbsql --host="https://query.featurebase.com" \
  --api-key="asdf-f345-sg-hjyjk-345323"
```
