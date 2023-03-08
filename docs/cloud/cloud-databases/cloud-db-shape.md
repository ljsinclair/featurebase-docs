---
title: Database shapes
layout: default
parent: Manage databases
grand_parent: Cloud
nav_order: 1
---

# What types of database can I create in FeatureBase Cloud?
{: .no_toc }

{% include /cloud-db/cloud-summary-db-shape.md %}

{: .important}
Cloud Database shapes incur an hourly fee, chargeable at the end of the month.

{% include page-toc.md %}

## Before you begin

{% include /cloud/cloud-before-begin.md %}
* {% include contact-support.md %} to upgrade your account to access production database shapes

### Trial account and Development shapes

Two database shapes are available on all accounts. These are intended for development and testing purposes.

{% include /cloud-db/cloud-db-shape-dev.md %}

### Production shapes

Production shapes are available on paid accounts. These have:
* overprovisioned disk space and memory to ensure best performance
* data replication should a node go down.

{% include /cloud-db/cloud-db-shape-prod.md %}

## Further information

* [Learn how to manage FeatureBase Cloud databases](/docs/cloud/cloud-databases/cloud-db-manage)
* [Query database shapes via the API](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/getServiceProperties)
