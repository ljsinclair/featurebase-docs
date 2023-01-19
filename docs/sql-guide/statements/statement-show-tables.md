---
title: SHOW TABLES
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 2
---

# SHOW TABLES statement

Shows the list of FeatureBase tables that exist on the server.

### Syntax

```sql
SHOW TABLES;
```

![expr](/img/sql/show_tables.svg)

### Returns

| **Column Name** | **Data Type** | **Description**   |
|-----------------|---------------|-------------------|
| name            | string        | Name of the table |
| created_at      | timestamp     |                   |
| track_existence | bool          |                   |
| keys            | bool          |                   |
| shard_width     | int           |                   |
