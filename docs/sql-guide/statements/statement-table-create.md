---
title: CREATE TABLE
layout: default
parent: Statements
grand_parent: SQL guide
---

## CREATE TABLE statement

Creates a FeatureBase table. The table already exists and `IF NOT EXISTS` is not specified the statement will not be successful.

## BNF diagrams

![expr](/assets/images/sql-guide/create_table_stmt.svg)

### Column_def
![expr](/assets/images/sql-guide/column_def.svg)

### Type_name
![expr](/assets/images/sql-guide/type_name.svg)

### Column_constraint
![expr](/assets/images/sql-guide/column_constraint.svg)

### Table_options
![expr](/assets/images/sql-guide/table_options.svg)

## DDL Syntax

```
CREATE TABLE table_name
  [IF NOT EXISTS]
  (column_list)
  [comment 'comment'];
```

## Arguments

| Argument | Description | Required? | Further information |
|---|---|---|
| `table_name` | Valid table name | Yes | [Naming standards](#naming-standards)
| `IF NOT EXISTS` | Optional argument that stops statement execution if a table of the same name already exists | No |  |
| column_list | Optional list of columns which must include the `_id` column | Yes | [Data types](/docs/sql-guide/data-types/data-types-home) |
| `comment` | Optional string literal that describes the table | No |  |

## Additional information

### Naming standards

{% include /concepts/standard-naming-obj.md %}
{% include /cloud-table/cloud-standard-naming-table.md %}
{% include /cloud-table/cloud-standard-naming-col.md %}

### `_id` column

{% include /cloud-table/cloud-summary-table-pk.md %}

## Examples

### CREATE TABLE with integer constraints

```sql
create table doctest
  (
    _id id,
    numbers int min -9007199254740991 max 9007199254740991,
    words string
  );
```

### CREATE TABLE with all column types

```sql
create table allcoltypes
  (
    _id id,
    intcol int min 0 max 10000,
    boolcol bool,
    timestampcol timestamp timeunit 'ms' epoch '2022-01-01T00:00:00Z',
    decimalcol decimal(2),
    stringcol string,
    stringsetcol stringset,
    stringsetcolq stringset timequantum 'YMD' ttl '24h',
    idcol id,
    idsetcol idset,
    idsetcolq idset timequantum 'YMD' ttl '24h'
  )
  comment 'table containing all column types';
```

## Further information

* [SHOW CREATE TABLE](/docs/sql-guide/statements/statement-show-create-table)
* [SHOW TABLES](/docs/sql-guide/statements/statement-tables-show)
* [ALTER TABLE](/docs/sql-guide/statements/statement-table-alter)
* [ADD COLUMN](/docs/sql-guide/statements/statement-add-column)
* [SHOW COLUMNS](/docs/sql-guide/statements/statement-columns-show)
* [DROP COLUMN](/docs/sql-guide/statements/statement-column-drop)
* [Data types](/docs/sql-guide/data-types/data-types-home)
