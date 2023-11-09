---
title: fbsql loader generic example
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 20
---

# Import data from a specified data source

This example demonstrates how to use fbsql to:
* Connect to your FeatureBase Cloud account via API key or user credentials
* Import data to an existing table from a specified data source

## Before you begin

{% include /fbsql/fbsql-before-begin.md%}
{% include /fbsql/fb-db-create.md %}
* [Learn about fbsql TOML configuration](/docs/tools/fbsql/fbsql-loader-config)
* Choose a connection method for your Cloud database:
  * User credentials
  * [Learn how to create a Cloud API key](/docs/cloud/cloud-authentication/cloud-auth-create-key)

## Step one - create your destination table

Choose one of the following tables:
* [Create a table for Impala or PostgreSQL data source](/docs/sql-guide/examples/sql-eg-table/sql-eg-table-create-impala-postgres)
* [Create a table for Kafka data source](/docs/sql-guide/examples/sql-eg-table/sql-eg-table-create-kafka)

## Step two - create your data source and TOML configuration file

* [Set up an Apache Impala data source and TOML configuration file](/docs/tools/fbsql/examples/fbsql-loader-impala-source)
* [Set up an Apache Kafka data source and TOML configuration file](/docs/tools/fbsql/examples/fbsql-loader-kafka-source)
* [Set up a PostgreSQL data source and TOML configuration file](/docs/tools/fbsql/examples/fbsql-loader-postgres-source)

## Step three - run fbsql loader

* [Run ]

## Step 1 - connect to your Cloud database

You can connect to your Cloud database using an API key or user credentials.

* Open a terminal then substitute your connection details in either of the following commands:

{% include /fbsql/fbsql-eg-cloud-connect-api-user.md %}

## Step 2 - run `loader` command

Substitute your data source where specified in the following fbsql command:

```
loader-[impala|kafka|postgres]
```

## Next step

THESE WILL BE ADDED TO SQL EXAMPLES
* [Query data from Impala data source]
* [Query data from kafka data source]
* [Query data from PostgreSQL data source]
