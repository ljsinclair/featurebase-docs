---
title: fbsql loader generic example
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 20
---

# How do I use fbsql loader to import data from a data source?

This example demonstrates how to:
* Create a FeatureBase table ready for ingested data
* Create an Impala, Kafka or PostgreSQL data source
* Create a TOML configuration file for your data source
* Run the fbsql loader command with the TOML configuration file

## Before you begin

{% include /fbsql/fbsql-before-begin.md%}
{% include /fbsql/fb-db-create.md %}
* [FBSQL loader examples](/docs/tools/fbsql/fbsql-loader-eg-home)
* Choose a connection method for your Cloud database:
  * User credentials
  * [Create a Cloud API key](/docs/cloud/cloud-authentication/cloud-auth-create-key)

## Step 1 - connect to your Cloud database

* Open a terminal then substitute your connection details in either of the following commands:

{% include /fbsql/fbsql-eg-cloud-connect-api-user.md %}

## Step 2 - run `loader` command

Substitute your data source type where specified in the following fbsql command:

```
loader-[impala|kafka|postgres] example-config.toml
```

## Next step

THESE WILL BE ADDED TO SQL EXAMPLES
* [Query data from Impala data source]
* [Query data from kafka data source]
* [Query data from PostgreSQL data source]
