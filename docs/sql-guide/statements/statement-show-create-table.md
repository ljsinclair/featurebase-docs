---
title: SHOW CREATE TABLE
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 1
---

# SHOW CREATE TABLE statement

Shows the data definition language (DDL) statement for a FeatureBase table.

### Syntax

```sql
SHOW CREATE TABLE table_name;
```

![expr](/img/sql/show_create_table.svg)

### Returns

| **Column Name** | **Data Type** | **Description**   |
|-----------------|---------------|-------------------|
| ddl             | string        | DDL of the table  |
