---
title: Cloud database states
layout: default
parent: Manage databases
grand_parent: Cloud
nav_order: 10
---

# What states can my Database have?
{: .no_toc }

Database states are listed in the Database description page and can be obtained by querying system tables.

{% include page-toc.md %}

## Before you begin

{% include /cloud/cloud-before-begin.md %}
* [Learn how to manage databases](/docs/cloud/cloud-databases/cloud-db-manage)
* [Learn about shaped databases](/docs/cloud/cloud-databases/cloud-db-shaped)

## How do I query my database state?

You can query the database state in the following ways:

* [Query database state in the UI](/docs/cloud/cloud-databases/cloud-db-details)
* [Query database state using the API](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/getDatabase){:target="_blank"}
* [Query database state using SQL]

## CREATE DATABASE states

| Database Status | Definition | Available for use? |
|---|---|---|
| CREATING | Chosen database resources are being provisioned | No |
| PROVISIONING | Database is being created with provisioned resources | No |
| RUNNING | Database is running normally and billing has commenced | Yes |
| UPDATING | A database update that will cause limited performance degradation | Yes |

### Backup and restore states

| Database Status | Definition | Available for use? |
|---|---|---|
| BACKUP | Creating a backup of the database | Yes |
| RESTORING | Restoring data from a backup | No |

### DELETE DATABASE states

The database state passes through the following states after being deleted:

| Database Status | Definition |
|---|---|
| DELETING | Database resources and data are being deprovisioned |
| DEPROVISIONING | Database resources are being deprovisioned as a result of database deletion |
| DELETED | Database has been deleted successfully and billing has stopped |

### Error states

{: .note}
[Contact support on Discord for help with these errors](https://discord.com/invite/bSBYjDbUUb){:target="_blank"}

The database is unavailable when it has the following states:

| Database Status | Definition |
|---|---|
| FROZEN | An error has occurred with a database backup |
| FAILED | Database is in unrecoverable state as a result of failed provisioning of resources, restoration from backup or deletion |
