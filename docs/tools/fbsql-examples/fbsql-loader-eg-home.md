---
title: fbsql loader examples
layout: default
has_children: true
parent: Tools
nav_order: 2
has_toc: false
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
* [Learn about fbsql TOML configuration](/docs/tools/fbsql/fbsql-loader-config)
* Choose a connection method for your Cloud database:
  * User credentials
  * [Learn how to create a Cloud API key](/docs/cloud/cloud-authentication/cloud-auth-create-key)

## Step one - create your destination table

Choose one of the following tables:
* [Create a table for Impala or PostgreSQL data source](/docs/sql-guide/examples/sql-eg-table/sql-eg-table-create-impala-postgres)
* [Create a table for Kafka data source](/docs/sql-guide/examples/sql-eg-table/sql-eg-table-create-kafka)

## Step two - create your data source and TOML configuration file

* [Set up an Apache Impala data source and TOML configuration file]( /docs/tools/fbsql-examples/fbsql-loader-eg-impala-source)
* [Set up an Apache Kafka data source and TOML configuration file]( /docs/tools/fbsql-examples/fbsql-loader-eg-kafka-source)
* [Set up a PostgreSQL data source and TOML configuration file]( /docs/tools/fbsql-examples/fbsql-loader-eg-postgres-source)

## Step three - run fbsql loader

* [Run fbsql loader with your TOML configuration file]( /docs/tools/fbsql-examples/fbsql-loader-eg-ingest)
