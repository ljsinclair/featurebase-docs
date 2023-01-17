---
title: Issue running SQL
layout: default
parent: Troubleshooting
grand_parent: Community
has_children: false
nav_order: 1
---

# Issue - SQL won't execute properly

Statements using SQL found in [SQL-guide](/docs/sql-guide/sql-guide-home) do not execute when run in FeatureBase community.

## Solution

Configure FeatureBase with the `sql.endpoint-enabled` option.

Command line



```toml
    [sql]
      endpoint-enabled = true
```
