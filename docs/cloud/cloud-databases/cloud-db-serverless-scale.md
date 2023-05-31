---
title: Scale a serverless database
layout: default
parent: Manage databases
grand_parent: Cloud
nav_order: 3
---

# How do I scale a serverless database?
{: .no_toc }

{% include /serverless/serverless-preview-warning.md %}

This procedure explains how to scale a serverless database.

{% include page-toc.md %}

## Before you begin

{% include /cloud/cloud-before-begin.md %}
* [Learn about FeatureBase Serverless](/docs/cloud/cloud-databases/cloud-db-serverless-home)
* [Learn how to create a serverless database](/docs/cloud/cloud-databases/cloud-db-create-serverless)

## Scale a serverless database with SQL

<!---
This section needs to move to SQL once out of preview and replaced with a UI method when it exists.
-->

### Syntax 

```sql
ALTER DATABASE {database-name}[WITH WORKERS {<int-workers>}];
```

###  Arguments

| Argument | Description | Required | Additional information |
|---|---|---|---|
| `database-name` | Name of existing database to alter | Yes |  |
| WITH WORKERS `<int-workers>` | Integer value of Workers to assign to database | No| [Worker Unit additional](#worker-unit-additional) |

## Additional information

### Worker unit additional

{% include /serverless/serverless-worker-shape.md %}
{% include /serverless/serverless-create-defaults.md %}
{% include /serverless/serverless-worker-limits.md %}

## Examples

```sql
ALTER DATABASE my-db WITH WORKERS 3;
```

## Next step

* [Learn how to create tables](/docs/cloud/cloud-tables/cloud-table-create)

## Further information

* [Create database API reference](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/createDatabase)
* [Learn how to delete a database](/docs/cloud/cloud-databases/cloud-db-delete)
* [FeatureBase Serverless limitations](/docs/cloud/cloud-troubleshooting/issue-serverless-limitations/)
