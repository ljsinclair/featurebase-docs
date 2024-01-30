---
title: Cloud
layout: default
has_children: true
nav_order: 3
has_toc: false
---

# Introduction to FeatureBase Cloud
{: .no_toc }

FeatureBase Cloud is fully managed on AWS infrastructure and makes it even easier to provision and operate in order to get value from your data faster.

{% include page-toc.md %}

## Summary of features

| Feature | Benefit | Additional information |
|---|---|---|
| Fully managed | No need to maintain your own infrastructure and calculate processor and memory requirements | [Learn about FeatureBase pricing](https://www.featurebase.com/pricing){:target="_blank"} |
| Automated backups | Full backups to S3 and EBS snapshotting are automated and occur daily for all databases |  |
| Usage-based metering and billing | GUI provides detailed intra-hour insights into your spend | [Learn how to view billing](/docs/cloud/my-account/cloud-account-billing) |
| Low-latency database | FeatureBase is a bitmap database which traditionally have been extremely fast, even when working with billions of records. FeatureBase adds new data types, to collapse traditional data models like the star schema, and efficiently store multiple values within a single column. | [Test our claims with a database of a billion rows](/docs/cloud/cloud-evaluate) |
| One-click GUI for DB creation and monitoring | Tools to create standard or custom databases, monitor and configure available at a single click | [Learn how to manage Cloud databases](/docs/cloud/cloud-databases/cloud-db-manage) |
| Simple user management | Create accounts directly in the GUI or via the Cloud API for users in your organization to collaborate on your data | [Manage users](/docs/cloud/cloud-users/cloud-users-manage) |
| Import data from multiple sources | Import data from CSV, inline, ndJSON, Orc or Parquet data sources | [Learn how to import/ingest data](/docs/cloud/cloud-ingest/cloud-ingest-manage) |
| HTTPS API | Programmatic access to all Cloud features over HTTPS | [FeatureBase Cloud API](https://api-docs-featurebase-cloud.redoc.ly/){:target="_blank"} |
| Command-line interface | Install `fbsql` to run SQL queries on your data from the command line of any internet-connected computer | [Learn about the fbsql CLI tool](/docs/tools/fbsql/fbsql-home) |
| Python client library | Run SQL queries on Cloud data via the Python Client Library | [Learn about the Python client library](/docs/tools/python-client-library/python-client-library-home) |

## Next step

* [Learn how to sign-up for a FeatureBase Trial account with $300USD credit](/docs/cloud/cloud-org/cloud-signup)
* [Learn how to connect to your FeatureBase database](/docs/cloud/cloud-db-connect/cloud-db-connect)

## Further information

* [Learn about the FeatureBase database and its features](/docs/concepts/concepts-home)
