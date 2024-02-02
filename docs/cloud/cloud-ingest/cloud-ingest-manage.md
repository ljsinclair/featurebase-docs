---
title: Manage data
layout: default
has_children: false
nav_order: 7
has_toc: false
---

# How do I add data to my FeatureBase Cloud database?
{: .no_toc }

There are several ways to add data to an existing table in your database.

## Before you begin

* [Signup to FeatureBase Cloud](/docs/cloud/cloud-getstart/cloud-signup)
* [Learn how to connect to Cloud](/docs/cloud/cloud-getstart/cloud-db-connect)
* [Learn how to create databases](/docs/cloud/cloud-databases/cloud-db-manage)
* [Learn how to create Cloud tables](/docs/cloud/cloud-tables/cloud-table-manage)

## Which data sources are supported by FeatureBase?

| Data source | Method |
|---|---|
| CSV | [Cloud GUI](/docs/cloud/cloud-ingest/cloud-table-upload-data)<br/>[SQL statements](#how-do-i-use-sql-to-import-data) |
| Inline | [SQL statements](#how-do-i-use-sql-to-import-data) |
| ndjson | [SQL statements](#how-do-i-use-sql-to-import-data) |
| orc | [SQL statements](#how-do-i-use-sql-to-import-data) |
| parquet | [SQL statements](#how-do-i-use-sql-to-import-data) |

## Is existing data overwritten or lost during import?

Featurebase **does not** directly interface with your source data. Instead, FeatureBase reads data from a supported data source, and upserts to destination tables:

| If rows contain... | Data is... |
|---|---|
| No data | Data is inserted from data source |
| Existing data | Row is updated from data source |

## How do I use SQL to import data?

{% include /cloud/cloud-query-methods.md %}

| Data source | Statement |
|---|---|
| CSV | [BULK INSERT](/docs/sql-guide/statements/statement-insert-bulk) |
| Inline | [INSERT()](/docs/sql-guide/statements/statement-insert)<br/>[BULK INSERT](/docs/sql-guide/statements/statement-insert-bulk) |
| ndJSON | [BULK INSERT](/docs/sql-guide/statements/statement-insert-bulk) |
| Orc | [BULK INSERT](/docs/sql-guide/statements/statement-insert-bulk) |
| Parquet | [BULK INSERT](/docs/sql-guide/statements/statement-insert-bulk) |
