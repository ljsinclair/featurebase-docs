---
title: Cloud database details
layout: default
parent: Manage databases
grand_parent: Cloud
nav_order: 10
---

# Where do I find database details?
{: .no_toc }

FeatureBase provides access to details and statistics on your database.

Additionally, a disk utilization graph is available on the **Home** page which lists disk space used by the database and its data.

{% include page-toc.md %}

## Before you begin
{: .no_toc }

* [Learn about Cloud databases](/docs/cloud/cloud-databases/cloud-db-manage)
* [Create a FeatureBase database](/docs/cloud/cloud-databases/cloud-db-create-custom)

## How do I view database details?

* Click **Databases** > `your-database-name` to open the summary page.

{: .note}
You can also get a subset of details by querying the [fb_database_info and fb_database_nodes system tables](/docs/sql-guide/system-tables/system-tables-home)

## Detail view

| Detail | Description | Additional information |
|---|---|---|
| Database ID | Unique identifier for the database required for API and FBSQL connections that do not require user credentials | * [Cloud API](https://api-docs-featurebase-cloud.redoc.ly/){:target="_blank"}<br/>* [FBSQL tool](/docs/tools/fbsql/fbsql-home) |
| Status | Cloud database states include Provisioning and Running. | [Learn about cloud database states](/docs/cloud/cloud-databases/cloud-db-states) |
| Memory | Current available memory based on your choice of shaped database | [Create a custom database](/docs/cloud/cloud-databases/cloud-db-manage/#create-a-custom-database) |
| Owner | User name of account that created the database | [Manage users](/docs/cloud/cloud-users/cloud-users-manage) |
| Version | The version number is represented by `<current-featurebase-version>-<commit-hash>` | [Issues with Database version](/docs/cloud/cloud-troubleshooting/issue-cloud-version-unknown/) |
| Created | Time and date since database creation with user name of creator |  |
| Last modified | Time and date since last alteration with user name that made changes |  |
| Disk utilization | Actual memory used by database and data | [] |
| Query endpoint URL | Endpoint used for Cloud REST API queries | [Cloud API](https://api-docs-featurebase-cloud.redoc.ly/){:target="_blank"} |

## Related information

* [Query and ingestion statistics](/docs/cloud/cloud-databases/cloud-db-stats)
