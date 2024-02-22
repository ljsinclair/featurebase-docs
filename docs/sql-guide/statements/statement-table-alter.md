---
title: ALTER TABLE
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 8
---

# ALTER TABLE statement

Add, Rename or Drop columns from an existing table.

## BNF diagrams

![expr](/assets/images/sql-guide/alter_table_stmt.svg)

### Add column

![expr](/assets/images/sql-guide/add_column.svg)

### Drop column

![expr](/assets/images/sql-guide/drop_column.svg)

### Column definition

![expr](/assets/images/sql-guide/column_def.svg)

## Syntax

```
ALTER table_name [
  ADD {identifier data_type [constraint]} |
  DROP_COLUMN {identifier}
  ];
```

## Arguments

| Argument | Description | Additional information |
|---|---|---|
| table_name | Name of existing table to alter | [CREATE TABLE statement](/docs/sql-guide/statements/statement-table-create) |
| identifier | Column identifier or name |
| data_type | Column data type | [SQL data types](/docs/sql-guide/data-types/data-types-home) |
| constraint | Optional data type constraint | [SQL data types](/docs/sql-guide/data-types/data-types-home) |

<!-- commenting out because the examples aren't great
## Examples

{% include /sql-guide/sql-eg-table-alter-statements.md %}
-->
