---
title: SHOW TABLES
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 9
---

# SHOW TABLES statement

Shows the list of FeatureBase tables that exist on the server.

## BNF diagram

![expr](/assets/images/sql-guide/show_tables.svg)

## Syntax

```sql
SHOW TABLES;
```
## Returns

| Column Name | Data type | Description | Further information |
|---|---|---|---|
| `_id` | id or string  | Table ID | [`_id` column](#_id-column) |
| name | string | Name of the table | [naming standards](#naming-standards)
| owner | string | Owner of table (omitted for system-created sample data) |  |
| updated_by | string | Last user to update table |  |
| created_at | timestamp | Table time-date created | [TIMESTAMP() data type](/docs/sql-guide/data-types/data-type-timestamp) |
| updated_at | timestamp | Table time-date last updated | [TIMESTAMP() data type](/docs/sql-guide/data-types/data-type-timestamp) |
| keys | bool | Boolean that is true when keys are used (_id) is a string |  |
| space_used | int | bytes used by the table. |  |
| description | string | description COMMENT of the table |  |

## Additional information

### `_id` column

{% include /cloud-table/cloud-summary-table-pk.md %}

### Naming standards

{% include /concepts/standard-naming-obj.md %}
{% include /cloud-table/cloud-standard-naming-table.md %}
{% include /cloud-table/cloud-standard-naming-col.md %}

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
