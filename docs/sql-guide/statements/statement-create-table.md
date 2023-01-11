---
title: CREATE TABLE
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 1
---

# CREATE TABLE statement

Creates a FeatureBase table. The the table already exists and `IF NOT EXISTS` is not specified the statement will not be successful. The identifier for the table must conform to the rules of FeatureBase identifiers.

## Before you begin

* [Object naming standard]()

## Syntax

![expr](/assets/images/sql-guide/create_table_stmt.svg)

## Arguments

| Argument | Description | Data type | Required |
|---|---|---|
| _id | | `id` for a non-keyed table or `string` for a keyed table | Yes |


## Additional information

## Table naming standard

{% include /cloud-table/cloud-standard-naming-table.md %}
{% include /cloud-table/cloud-standard-naming-col.md %}

## Table `_id`

{% include /cloud-table/cloud-summary-table-pk.md %}


#### column_def

![expr](/assets/images/sql-guide/column_def.svg)

#### type_name

![expr](/assets/images/sql-guide/type_name.svg)

See also [Data Types](/sql-preview/data-types/data-types-home).

#### column_constraint
Column constraints are optional for columns.

![expr](/assets/images/sql-guide/column_constraint.svg)

{% include /sql-guide/summary-constraints-datatypes.md %}

#### table_options

![expr](/assets/images/sql-guide/table_options.svg)

| **Table Option** | **Comment**                                                           |
|------------------|-----------------------------------------------------------------------|
| KEYPARTITIONS    | integer literal; between 1-10000                                      |
| SHARDWIDTH       | integer literal; must be a power of two greater than or equal to 2^16 |
| COMMENT          | string literal;  description of the table                             |

#### Example

```sql
create table allcoltypes (
	_id id,
	intcol int min 0 max 10000,
	boolcol bool,
	timestampcol timestamp timeunit 'ms' epoch '2022-01-01T00:00:00Z',
	decimalcol decimal(2),
	stringcol string cachetype ranked size 1000,
	stringsetcol stringset cachetype lru size 1000,
	stringsetcolq stringset cachetype lru size 1000 timequantum 'ymd' ttl '24h',
	idcol id cachetype ranked size 1000,
    idsetcol idset cachetype lru size 1000,
	idsetcolq idset cachetype lru size 1000 timequantum 'ymd' ttl '24h'
) keypartitions 12 shardwidth 65536 comment 'table description'
```
