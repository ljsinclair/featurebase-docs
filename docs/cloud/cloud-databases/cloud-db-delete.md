---
title: Delete database
layout: default
parent: Manage databases
grand_parent: Cloud
nav_order: 5
---

# How do I delete a database in FeatureBase Cloud?
{: .no_toc }

Learn how to delete a FeatureBase Cloud database.

{% include page-toc.md %}

## Warnings

* You must delete database tables **before** deleting a database.
* Databases cannot be recovered once deleted.
* Deletion may take some time.

## Before you begin

{% include /cloud/cloud-before-begin.md %}
* [Create a database](/docs/cloud/cloud-databases/cloud-db-create)
* [delete tables](/docs/cloud/cloud-tables/cloud-table-delete)

## Delete a database

1. Click **Databases**.
2. Click <Icon>MoreVert</Icon> on the database to delete.
3. Click **Delete**.
4. Enter "Delete" in the confirmation dialog.
5. Click **Delete**.

## Further information

* [Delete database API reference](https://api-docs-featurebase-cloud.redoc.ly/v2#operation/deleteDatabase)
