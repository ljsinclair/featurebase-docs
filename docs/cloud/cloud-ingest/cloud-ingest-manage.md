---
title: Manage cloud ingestion
layout: default
parent: Cloud
has_children: false
nav_order: 8
has_toc: false
---

# How do I import data to my FeatureBase Cloud database?
{: .no_toc }

There are several ways to import data to an existing table in your database.

## Before you begin

* [Signup to FeatureBase Cloud](/docs/cloud/cloud-org/cloud-signup)
* [Learn how to connect to Cloud](/docs/cloud/cloud-db-connect/cloud-db-connect)
* [Learn how to create databases](/docs/cloud/cloud-databases/cloud-db-manage)
* [Learn how to create Cloud tables](/docs/cloud/cloud-tables/cloud-table-manage)

## What data sources can I import to FeatureBase Cloud?

| Data source | Method |
|---|---|
| CSV | [Cloud GUI](/docs/cloud/cloud-ingest/cloud-table-upload-data)<br/>[SQL statements](#how-do-i-use-sql-to-import-data) |
| Inline | [SQL statements](#how-do-i-use-sql-to-import-data) |
| ndjson | [SQL statements](#how-do-i-use-sql-to-import-data) |
| orc | [SQL statements](#how-do-i-use-sql-to-import-data) |
| parquet | [SQL statements](#how-do-i-use-sql-to-import-data) |

## How do I use SQL to import data?

{% include /cloud/cloud-query-methods.md %}

| Data source | Statement |
|---|---|
| CSV | [BULK INSERT](/docs/sql-guide/statements/statement-insert-bulk) |
| Inline | [INSERT()](/docs/sql-guide/statements/statement-insert)<br/>[BULK INSERT](/docs/sql-guide/statements/statement-insert-bulk) |
| ndJSON | [BULK INSERT](/docs/sql-guide/statements/statement-insert-bulk) |
| Orc | [BULK INSERT](/docs/sql-guide/statements/statement-insert-bulk) |
| Parquet | [BULK INSERT](/docs/sql-guide/statements/statement-insert-bulk) |
