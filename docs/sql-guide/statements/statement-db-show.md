---
title: SHOW DATABASES
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 7
---

# SHOW DATABASES statement

Show detail on all databases.

{% include /cloud/cloud-only-note.md %}

## Syntax

```
SHOW DATABASES
```

## Returns

| Column | Description |
|--------|-------------|
|`_id` | the unique identifier for the database|
|`name`| the name of the database |
|`owner`|the unique identifier of the owner of the database |
| `updated_by`| the unique identifier of the user that made the last update to the databse |
| `create_at` | the timestamp when the database was created |
| `updated_at` | the timestamp when the database was last modified |
|`workers`| the number of compute nodes in the database | 
|`description`| the textual description of the database |

## Examples

### Show all databases

```sql
SHOW DATABASES
```
