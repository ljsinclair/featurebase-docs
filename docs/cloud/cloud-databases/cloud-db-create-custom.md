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
{% include /cloud-db/cloud-standard-naming-db.md %}

## How do I provision a database with a custom configuration?

There are three methods to provision a custom configured database.

### Method one - provision database from the homepage

{% include /cloud/homepage-db-create-options.md %} under **Make something custom**.

### Method two - provision database via the Databases page

{% include /cloud-db/cloud-db-new-name.md %}

Choose from the **Memory** drop-down:

{% include /cloud-db/cloud-db-total-shapes.md %}

{% include /cloud-db/cloud-db-click-create.md %}

## Method 3 - provision the database using Cloud API

* [Create a database using Cloud API](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/createDatabase){:target="_blank"}

## Next step

* [Learn how to create tables](/docs/cloud/cloud-tables/cloud-table-create)

## Further information

* [Create database API reference](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/createDatabase)
* [Learn how to delete a database](/docs/cloud/cloud-databases/cloud-db-delete)
