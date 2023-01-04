---
title: Manage tables
layout: default
parent: Cloud
has_children: true
nav_order: 5
has_toc: false
---

# How do I manage tables in FeatureBase Cloud?
{: .no_toc }

This page provides an overview of FeatureBase tables and links to guide you through creating, altering and dropping tables.

{% include /concepts/summary-table-create.md %}

{% include page-toc.md %}

## Before you begin

{% include /cloud/cloud-before-begin.md %}
* [Learn how to manage Cloud databases](/docs/cloud/cloud-databases/cloud-db-manage)

## Data modeling

{% include /concepts/data-modeling-overview.md %}

IMPORTANT: Perform data modeling **before** creating tables to avoid issues.

* [Learn about data modeling](/docs/concepts/data-modeling-overview)

## Table primary key

{% include /cloud-table/cloud-summary-table-pk.md %}

## Column data types and constraints

{% include /cloud-table/cloud-summary-table-pk.md%}

<!--* [Learn about data types and constraints](/docs/sql-preview/data-types/data-types-home)-->

## Naming standard

{% include /cloud/standard-naming-obj.md%}
{% include /cloud-table/cloud-standard-naming-table.md %}
{% include /cloud-table/cloud-standard-naming-col.md%}

## Managing tables in FeatureBase Cloud

* [Create table](/docs/cloud/cloud-tables/cloud-table-create)
* [Add table columns](/docs/cloud/cloud-tables/cloud-table-add-column)
* [Delete table columns](/docs/cloud/cloud-tables/cloud-table-delete-column)
* [Delete table](/docs/cloud/cloud-tables/cloud-table-delete)

## Managing tables using the Cloud API

* [Table API reference](https://api-docs-featurebase-cloud.redoc.ly/v2#tag/Tables)

## Joining tables

Tables that exist in the same database can be joined.

## Next step

* [Learn about setting up data ingestion](/docs/cloud/cloud-ingest/cloud-ingest-manage)
