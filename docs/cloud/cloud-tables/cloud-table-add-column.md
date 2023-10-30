---
title: Add columns
layout: default
parent: Manage tables
grand_parent: Cloud
nav_order: 3
---

# How do I add a column to an existing table in FeatureBase Cloud?
{: .no_toc }

{% include page-toc.md %}

## Before you begin

{% include /cloud/cloud-before-begin.md %}
* [Create a database](/docs/cloud/cloud-databases/cloud-db-create-custom)
* [Create a table](/docs/cloud/cloud-tables/cloud-table-create)

## Column data types and constraints

{% include /cloud/cloud-data-type-table.md %}

## Naming standard

{% include /concepts/standard-naming-obj.md%}
{% include /cloud-table/cloud-standard-naming-col.md %}

## Step 1: View all tables

{% include /cloud-table/cloud-table-view-list.md %}

## Step 2: Add a column to a table

{: .note }
Table columns cannot be edited once created.

1. Click the table name.
2. Click **Columns** > **Add column**.
3. Enter a name for the column
4. Choose the data type and enter values for the constraints if available.
5. Click **Add column**

## Further information

* [Create table column API reference](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/createTableColumn)
* [Learn how to delete a table column](/docs/cloud/cloud-tables/cloud-table-delete-column)
