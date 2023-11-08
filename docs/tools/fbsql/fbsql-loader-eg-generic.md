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

<!-- NEED SOME WAY TO RATIONALISE WHAT'S HERE -- COULD BE JUST HEADINGS AND HYPERLINKS -->

  * [Create table for Impala and Postgres data](/docs/sql-guide/examples/sql-eg-table/sql-eg-table-create-impala-postgres)
  * [Setup an Impala data source and TOML config file](/docs/tools/fbsql/fbsql-loader-eg-impala-source), OR
  * [Setup a Kafka data source and TOML config file](/docs/tools/fbsql/fbsql-loader-eg-kafka-source)

  * [Setup a PostgreSQL data source and TOML config file](/docs/tools/fbsql/fbsql-loader-eg-postgres-source)

## Step 1 - connect to your Cloud database

Substitute your connection details where specified.

{% include /fbsql/fbsql-eg-cloud-connect-api-user.md %}

## Step 2 - run `loader` command

Substitute your data source where specified in the following fbsql command:

```


```

## Next step

THESE WILL BE ADDED TO SQL EXAMPLES
* [Query data from Impala data source]
* [Query data from kafka data source]
* [Query data from PostgreSQL data source]
