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

* Choose a data source example to set up:
  * [Learn how to setup an Impala data source and TOML config file](/docs/tools/fbsql/fbsql-loader-eg-impala-source)
  * [Learn how to setup a Kafka data source and TOML config file](/docs/tools/fbsql/fbsql-loader-eg-kafka-source)
  * [Learn how to setup a PostgreSQL data source and TOML config file](/docs/tools/fbsql/fbsql-loader-eg-postgres-source)

* Choose a connection method for your Cloud database:
  * User credentials
  * [Learn how to create a Cloud API key](/docs/cloud/cloud-authentication/cloud-auth-create-key)

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
