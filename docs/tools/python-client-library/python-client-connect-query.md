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

* [Learn about FeatureBase Python client library](/docs/tools/python-client-library/python-client-home)
* [Install FeatureBase Python client library](/docs/tools/python-client-library/python-client-install)
* [Create a Cloud database if required](/docs/cloud/cloud-databases/cloud-db-manage)
* [Start FeatureBase Community if required](/docs/community/com-startup-connect)
* [FeatureBase SQL guide](/docs/sql-guide/sql-guide-home)

## Syntax

```py
# Import required libraries
import featurebase

# FeatureBase connection
[c_]client = featurebase.client(
  hostport = "<host:port>"
  database = "<database-id>"
  apikey = "<api-key-secret>"
  cafile = "<certificate-file-path>"
  capath = "<certificate-folder>"
  origin = "<community-origin>"
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

## FeatureBase connection

Call the FeatureBase client constructor method to instantiate a connection

| Keywords | Description | Required | Additional information |
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
| origin | CORS (Cross Origin Resource Sharing) value in FeatureBase configuration file  |  | Optional for Community | Configuration file found in `featurebase/opt/featurebase.conf` |
| timeout | Integer value that represents number of seconds before connection timeout |  | Optional |  |

## Query methods

### Single query

| Keywords | Description | Additional information |
|---|---|---|
| `result=client.query(sql="<sql-query>")` | Run a single SQL query against the connected database | [FeatureBase SQL guide](/docs/sql-guide/sql-guide-home) |
| `<sql-query>` | Double-quoted SQL query | [Escape double quotes within the `<sql-query>`](https://www.w3schools.com/python/gloss_python_escape_characters.asp) |

### Batched queries

| Keyword | Description | Default | Required | Additional information |
|---|---|---|---|---|
| `sqllist[]` | List of SQL queries called by `querybatch` function |  |  |  |
| `sqllist.append("<sql-query>")` | One or more SQL queries to be called by `querybatch` |  | When preceded by `sqllist[]` |  |
| `result=client.querybatch(sqllist,<run-flag>)` | Suffix that calls `sqllist[]` list of individual queries in order with optional `<run-type>` |  |  |
| `asynchronous=True`| Run SQL statements in `sqllist[]` concurrently | False |  |
| `stoponerror=True` | Stop `sqllist[]` execution if a SQL error occurs. | False | Optional | Ignored when `asynchronous=True` |

## Output flags

Output flags:
* return query results on-screen with the [Python `print()` function](#further-information)
* can be used with `if-then` function

| Keywords | Description |
|---|---|
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
  database="<database_id>",
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
# run\ the statements and stop on error
results = client.querybatch(sqllist, stoponerror=True)
if result.ok:
  print("Rows affected:",result.rows_affected,"Execution time:",result.execution_time,"ms")
else:
  print(result.error)
```

##


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


# import the library
import featurebase

# create a default client that connects to localhost:10101
client = featurebase.client()

# create demo table
result=client.query(sql="CREATE TABLE python-demo(_id ID,keycol INT,val1 STRING,val2 STRING)")

# insert data
result=client.query(sql="INSERT INTO python-demo(_id,keycol,val1,val2) VALUES (1,123,'this is val1','this is val2')")

# drop table statement
result=client.query(sql="SELECT * FROM python-demo")
if result.ok:
  print ("Returns:",result.data,"Execution time", result.execution_time, "ms")
else:
  print (" Error:", result.error)

## Further information

* [Python `print()` function](https://realpython.com/python-print/)
