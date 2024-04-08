---
title: SELECT FROM myspecies
layout: default
parent: SQL Examples
grand_parent: SQL guide
nav_exclude: true
---
# SELECT FROM myspecies

These `SELECT` statements demonstrate how the `myspecies` data can be queried.

## Before you begin

* [Learn about data modeling low-cardinality data](/docs/cloud/cloud-faq/cloud-faq-data-modeling)
* [CREATE TABLE myspecies](/docs/sql-guide/examples/sql-eg-table/sql-eg-table-create-myspecies)
* [BULK INSERT to myspecies](/docs/sql-guide/examples/sql-eg-insert/sql-eg-insert-bulk-myspecies)

## SELECT statements

A `SELECT *` statement demonstrates the values have been added to the table:

```sql
SELECT * from myspecies;
```

## SET queries SETCONTAINS

`SETCONTAINS` SQL functions are required to query values in `SET` columns:

### Query the existence of a value using `SETCONTAINS`

This statement returns `true` for the first row and `false` for the second:

```sql
select _id, setcontains(species, 'Koala') as HasKoala
    from myspecies;
```

### Return all values containing two values with `SETCONTAINSALL`

This statement returns all values from all rows that contain `Manatee` and `Sea Horse`

```sql
SELECT _id, species from myspecies where setcontainsall(species, ['Manatee','Sea Horse']);
```

### Return true or false when one or more values exist with `SETCONTAINSANY`

This statement returns true or false if a row contains either a Seahorse OR Starfish and outputs results in a column **Sea_Creatures**
```
select _id, setcontainsany(species, ['Seahorse', 'Starfish']) as Sea_Creatures
from myspecies;
```

## Further information

* [SET functions](/docs/sql-guide/functions/function-set)
