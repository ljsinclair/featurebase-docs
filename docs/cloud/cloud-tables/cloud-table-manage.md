---
title: Manage tables
layout: default
parent: Cloud
has_children: true
nav_order: 4
has_toc: false
---

# How do I manage tables in FeatureBase Cloud?
{: .no_toc }

This page provides an overview of FeatureBase tables and links to guide you through creating, altering and dropping tables.

{% include /concepts/create-table-summary.md %}

{% include /docs/page-toc.md %}

## Before you begin

{% include /cloud/cloud-before-begin.md %}
* [Learn how to manage Cloud databases](/docs/cloud/cloud-databases/cloud-db-manage)

## Data modeling

{% include /concepts/data-modeling-overview.md %}

IMPORTANT: Perform data modeling **before** creating tables to avoid issues.

* [Learn about data modeling](/concepts/data-modeling-overview)

## Table primary key

{% include /cloud/cloud-pk-table.md %}

## Column data types and constraints

{% include /cloud/cloud-pk-table.md%}

* [Learn about data types and constraints](/docs/cloud/cloud-data-modeling/data-types)

## Naming standard

{% include /cloud/object-naming-standard.md%}
{% include /cloud/cloud-table-naming-standard.md %}
{% include /cloud/cloud-column-naming-standard.md%}

## Managing tables in FeatureBase Cloud

* [Create table](/docs/cloud/cloud-tables/cloud-table-create)
* [Add table columns](/docs/cloud/cloud-databases/cloud-table-add-column)
* [Drop table columns](/docs/cloud/cloud-databases/cloud-table-drop-column)
* [Delete table](/docs/cloud/cloud-databases/cloud-table-delete)

## Managing tables using the Cloud API

* [Table API reference](https://api-docs-featurebase-cloud.redoc.ly/v2#tag/Tables)

## Joining tables

Tables that exist in the same database can be joined.

## Next step

* [Learn about setting up data ingestion](/docs/cloud/cloud-data-ingestion/ingest-data-overview)
