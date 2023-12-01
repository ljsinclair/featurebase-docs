---
title: CREATE SERVERLESS DATABASE
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 1
nav_exclude: true
---

# CREATE DATABASE statement

{% include /cloud-db/cloud-db-serverless-summary.md %}

Create a **serverless** database using `CREATE DATABASE`

{% include /cloud-db/serverless-preview-warning.md %}

## Syntax

```sql
CREATE DATABASE database-name WITH WORKERS <int-val>;
```

{% include /sql-guide/statement-db-alter-create-args.md %}

## Additional information

### Naming standards

{% include /concepts/standard-naming-obj.md %}
{% include /cloud-db/cloud-standard-naming-db.md %}

## Examples

Create a serverless database with 2GB of memory and 1 vCPU processors.

```sql
CREATE DATABASE my-db WITH WORKERS 1;
```
