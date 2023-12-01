---
title: ALTER DATABASE
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 3
---

# ALTER DATABASE statement

{% include /cloud-db/cloud-db-serverless-summary.md %}

Cloud Serverless databases can be modified using the `ALTER DATABASE` statement.

{% include /cloud-db/serverless-preview-warning.md %}

## Syntax

```sql
ALTER DATABASE database-name WITH WORKERS <int-val>;
```

{% include /sql-guide/statement-db-alter-create-args.md %}

## Examples

Set a serverless database with 6GB of memory and 3 vCPU processors.

```sql
ALTER DATABASE my-db WITH WORKERS 3;
```
