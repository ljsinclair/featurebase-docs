---
title: Create tables
layout: default
parent: Manage tables
grand_parent: Cloud
nav_order: 1
---

# How do I create a table in FeatureBase Cloud?
{: .no_toc }

{% include /concepts/summary-table-create.md %}

{% include page-toc.md %}

{: .note }
You can also create a table using a [SQL CREATE TABLE statement](/docs/sql-guide/statements/statement-table-create) then create tables and add data.

## Before you begin

{% include /cloud/cloud-before-begin.md %}
* [Learn how to create a database](/docs/cloud/cloud-databases/cloud-db-create)
* [Learn how to manage tables](/docs/cloud/cloud-tables/cloud-table-manage)

## Naming standards

{% include /concepts/standard-naming-obj.md%}
{% include /cloud-table/cloud-standard-naming-table.md %}

## Step 1: view tables

{% include /cloud-table/cloud-table-view-list.md %}

## Step 2: create table

1. Click **Create table**.
2. Select the destination database.
3. Enter a table name and an optional description.

## Step 3: choose the primary key

{% include /cloud-table/cloud-summary-table-pk.md %}

1. Select the ID type.
2. Click **Create**.

## Next step

* [Learn how to add columns to a table](/docs/cloud/cloud-tables/cloud-table-add-column)

## Further information

* [Create table API reference](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/createTable)
