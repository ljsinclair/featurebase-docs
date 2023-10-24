---
title: ALTER TABLE
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 2
---

# ALTER TABLE statement

Add, Rename or Drop columns from an existing table.

## BNF diagrams

<!---NOTE: alter_table_stmt.svg IS WRONG:
* It omits table_name
* RENAME is not yet implemented so needs to be removed (see below)
The statement in the Syntax is correct and I've tested it-->
![expr](/assets/images/sql-guide/alter_table_stmt.svg)

<!--RENAME generates an error:
"query error: internal error (/builds/molecula/featurebase/sql3/planner/opaltertable.go:112) column rename is unimplemented"
Once it's implemented:
1. add RENAME back into the BNF diagram
2. add the following SQL to the Syntax (between ADD and DROP) once it's implemented:

RENAME COLUMN {column_name to column_name } |

3. Create an equivalent BNF diagram
-->

![expr](/assets/images/sql-guide/add_column.svg)
![expr](/assets/images/sql-guide/drop_column.svg)

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

## Examples

### ADD `stock` column to `products` table

```
ALTER TABLE products ADD stock int;
```

### ADD `Hobbies` column to `skillset` table
```
ALTER TABLE skillset ADD Hobbies string;
```

### DROP `Hobbies` column from `skillset` table

```
ALTER TABLE skillset DROP Hobbies;
```
