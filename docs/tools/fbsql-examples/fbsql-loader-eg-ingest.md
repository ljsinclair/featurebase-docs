---
title: fbsql loader ingest example
layout: default
parent: fbsql loader examples
grand_parent: Tools
nav_order: 4
---

# How do I use the fbsql `loader` command to import data?

This example demonstrates how to run the `loader` command:
* with a TOML configuration file setup with data source and target details
* to import data from a specified data source to an existing target table

## Before you begin

{% include /fbsql/fbsql-before-begin.md%}
{% include /fbsql/fb-db-create.md %}
* [fbsql loader syntax](/docs/tools/fbsql/fbsql-loader-command)
* [FBSQL loader examples]( /docs/tools/fbsql-examples/fbsql-loader-eg-home)
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

QUERY DATA
