---
title: Create custom database
layout: default
parent: Manage databases
grand_parent: Cloud
nav_order: 3
---

# How do I create a custom database?
{: .no_toc }

There are three ways to provision a database with a custom configuration in FeatureBase Cloud.

## Before you begin

{% include /cloud/cloud-before-begin.md %}
* [Learn how to manage databases](/docs/cloud/cloud-databases/cloud-db-manage)

## Naming standards

{% include /concepts/standard-naming-obj.md %}

{: .note}
FeatureBase Cloud database names can be up to 300 characters in length

## How do I provision a database with a custom configuration?

There are three methods to provision a custom configured database.

### Method one - provision database from the homepage

{% include /cloud/homepage-db-create-options.md %} under **Make something custom**.

### Method two - provision database via the Databases page

{% include /cloud-db/cloud-db-new-name.md %}

Choose from the **Memory** drop-down:

| Shape (GB) | Memory (GB) | Volume (GB) | Compute (vCPU) |
|---|---|---|---|
| 8 | 4 | 8 | 3 |
| 16 | 8 | 16 | 6 |
| 32 | 32 | 100 | 12 |
| 64 | 64 | 300 | 24 |
| 128 | 128 | 500 | 48 |
| 256 | 256 | 1200 | 96 |
| 512 | 512 | 2500 | 192 |
| 1024 | 1024 | 5000 | 320 |
| 2048 | 2048 | 10000 | 576 |

{% include /cloud-db/cloud-db-click-create.md %}

## Method 3 - provision the database using Cloud API

* [Create a database using Cloud API](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/createDatabase){:target="_blank"}

## Next step

* [Learn how to create tables](/docs/cloud/cloud-tables/cloud-table-create)

## Further information

* [Create database API reference](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/createDatabase)
* [Learn how to delete a database](/docs/cloud/cloud-databases/cloud-db-delete)
