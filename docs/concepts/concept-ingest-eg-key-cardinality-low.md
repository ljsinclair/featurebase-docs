---
title: Ingest example - low cardinality data
layout: default
parent: Concepts
---

# How do I map low cardinality data? (working title)

There may be times where your choice of unique identifier results in data that has a one-to-many relationship, or low cardinality.

The examples that follow explain how the low cardinality data can be ingested by FeatureBase using `SET` data types.

## Before you begin

* [Learn about data cardinality]
* [Learn about data modeling](/docs/concepts/concept-data-modeling)
* [Learn about `SET` data types](/docs/concepts/concept-datatype-set)

## Sample data

{% include /concepts/concept-eg-species-table-summary.md %}

## Choosing the unique identifier

By choosing the `Vertebrae` column as unique identifier for your data results in the `Species` column populated by low cardinality or one-to-many data:

| Vertebrae | Species |
|---|---|
| yes | Manatee, Sea Horse, Koala |
| no | Starfish |

Database normalization forms dictate that low cardinality data like that in the `yes` row is inserted into separate tables to avoid duplication.

In this example,
* the `STRINGSET` data type will be used to insert low-cardinality data into a single row
* SELECT queries with

## CREATE TABLE statement

A Create Table statement is created and run:

{% include /sql-guide/table-create-eg-stringset-datatype.md %}

## CSV ingest file

Create a CSV file with the following structure then save as `*/featurebase/import/myspecies.csv`

{: .note}
The CSV file requires no header row because the `BULK INSERT` statement specifies where the data should be inserted.

```csv
"yes", "Manatee, Sea Horse, Koala"
"no", "Star fish"
```

## BULK INSERT statement

The following `BULK INSERT` statement:
* specifies the file format
* includes the path to **myspecies.csv**
* maps each column of data in the CSV to the columns in the table.

{: .important}
An absolute file path is required to successfully insert the data

```sql
BULK INSERT
  into myspecies (_id, species)
  map (0 string, 1 stringset)
  from
    '/home/myuser/featurebase/import/myspecies.csv'
  with
    format 'CSV'
    input 'FILE';
```

## SELECT statements

A `SELECT *` statement demonstrates the values have been added to the table:

```sql
SELECT * from myspecies;
```

The following functions are required to query values in `SET` columns:
* `SETCONTAINS`
* `SETCONTAINSALL`
* `SETCONTAINSAny`

### `SETCONTAINS`

This statement returns `true` for the first row and `false` for the second:

```sql
select _id, setcontains(species, 'Koala') as HasKoala
    from myspecies;
```

### `SETCONTAINSALL`

This statement returns all values from all rows that contain `Manatee` and `Sea Horse`

```sql
SELECT _id, species from myspecies where setcontainsall(species, ['Manatee','Sea Horse']);
```

### `SETCONTAINSANY`

This statement returns true or false if a row contains either a Seahorse OR Starfish and outputs results in a column **Sea_Creatures**
```
select _id, setcontainsany(species, ['Seahorse', 'Starfish']) as Sea_Creatures
from myspecies;
```
