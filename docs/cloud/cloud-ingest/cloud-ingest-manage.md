---
title: Manage cloud ingestion
layout: default
parent: Cloud
has_children: false
nav_order: 5
has_toc: false
---

# How do I import data to my FeatureBase Cloud database?
{: .no_toc }

{% include page-toc.md %}

## Before you begin

{% include /cloud-db/cloud-db-dependencies.md %}

## Load data into your database

All data ingestion is performed using SQL. The product puts an emphasis on push-based, streaming models in which you, the client, create a process to push data to your databases with SQL statements. This model allows you to control how data is pushed and what(if any) processes run to transform or clean the data before ingestion. This model also keeps data in your datacenter should upstream issues arise. Lastly, push-based ingest helps protect your datacenter by keeping it closed to outside connections that reach in and pull data. Today, the tool only supports SQL through HTTPS. Any process or application that can make calls over HTTPS is able to push data to FeatureBase.

Once data is pushed, it is translated into FeatureBases’s format and writes the data into your table. This process typically reduces your data’s footprint by 10x but can see reductions upwards of 100x.

## Data Model

Data modeling determines how data is imported to FeatureBase and how it is represented to meet your needs.

* [Learn about data modeling](/docs/concepts/overview-data-modeling)

## Next step

* [Learn how to ingest data](/docs/sql-guide/statements/statement-insert-bulk)