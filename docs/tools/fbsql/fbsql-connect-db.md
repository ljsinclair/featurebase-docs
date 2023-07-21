---
title: FBSQL connect to db
layout: default
parent: fbsql
grand_parent: Tools
nav_order: 3
---

# How do I connect to a FeatureBase database in FBSQL

## Before you begin

{% include /fbsql/fbsql-before-begin.md%}
* [Install FBSQL](/docs/tools/fbsql/fbsql-install)
* Obtain connection IP or database name for the database
* Obtain authentication information, either API key or login credentials

## Syntax

```sh
fbsql
    (
      ((-d|-dbname) featurebase) |
      (--host="<hostname>" \
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
| `-d`<br/>`-featurebase` | Flag to connect to named database.  | FeatureBase | | [Change default name in FeatureBase Community configuration](/docs/community/com-config/) |
| `--host="<hostname>"` | Specifies the host name IP address or URL of the machine on which the server is running | `localhost` |  |  |
| `--api-key="<public-key>"` | API public key flag that can be used for authn/authz for cloud |  | * [Create Cloud API key via API](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/postKey)<br/>* [Create a Cloud API key](/docs/cloud/cloud-auth/cloud-auth-manage)<br/>* [Create a Community API key](/docs/community/com-auth/com-auth-key) |
| `--email="user@example.com" \ --password="a1b2c3d4e5f6"` | User email and password credentials for FeatureBase application |  | * [Create Cloud users](/docs/cloud/cloud-users/cloud-users-manage)<br/>*[Setup Community users in a group](/docs/community/com-auth/com-auth-manage) |
| `--config=filename.toml` | Designate a TOML file containing connection details |  | [TOML connection file](#toml-connection-file)

## Additional information

### TOML connection file

The TOML connection file can contain valid combinations of:
* connection arguments with leading `--` removed
* valid values

## Examples

### TOML connection file

```toml
host = "https://query.featurebase.com"
email     = 'user@example.com'
password  = 'a1b2c3d4e5f6'
```

```toml
host = "https://query.featurebase.com"
api-key="asdf-f345-sg-hjyjk-345323"
```

### Connect using TOML configuration file

```sh
fbsql --config=cloud.toml
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
