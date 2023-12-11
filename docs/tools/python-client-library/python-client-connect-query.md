---
title: Run queries
layout: default
parent: Python client library
grand_parent: Tools
nav_order: 2
---

# How do I connect run queries on my database?

Connect to your database and run valid SQL queries using the following syntax.

You can add additional Python scripting as required.

## Before you begin

* [Install FeatureBase Python client library](/docs/tools/python-client-library/python-client-install)
* [Create a Cloud database](/docs/cloud/cloud-databases/cloud-db-manage) if required
* [Start FeatureBase Community](/docs/community/com-startup-connect) if required


## Syntax

```py
# Import required libraries
import featurebase

## Connect to FeatureBase cloud
c_client = featurebase.client(
  database = "<database-id>"
  apikey = "<api-key-secret>"
  timeout = "<int-value>"
)

# Connect to FeatureBase Community
client = featurebase.client(
  hostport = "<host:port>"
  database = "<database-id>"
  cafile = "<certificate-file-path>"
  capath = "<certificate-folder>"
  origin = "<cross-origin-resource-sharing>"
  timeout = "<int-value>"
)

# Single query
result=client.query(sql="<sql-query>")

# Batch queries
sqllist=[]
sqllist.append("<sql-query")  # one or more SQL queries on separate lines
results = client.querybatch(sqllist, <run-flag>)

# Output flags
print(result.data)
print(result.error)
print(result.execution_time)
print(result.ok)
print(result.rows_affected)
print(result.schema)
print(result.warnings)
```

## Required libraries

{: .important}
`import featurebase` is required. Add other libraries as necessary.

## Connect to FeatureBase Cloud

| Keywords | Description | Required | Additional information |
|---|---|---|---|
| `c_client = featurebase.client` | Indicates the connection is to FeatureBase Cloud | Yes |  |
| hostport | Hostname and port for your FeatureBase instance | Optional | `query.featurebase.com/v2` |
| database | Cloud database ID | Yes | [Obtain database ID from Database details](/docs/cloud/cloud-databases/cloud-db-details) |
| apikey | Cloud API key secret key | Yes | [Create a Cloud API key](/docs/cloud/cloud-authentication/cloud-auth-create-key) |
| timeout | Integer value that represents number of seconds before connection timeout | Optional |  |

## Connect to FeatureBase Community

{: .note}
Key-values can be found in `featurebase/opt/featurebase.conf`

| Keywords | Description | Required | Additional information |
|---|---|---|---|
| `client = featurebase.client` | Defines featurebase.client and optional flags | Yes | Use `featurebase.client()` to connect to Community instance on same host |
| hostport | Hostname and port for your FeatureBase instance | Optional | Defaults to `localhost:10101` |
| cafile | Fully qualified CA certificate file path | Optional |  |
| capath | Community fully qualified CA certificate folder | Optional |  |
| origin | CORS (Cross Origin Resource Sharing) value in FeatureBase configuration file  | Optional |  |

## Query methods

The [FeatureBase SQL-Guide](/docs/sql-guide/sql-guide-home) contains guidance on valid SQL.

{: .note}
Use [Python escape characters](https://www.w3schools.com/python/gloss_python_escape_characters.asp) to escape double-quotes within any SQL query

### Single query

| Keywords | Description | Required |
|---|---|---|
| `result=client.query(sql="<sql-query>")` | Run a single SQL query against the connected database | Yes |
| `<sql-query>` | Double-quoted SQL query | Yes |

### Batched queries

| Keyword | Description | Required | Additional information |
|---|---|---|---|
| `sqllist[]` | Start of query list to be called by `querybatch` function | Yes |  |  |
| `sqllist.append("<sql-query>")` | Structure for individual SQL queries in the list |  | Yes |  |
| `result=client.querybatch(sqllist,<run-flag>)` | Call `sqllist[]` list of individual queries and modify execution with optional `<run-flag>` | Yes |  |
| `asynchronous=True`| Run flag that concurrently runs SQL statements | Optional | Defaults to `false` |
| `stoponerror=True` | Run flag that stops `sqllist[]` execution if a SQL error occurs. | Optional | Ignored when `asynchronous=True` |

## Output flags

Output flags can be used:
* to output results with [Python `print()` function](https://realpython.com/python-print/){:target="_blank"}
* with an `if-then` function

| Keywords | Description |
|---|---|---|
| `result.ok` | Returns True or False depending on query execution status |
| `result.schema` | Returns schema definition for tables in schema |
| `result.data` | Data rows returned by the connected database |
| `result.error` | Output execution errors from the connected database |
| `result.warnings` | Output server warnings from the connected database |
| `result.execution_time` | Output time taken to execute the queries |
| `result.rows_affected` | Output number of rows created, updated or deleted |

## Examples

## FeatureBase Cloud connection

```py
# Import required libraries
import featurebase

# create a client that connects to FeatureBase Cloud
c_client = featurebase.client(
  hostport="query.featurebase.com/v2",
  database="123456789abcdef",
  apikey="<APIKey_secret>"
  )
```

## FeatureBase Community connection on localhost

```py
# Import required libraries
import featurebase

# FeatureBase connection to localhost:10101
client = featurebase.client()
```

## Single queries with output flags

```py
# create demo table
result=client.query(sql="CREATE TABLE python_demo(_id ID, keycol INT, val1 STRING, val2 STRING)")
  print(result.ok)

# insert data
result=client.query(sql="INSERT INTO python_demo(_id, intcol, stringcol, idsetcol) VALUES (1,123,'row1, stringcolumn',[100,200,300,400])")
  print ("Rows affected:",result.rows_affected,"Execution time:",result.execution_time,"ms")

# select statement
result=client.query(sql="SELECT * FROM python_demo")
  print(result.data)
```

## Batch queries with if-then function output flags

```py
# SQL statements to run in sequence
sqllist=[]
sqllist.append("INSERT INTO python-demo (_id, intcol, stringcol, idsetcol) VALUES (2,234,'row2, stringcolumn',[500,600,700,800])")
sqllist.append("INSERT INTO python-demo (_id, intcol, stringcol, idsetcol) VALUES (3,345,'row3, stringcolumn',[900,1000,1100,1200])")

# run the statements then stop on error
results = client.querybatch(sqllist, stoponerror=True)
if result.ok:
  print("Rows affected:",result.rows_affected,"Execution time:",result.execution_time,"ms")
else:
  print(result.error)
```
