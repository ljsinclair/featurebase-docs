---
title: Manage tables
layout: default
has_children: true
nav_order: 6
has_toc: false
---

# How do I manage tables in FeatureBase Cloud?
{: .no_toc }

This page provides an overview of FeatureBase tables and links to guide you through creating, altering and dropping tables.

{% include /faq/summary-table-create.md %}

{% include page-toc.md %}

## Before you begin

{% include /cloud/cloud-before-begin.md %}
* [Learn about FeatureBase bitmaps](/docs/cloud/cloud-faq/cloud-faq-bitmaps)
* [Learn how to manage Cloud databases](/docs/cloud/cloud-databases/cloud-db-manage)

## Data modeling

{% include /faq/summary-data-modeling.md %}

## Table primary key

{% include /cloud-table/cloud-summary-table-pk.md %}

## Column data types and constraints

* [Learn about data types and constraints](/docs/sql-guide/data-types/data-types-home)

## Naming standard

{% include /faq/standard-naming-obj.md%}
{% include /cloud-table/cloud-standard-naming-table.md %}
{% include /cloud-table/cloud-standard-naming-col.md%}

## View tables

* Click **Databases** > database name > **Tables**.

## Managing tables in FeatureBase Cloud

* [Create table](/docs/cloud/cloud-tables/cloud-table-create)
* [Add table columns](/docs/cloud/cloud-tables/cloud-table-add-column)
* [Delete table columns](/docs/cloud/cloud-tables/cloud-table-delete-column)
* [Delete table](/docs/cloud/cloud-tables/cloud-table-delete)

## Managing tables using the Cloud API

* [Table API reference](https://api-docs-featurebase-cloud.redoc.ly/latest#tag/Tables)

## Managing tables using SQL

* [Create table](/docs/sql-guide/statements/statement-table-create)
* [Alter table](/docs/sql-guide/statements/statement-table-alter)
* [Drop table](/docs/sql-guide/statements/statement-table-create)

## Joining tables

Tables that exist in the same database can be joined.

## Next step

* [Learn about setting up data ingestion](/docs/cloud/cloud-ingest/cloud-ingest-manage)
