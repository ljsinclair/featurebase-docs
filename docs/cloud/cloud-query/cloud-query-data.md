---
title: Query data
layout: default
parent: Cloud
has_children: true
nav_order: 6
has_toc: false
---

# How do I query data in FeatureBase Cloud?
{: .no_toc }

This page provides an overview of how you can query your FeatureBase databases and links to guide you through the process of querying.

Querying data in FeatureBase is like most other databases in that you issue queries using either the standard [SQL Language](/docs/sql-guide/sql-guide-home) or our native [PQL Language](/docs/pql-guide/pql-home)

{% include page-toc.md %}

## Before you begin

{% include /cloud-db/cloud-db-dependencies.md %}
* [Learn how to import data to FeatureBase](/docs/cloud/cloud-ingest/cloud-ingest-manage)
* [Learn about SQL](/docs/sql-guide/sql-guide-home)

## The query endpoint

All queries in FeatureBase Cloud go through [the query endpoint](https://api-docs-featurebase-cloud.redoc.ly/latest#tag/Query){:target="_blank"}. The query endpoint is a synchronous call that streams your data back as it is returned by FeatureBase. There are current limitations to this query endpoint you should be mindful of:

{% include /cloud-query/cloud-query-limits.md %}

## Using the query page in the UI

* [Execute a query](/docs/cloud/cloud-query/cloud-query-execute/)
* [Use the schema browser](/docs/cloud/cloud-query/cloud-query-schema-browser/)
* [Use the query history](/docs/cloud/cloud-query/cloud-query-history/)

## Manipulating results
After running a query, you will see data populated in a tabular format below the text editor. You are free to explore your data and sort it by the columns returned. If you’d like to hide some of the returned columns, you can click **Columns** directly above the tabular results. 

## Exporting results
You can also export this data to your local machine by clicking **Export** and either downloading a CSV or printing the results.

## Further information
* [SQL API Reference](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/querySqlDatabase){:target="_blank"}
* [PQL API Reference](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/queryPqlDatabase){:target="_blank"}
* [fbsql CLI Reference](/docs/tools/fbsql/fbsql-home/)
