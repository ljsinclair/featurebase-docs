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

## Executing queries in the UI

* [Execute a query](/docs/cloud/cloud-query/cloud-query-execute/)

## Manipulating results
After running a query, you will see data populated in a tabular format below the text editor. You are free to explore your data and sort it by the columns returned. If you’d like to hide some of the returned columns, you can click “Columns” directly above the tabular results. 

## Exporting results
You can also export this data to your local machine by clicking “Export” and either downloading a CSV or printing the results.

## Schema browser
The query browser also allows users to browse their tables and schemas for easy reference to the tables and columns they can query. Click on `Schema Browser` at the top of the text editor to see a searchable list of all of your tables. Click on a table to have a searchable list of all the columns in that table populate. This feature allows you to easily pull up the tables and columns that you can query. Please note, this is populated based on the database you selected in the top right corner of the screen. You may also click `CREATE SELECT STATEMENT` here to have a SELECT statement with all columns pasted into the text editor.

## Query history
You can view, search for, and re-run your historical queries. Click `History` at the top of the text editor to see a searchable list of all of your past queries with the most recent shown at the top. This will display the query, the execution time, the rows returned, and when it was run. The color next to each query signifies if the query execution was successful (green), unsuccessful (red), or still running (blue). Clicking on a query will give you two options. You can “replay” a query by clicking on the play button. This will create a new query entry at the top of your history. You can also copy the full query to your clipboard by clicking the copy button. Note that your query history is private to you and can be lost if you clear your browser cache.

## Further information
* [SQL API Reference](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/querySqlDatabase){:target="_blank"}
* [PQL API Reference](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/queryPqlDatabase){:target="_blank"}
* [fbsql CLI Reference](/docs/tools/fbsql/fbsql-home/)
