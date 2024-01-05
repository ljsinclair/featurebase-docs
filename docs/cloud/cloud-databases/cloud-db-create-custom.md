---
title: Create custom database
layout: default
parent: Manage databases
grand_parent: Cloud
nav_order: 3
---

# How do I create a custom database?
{: .no_toc }

{% include /cloud-db/cloud-db-shaped-summary.html %}

{% include /cloud-db/cloud-db-create-api.md %}

{% include page-toc.md %}

## Before you begin
{: .no_toc }
* [Check pricing information on FeatureBase.com](https://www.featurebase.com/pricing)
{% include /cloud/cloud-before-begin.md %}
* [Learn how to manage Cloud databases](/docs/cloud/cloud-databases/cloud-db-manage)

## Naming standards

{% include /concepts/standard-naming-obj.md %}
<<<<<<< HEAD

{: .note}
FeatureBase Cloud database names can be up to 300 characters in length
=======
* database names can be up to 300 characters in length
>>>>>>> main

## Provisioning memory, RAM and virtual CPU for production systems

Choose bundled resources for your production system between the following values:

| Resource | Minimum | Maximum |
|---|---|
| Memory | 32GB | 2TB |
| Disk storage | 100GB | 2TB |
| Virtual CPU | 12 | 576 |

## Create a database

{% include /cloud-db/cloud-db-new-name.md %}
<<<<<<< HEAD

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

=======
* Click **Start with a clean database**.
* Choose the Vendor.
* Choose a shape suitable for your data.
>>>>>>> main
{% include /cloud-db/cloud-db-click-create.md %}

## Next step

* [Learn how to create tables](/docs/cloud/cloud-tables/cloud-table-create)

## Further information

* [Create database API reference](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/createDatabase)
* [Learn how to delete a database](/docs/cloud/cloud-databases/cloud-db-delete)
