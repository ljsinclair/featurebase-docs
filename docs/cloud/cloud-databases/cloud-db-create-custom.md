---
title: Create custom database
layout: default
parent: Manage databases
grand_parent: Cloud
nav_order: 3
---

# How do I create a custom database?
{: .no_toc }

{% include /cloud-db/cloud-db-custom-summary.md %}

You can choose from different bundles of database resources between the following minimum and maximum values:

| Resource | Minimum | Maximum |
|---|---|
| Memory | 32GB | 2TB |
| Disk storage | 100GB | 2TB |
| Virtual CPU | 12 | 576 |

{: .note}
You can also [create a database using Cloud API](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/createDatabase){:target="_blank"}

## Before you begin

{% include /cloud/cloud-before-begin.md %}
* [Learn how to manage databases](/docs/cloud/cloud-databases/cloud-db-manage)

## Naming standards

{% include /concepts/standard-naming-obj.md %}
{% include /cloud-db/cloud-standard-naming-db.md %}

## Provisioning memory, RAM and virtual CPU

{% include /cloud-db/cloud-db-total-shapes.md %}

## Create a database

* Click **Databases** > **New database**.
* Name the database according to the naming standards.
* Click **Start with a clean database**.
* Choose the Vendor
* Choose a shape suitable for your data
* Click **CREATE DATABASE**

## Next step

* [Learn how to create tables](/docs/cloud/cloud-tables/cloud-table-create)

## Further information

* [Create database API reference](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/createDatabase)
* [Learn how to delete a database](/docs/cloud/cloud-databases/cloud-db-delete)
