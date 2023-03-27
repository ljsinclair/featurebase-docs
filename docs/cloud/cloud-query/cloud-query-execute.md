---
title: Execute queries 
layout: default
parent: Query data
grand_parent: Cloud
nav_order: 1
has_toc: false
---
# How do I execute my queries in the FeatureBase Cloud UI?
{: .no_toc }

{% include page-toc.md %}

{: .note }
You can also query data programmatically with [the query endpoint](https://api-docs-featurebase-cloud.redoc.ly/latest#tag/Query)

## Before you begin

{% include /cloud-query/cloud-before-query.md %}
* Click **Query** to navigate to query editor

## Step 1: Select database to query

{% include /cloud-query/cloud-query-choose-db.md %}

## Step 2: Choose query limit

{% include /cloud-query/cloud-query-choose-rec-limit.md %}

## Step 3: Write query in text editor 

Write a query using either the standard [SQL Language](/docs/sql-guide/sql-guide-home) or our native [PQL Language](/docs/pql-guide/pql-home) in the text editor. The text editor allows for multiple queries to exist in the same pane. Individual queries are separated by newlines with only whitespace.

## Step 4: Execute the query

{% include /cloud-query/cloud-query-execute.md %}

## Further information
* [Use the schema browser](/docs/cloud/cloud-query/cloud-query-schema-browser/)
* [Use the query history](/docs/cloud/cloud-query/cloud-query-history/)
* [Query API reference](https://api-docs-featurebase-cloud.redoc.ly/latest#tag/Query)
* [fbsql CLI Reference](/docs/tools/fbsql/fbsql-home/)

