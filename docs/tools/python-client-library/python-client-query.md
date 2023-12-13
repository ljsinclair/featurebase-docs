---
title: Query your database
layout: default
parent: Python client library
grand_parent: Tools
nav_order: 4
---

# How do I connect run queries on my database?

Query the connected database with individual queries or as a batch that can be run sequentially, or asynchronously.

## Before you begin

* [FeatureBase SQL guide](/docs/sql-guide/sql-guide-home)
* [Install FeatureBase Python client library](/docs/tools/python-client-library/python-client-install)
{% include /tools-python/python-db-setup-before-begin.md %}
* Connect to your database
  * [Learn how to connect to FeatureBase Cloud with the Python client](/docs/tools/python-client-library/python-client-connect-cloud), OR
  * [Learn how to connect to FeatureBase Community with the Python client](/docs/tools/python-client-library/python-client-connect-community)

## Syntax

```py
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

{: .note}
Use [Python escape characters](https://www.w3schools.com/python/gloss_python_escape_characters.asp) to escape double-quotes within any SQL query

## Single query keywords

| Keywords | Description | Required | Additional information |
|---|---|---|---|
| `result=client.query(sql="<sql-query>")` | Run a single SQL query against the connected database | Yes | Use `c_client` for Cloud queries |
| `<sql-query>` | Double-quoted SQL query | Yes | [FeatureBase SQL guide](/docs/sql-guide/sql-guide-home) |

## Batched query keywords

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

* [Python Client library examples](/docs/tools/python-client-library/python-client-example)
