---
title: Importing low cardinality data
layout: default
parent: Concepts
---

# How do I map low cardinality data? (working title)

There may be times where your choice of unique identifier results in data that has low cardinality where the relationships are:
* a one-to-many
* many-to-many

The purpose of this content is to:
* provide an example of how the choice of unique identifier may lead to low cardinality data
* provide examples of how this data can be successfully imported to FeatureBase without requiring separate tables and keys to maintain relationships.

## Before you begin

* [Learn about data cardinality](/docs/concepts/concepts-home)
* [Learn about data modeling](/docs/concepts/concept-data-modeling)
* [Learn about `SET` data types](/docs/concepts/concept-datatype-set)

## Sample data

{% include /concepts/concept-eg-species-table-data.md %}

## Choosing the unique identifier

The choice of `Vertebrae` as unique identifier for your data results in the `Species` column populated by low cardinality or one-to-many data:

| Vertebrae | Species |
|---|---|
| yes | Manatee, Sea Horse, Koala |
| no | Starfish |

If the data were to be inserted into a traditional RDBMS database, the low cardinality data would be inserted into separate tables to avoid duplication.

FeatureBase allows you to insert the data into a single row without losing the ability to query individual items.

## Create the destination table statement

A Create Table statement is created and run:

{% include /sql-guide/table-create-eg-stringset-datatype.md %}

The `STRINGSET` data type allows you to insert the species data as individual items within the same row and column.

## Create a source file containing the data

Create a CSV file with the following structure then save as `*/featurebase/import/myspecies.csv`

{: .note}
A header row is not required because the `BULK INSERT` statement defines the destination columns

```csv
"yes", "Manatee, Sea Horse, Koala"
"no", "Starfish"
```

## BULK INSERT statement

The following `BULK INSERT` statement:
* specifies the file format
* requires an absolute path to **myspecies.csv**
* maps each column of data in the CSV to the columns in the table.

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

## Confirm the data is successfully inserted

A `SELECT *` statement demonstrates the values have been added to the table:

```sql
SELECT * from myspecies;
```

## Querying the data

The following functions are required to query values in `SET` columns:
* `SETCONTAINS`
* `SETCONTAINSALL`
* `SETCONTAINSANY`

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
