---
title: SHOW COLUMNS
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 1
---

# SHOW COLUMNS statement

## Syntax

```sql
SHOW COLUMNS FROM table;
```

![expr](/img/sql/show_columns.svg)

## Returns

| **Column Name** | **Data Type** | **Description** |
|-----------------|---------------|-----------------|
| name            | string        |                 |
| type            | string        |                 |
| created_at      | timestamp     |                 |
| keys            | bool          |                 |
| cache_type      | string        |                 |
| cache_size      | int           |                 |
| scale           | int           |                 |
| min             | int           |                 |
| max             | int           |                 |
| timeunit        | string        |                 |
| epoch           | int           |                 |
| time_quantum    | string        |                 |
| ttl             | string        |                 |
