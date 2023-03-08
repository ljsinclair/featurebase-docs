---
title: Create cloud database
layout: default
parent: Manage databases
grand_parent: Cloud
nav_order: 2
---

# How do I create a cloud database?
{: .no_toc }

This procedure explains how to create a Database in FeatureBase Cloud.

{: .note }
You can also [create a database with pre-loaded data](/docs/cloud/cloud-databases/cloud-db-create-sample)

{% include page-toc.md %}

## Before you begin

{% include /cloud/cloud-before-begin.md %}
* [Learn how to manage databases](/docs/cloud/cloud-databases/cloud-db-manage)

## Trial accounts

{% include /cloud/trial-account-limits.md %}

## Cloud database shapes

{% include /cloud-db/cloud-summary-db-shape.md %}

* [Learn about cloud database shapes](/docs/cloud/cloud-databases/cloud-db-shape)

## Naming standards

{% include /concepts/standard-naming-obj.md %}
{% include /cloud-db/cloud-standard-naming-db.md %}

## Create Database

{% include /cloud-db/cloud-db-new-name.md %}

* Choose from development shapes intended for testing:

{% include /cloud-db/cloud-db-shape-dev.md %}

* Or choose a production shape instead:

{% include /cloud-db/cloud-db-shape-prod.md %}
{% include /cloud-db/cloud-db-click-create.md %}

## Next step

* [Learn how to create tables](/docs/cloud/cloud-tables/cloud-table-create)

## Further information

* [Create database API reference](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/createDatabase)
* [Learn how to delete a database](/docs/cloud/cloud-databases/cloud-db-delete)
