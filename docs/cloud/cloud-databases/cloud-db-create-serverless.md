---
title: Create serverless database
layout: default
parent: Manage databases
grand_parent: Cloud
nav_order: 2
---

# How do I create a serverless database?
{: .no_toc }

{% include /serverless/serverless-preview-warning.md %}

This procedure explains how to create a serverless database. 

{% include page-toc.md %}

## Before you begin

{% include /cloud/cloud-before-begin.md %}
{% include /serverless/serverless-create-defaults.md %}

## Naming standards

{% include /concepts/standard-naming-obj.md %}
{% include /cloud-db/cloud-standard-naming-db.md %}

## Create serverless database

{% include /cloud-db/cloud-db-new-name.md %}
* Choose **Serverless (Preview)**
{% include /cloud-db/cloud-db-click-create.md %}

## Create serverless database with SQL

<!---
This section needs to move to SQL once out of preview
-->

### Syntax 

```sql
CREATE DATABASE {database-name} [WITH UNITS {<int-workers>}];
```

###  Arguments

| Argument | Description | Required | Additional information |
|---|---|---|---|
| `database-name` | Name of existing database to alter | Yes |  |
| WITH UNITS `<int-workers>` | Integer value of Worker units to assign to database | No| [Worker Unit additional](#worker-unit-additional) |

## Additional information

### Worker unit additional

{% include /serverless/serverless-worker-shape.md %}
{% include /serverless/serverless-create-defaults.md %}
{% include /serverless/serverless-worker-limits.md %}

## Examples

```sql
CREATE DATABASE my-db WITH UNITS 1;
```

## Next step

* [Scale a serverless database](/docs/cloud/cloud-databases/cloud-db-serverless-scale)
