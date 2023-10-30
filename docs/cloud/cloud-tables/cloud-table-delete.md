---
title: Drop table
layout: default
parent: Manage tables
grand_parent: Cloud
nav_order: 6
---

# How do I drop a table in FeatureBase Cloud?
{: .no_toc }

There are a number of reasons why you may choose to drop a table, including:
* incorrect configuration
* incorrect name
* database deletion
* data deletion

{% include page-toc.md %}

## Warnings

* Tables cannot be recovered once deleted
* Deleting tables will affect data-sources and running queries

## Before you begin

{% include /cloud/cloud-before-begin.md %}
* [Create a database](/docs/cloud/cloud-databases/cloud-db-create-custom)
* [Create a table](/docs/cloud/cloud-tables/cloud-table-create)

## Step 1: View table list

{% include /cloud-table/cloud-table-view-list.md %}

## Step 2: Drop the selected table

1. Click <span class="material-icons md-18">more_vert</span> > **Drop table**
2. Enter "DELETE" in the confirmation dialog.
3. Click **Drop table**.

## Further information

* [Delete table API reference](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/deletetable)
* [Learn how to create tables](/docs/cloud/cloud-tables/cloud-table-create)
