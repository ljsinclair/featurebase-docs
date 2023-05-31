---
title: Example - low-cardinality
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

## Choosing a unique identifier with high cardinality data

By choosing the `Vertebrae` column as unique identifier for data results in low cardinality or one-to-many data in the `Species` column:

| Vertebrae | Species |
|---|---|
| yes | Manatee, Sea Horse, Koala |
| no | Starfish |

To be able to query the `Species` column, the individual animals must be in their own rows.

The `SET` data type allows this to occur.

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
An absolute file path is required for a successful query

```sql
BULK INSERT
  into myspecies (_id, species)
  map (0 string, 1 stringset, 2 stringset, 3 stringset)
  from
    '/home/myuser/featurebase/import/myspecies.csv'
  with
    format 'CSV'
    input 'FILE';
```

## SELECT statement

The results of this SELECT statement proves the approach

```sql
SELECT * from myspecies;
```

Results:

| id | species |
|---|---|
| yes |
