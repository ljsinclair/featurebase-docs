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
* * Click **Databases** > database name > **Tables** to view tables.

## Column data types and constraints

{% include /cloud/cloud-data-type-table.md %}

## Naming standard

{% include /concepts/standard-naming-obj.md%}
{% include /cloud-table/cloud-standard-naming-col.md %}

## Add a column to a table

{: .note }
Table columns cannot be edited once created.

* Click the table name.
* Click **Columns** > **Add column**.
* Enter a name for the column
* Choose the data type and enter values for the constraints if available.
* Click **Add column**

## Further information

* [Create table column API reference](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/createTableColumn)
* [Learn how to delete a table column](/docs/cloud/cloud-tables/cloud-table-delete-column)
