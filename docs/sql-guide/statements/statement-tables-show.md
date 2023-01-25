---
title: SHOW TABLES
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 1
---

# SHOW TABLES statement

Shows the list of FeatureBase tables that exist on the server.

### DDL Syntax

![expr](/assets/images/sql-guide/show_tables.svg)

```sql
SHOW TABLES;
```
### Returns

| Column Name | Data type | Description |
|---|---|---|
| name | string | Name of the table |
| created_at | timestamp |  |
| track_existence | bool |  |
| keys | bool |   |
| shard_width  | int  |   |
