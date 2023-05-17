---
title: Python client library
layout: default
parent: Tools
has_children: true
nav_order: 2
has_toc: false
---

# Python client library

The python client library is a python package containing components needed to access FeatureBase databases from your python applications. It provides a simple client class that represents a connection to a FeatureBase database. This connection class exposes a small set of public methods for the application to submit queries against the FeatureBase database. 

{% include /tools-python/python-release-note.md %}

## Before you begin

{% include /cloud/cloud-before-begin.md %}, Or
{% include /com-install/com-install-before-begin.md %}

## Install python client library

* [Learn How To Install python client library](/docs/tools/python-client-library/python-client-install)

## Client object parameters

The following parameters can be used with the client constructor method. All parameters are optional.

| Parameter | Description | Default |
|---|---|---|
| `hostport` | Hostname and port number of your FeatureBase instance, it should be passed in `host:port` | `localhost:10101` |
| `database` | Database id of your FeatureBase cloud instance |  |
| `apikey` | [Cloud API key](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/postKey) that can be used for authn/authz for cloud |  |
| `cafile` | Fully qualified certificate file path |  |
| `capath` | Fully qualified certificate folder |  |
| `origin` | Request origin, should be one of the allowed origins defined for your FeatureBase instance |  |
| `timeout` | Number of seconds to wait before timing out on server connection attempts |  |

## Usage

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

### Submit a single SQL query

The `client.query()` method accepts a single SQL query and submits it to the server for execution, it returns a simple result object providing access to data, status and warnings.

```python
result = client.query("SELECT * from demo;")
if result.ok: 
    print(result.data)
```

### Submit a batch of SQL queries

The `client.querybatch()` method accepts a list of SQL queries and submits them for synchronous or asynchronous execution and returns the results as a list of result objects. By default the queries are synchronously executed one at a time in the input order.

| Parameter | Description | Default |
|---|---|---|
| sqllist | List of SQL queries |  |
| asynchronous | Boolean flag that indicates whether the SQL statements should be run concurrently or sequentially | `False` |
| stoponerror | Boolean flag that indicates what to do when a SQL error occurs. Passing `True` will stop executing remaining SQLs in the input list. This parameter is ignored when asynchronous=True | `False` |

### Synchronously run the queries in a batch

Synchronous runs are best suited for executing DDL and DML queries that need to follow specific run orders.

```python
# create a list of SQL statements. 
sqllist=[]
sqllist.append("CREATE TABLE demo1(_id id, i1 int);")
sqllist.append("INSERT INTO demo1(_id, i1) VALUES(1, 100);")
sqllist.append("INSERT INTO demo1(_id, i1) VALUES(2, 200);")
sqllist.append("select * from demo1;")
#submit the list for synchronous execution and 
#instruct the client to stop when there is an error.
results = client.querybatch(sqllist, stoponerror=True)
for result in results:
    if result.ok: 
        print(result.data)
```                

### Asynchronously run the queries in a batch 

Asynchronous runs are best suited for running SELECT queries that can be run concurrently.

```python
# create a list of SQL statements. 
sqllist=[]
sqllist.append("SELECT * from demo1;")
sqllist.append("SELECT count(*) from demo1;")
sqllist.append("SELECT max(i1) from demo1;")
#submit the list for asynchronous execution.
results = client.querybatch(sqllist, asynchronous=True)
for result in results:
    if result.ok: 
        print(result.data)
```

### Result object

Result is a simple data object representing the results of a SQL query. It contains the following attributes.

| Attribute | Description | 
|---|---|
| `ok` | Boolean indicating query execution status |
| `schema` | Field definitions for the result data |
| `data` | Data rows returned by the server |
| `error` | Error information with a code and description |
| `warnings` | Warning information returned by the server |
| `execution_time` | Amount of time (microseconds) it took for the server to execute the SQL |

## Further Information

* [SQL guide](/docs/sql-guide/sql-guide-home)