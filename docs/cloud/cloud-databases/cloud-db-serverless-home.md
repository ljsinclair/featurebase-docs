---
title: Serverless database preview
layout: default
parent: Manage Databases
grand-parent: Cloud
nav_order: 2
---

# What is FeatureBase Serverless?
{: .no_toc }

{% include /serverless/serverless-preview-warning.md %}

FeatureBase Serverless provides a new database architecture which separates computer power and storage so they can be scaled independently.

{% include page-toc.md %}

## Scaling database compute resources without down-time

FeatureBase Serverless introduces the concept of **Workers** (or **Units**) which:
* Handle computation and transpiling of queries and data
* Can be added or removed using SQL queries depending on your needs without needing to spin the database down.

{% include /serverless/serverless-worker-shape.md %}

## Scaling database storage

FeatureBase Serverless allows your database storage to scale:
* automatically without a set ceiling
* without the need to manually upgrade to a new database **Shape**

## Improved availability

The FeatureBase Serverless architecture provides higher availability and durability for your data:
* No data loss from losing Workers
* Storage with 11 nines of durability
* Redundant storage across multiple locations (highly available to Workers)

## Independent storage and compute costs

FeatureBase Serverless databases have compute and storage metered and charged independently based on your usage.

## Known limitations

* [Learn about serverless database limitations](/docs/cloud/cloud-troubleshooting/issue-serverless-limitations/)

## How do I create a Serverless Database?

* [Learn how to create a serverless database](/docs/cloud/cloud-databases/cloud-db-create-serverless)

## How do I scale a Serverless Database?

* [Learn how to scale serverless databases](/docs/cloud/cloud-databases/cloud-db-serverless-scale)
