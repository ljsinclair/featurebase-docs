---
title: Run queries
layout: default
parent: Python client library
grand_parent: Tools
nav_order: 2
---

# How do I connect run queries on my database?

Use the following syntax to connect to your database and run valid SQL queries

## Before you begin

* [Learn about FeatureBase Python client library](/docs/tools/python-client-library/python-client-home)
* [Install FeatureBase Python client library](/docs/tools/python-client-library/python-client-install)
* [Create a Cloud database if required](/docs/cloud/cloud-databases/cloud-db-manage)
* [FeatureBase SQL guide](/docs/sql-guide/sql-guide-home)

## Syntax

```sh

# import fbpy-lib
import featurebase
# create default client
[c_]client = featurebase.client(
  hostport = "<host:port>"
  database = "<database-id>"
  apikey = "<api-key-secret>"
  cafile = "<certificate-file-path>"
  capath = "<certificate-folder>"
  origin = "<community-origin>"
  timeout = "<int-value>"
)
# basic-sql-query
result=client.query(sql="<sql-query>")
```

## Required keywords

| Keywords | Description | Required? | Additional information |
|---|---|---|---|
| `c_` | prefix used for FeatureBase Cloud connections | For Cloud |  |
| `client = featurebase.client` | Defines featurebase.client and optional flags | Yes | Use `featurebase.client()` to connect to Community instance on same host  |

## Optional connection keywords

{: .note}
Keywords can be omitted when connecting to FeatureBase Community installed on the same host.

| Keywords | Description | Default | Required? | Additional information |
|---|---|---|---|---|
| hostport | Hostname and port for your FeatureBase instance | Cloud: `query.featurebase.com/v2`<br/>Community: `localhost:10101` (default) | For Cloud or Community on different host |  |
| database | Cloud database ID |   | For Cloud | [Cloud ID database details page](/docs/cloud/cloud-databases/cloud-db-details) |
| apikey | Cloud API key secret key |  | For Cloud or Community on different host | [Create a Cloud API key](/docs/cloud/cloud-authentication/cloud-auth-create-key) |
| cafile | Fully qualified CA certificate file path |   | For Community on different host | |  |
| capath | Community fully qualified CA certificate folder |  | For Community on different host |  |
| origin |  |  |  |  |
| timeout | Integer value that represents number of seconds before connection timeout |  | Optional |  |

## SQL query keywords

| Keywords | Description | Additional information |
|---|---|---|
| `result=client.query(sql="<sql-query>")` | Use python client library to run a SQL query on the connected database |  |
| `<sql-query>` | Double-quoted SQL query | [Escape double quotes within the `<sql-query>`](https://www.w3schools.com/python/gloss_python_escape_characters.asp) |

## Examples

```py
# import the library
import featurebase

# create a default client that connects to localhost:10101
client = featurebase.client()

# create demo table
result=client.query(sql="CREATE TABLE python_demo(_id ID, keycol INT, val1 STRING, val2 STRING)")

# insert data
result=client.query(sql="INSERT INTO python_demo(_id, keycol, val1, val2) VALUES (1,123,456,'this is val1','this is val2')")

# select statement
result=client.query(sql="SELECT * FROM demo_upload")
```

### Create client object

Import the FeatureBase library and instantiate a client object by calling the client's constructor method.

```python
# import the library
import featurebase

# create a default client that connects to localhost:10101
client = featurebase.client()

# create a client that connects to FeatureBase Cloud
c_client = featurebase.client(
  hostport="query.featurebase.com/v2",
  database="<database_id>",
  apikey="<APIKey_secret>"
  )
```
