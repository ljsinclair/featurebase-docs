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
| _id |   | Table ID |
| name | string | Name of the table |
| owner |   | Owner of table (omitted for system-created sample data) |
| updated_by |  | Last user to update table |
| created_at | timestamp | Table time-date created |
| updated_at | timestamp | Table time-date last updated |
| keys | bool |
| space_used |  |  |
| description |  |
| track_existence | bool |  |
| shard_width  | int  |  |

## Examples

Sample data has been loaded to a new FeatureBase database.
```
SHOW TABLES;
```
CSV results
```
_id,name,owner,updated_by,created_at,updated_at,keys,space_used,description
fb_views,fb_views,,,2023-01-18T06:05:23Z,2023-01-18T06:05:23Z,true,8642560,system table for views
skills,skills,,c9e4d4d2-bfee-4dae-8b1e-e172bf17b2d7,2023-01-05T05:53:06Z,2023-01-25T07:15:48Z,true,44331123,
fb_cluster_info,fb_cluster_info,,,1970-01-01T00:00:00Z,1970-01-01T00:00:00Z,false,0,
fb_cluster_nodes,fb_cluster_nodes,,,1970-01-01T00:00:00Z,1970-01-01T00:00:00Z,false,0,
fb_exec_requests,fb_exec_requests,,,1970-01-01T00:00:00Z,1970-01-01T00:00:00Z,false,0,
fb_table_ddl,fb_table_ddl,,,1970-01-01T00:00:00Z,1970-01-01T00:00:00Z,false,0,
fb_performance_counters,fb_performance_counters,,,1970-01-01T00:00:00Z,1970-01-01T00:00:00Z,false,0,
```
