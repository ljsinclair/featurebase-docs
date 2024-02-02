---
title: BULK INSERT INTO myspecies
layout: default
parent: SQL Examples
grand_parent: SQL guide
nav_exclude: true
---

# BULK INSERT data to myspecies

The following `BULK INSERT` SQL statement:
* specifies the file format
* requires an absolute path to **myspecies.csv** (which can be altered to your system)
* maps each column of data in the CSV to the columns in the `myspecies` table.

## Before you begin

* [BULK INSERT statement](/docs/sql-guide/statements/statement-insert-bulk)
* [Learn about data modeling low-cardinality data](/docs/cloud/cloud-faq/cloud-faq-data-modeling)
* [CREATE TABLE myspecies](/docs/sql-guide/examples/sql-eg-table/sql-eg-table-create-myspecies)

## Create a CSV data source

Create a CSV file with the following structure then save as `*/featurebase/import/myspecies.csv`

{: .note}
A header row is not required because the `BULK INSERT` statement defines the destination columns

```
"yes", "Manatee, Sea Horse, Koala"
"no", "Starfish"
```

## BULK INSERT to `myspecies`

{: .note}
The `MAP` clause always uses `0` to correspond to the table `_id` unique identifier.

```sql
BULK INSERT INTO myspecies (_id, species)
  MAP (0 string, 1 stringset)
  FROM
    '/home/myuser/featurebase/import/myspecies.csv'
  WITH
    FORMAT 'CSV'
    INPUT 'FILE';
```

## Next step

* [Query the `myspecies` table](/docs/sql-guide/examples/sql-eg-select/sql-eg-select-from-myspecies)
