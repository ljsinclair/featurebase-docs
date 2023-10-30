---
title: DROP DATABASE
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 9
---

# DROP DATABASE statement

Drops the specified database.

{% include /cloud/cloud-only-note.md %}

## Syntax

```sql
DROP DATABASE database_name;
```

## Arguments

| Argument | Data type | Description | Required | Additional information |
|---|---|---|---|---|
| `database_name` | string |Name of the database to delete | yes | |


## Examples

### Drop database `test_db`

```sql
DROP DATABASE test_db
```
