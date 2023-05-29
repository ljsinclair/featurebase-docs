---
title: Unique identifier
layout: default
parent: Concepts
nav_order: 4
---

## Unique identifier (working title)

This high-level overview explains

unique identifier
needed for data being imported


Each row in a FeatureBase database has a unique identifier which is found in the `_id` column.

This must be determined before attempting to import data to FeatureBase.


## Unique identifier data type

The `_id` can be one of two data types:

| Data type | Values | Additional information |
|---|---|---|
| `id` | integer | [ID data type](/docs/sql-guide/data-types/data-type-id) |
| `string` | string | [STRING data type](/docs/sql-guide/data-types/data-type-string) |


## How do I identify appropriate values for the `_id` column?

Any unique integer or string value in your source data can be used as a row `_id`. For example, the `UUID` field in the following table:

| Campus | studentID | UUID | Age | Grade |
|---|---|---|---|---|
| (string) | (int) | (string) | (int) | (int) |
| Anderson | 0 | 63a8 | 14 | 9 |
| Anderson | 1 | 98e9 | 16 | 11 |
| Anderson | 2 | 9ccb | 16 | 11 |
| Anderson | 3 | 7325 | 15 | 10 |
| Bowie    | 0 | 6ed3 | 17 | 12 |
| Bowie    | 1 | 62a5 | 16 | 11 |
| Bowie    | 2 | bd6c | 15 | 10 |
| Bowie    | 3 | 5651 | 16 | 10 |

## What if my table has no unique identifier?

{: .important}
This method is not available if importing data using the SQL `BULK IMPORT`
statement.

In this example, the `IRIS_CLASS_MEASUREMENTS` table has no unique ID:

| sepal_len_cm | sepal_wid_cm| petal_len_cm | petal_wid_cm | class |
|---|---|---|---|---|
| 5.1 | 3.5 | 1.4 | 0.2 | Iris-setosa |
| 4.9 | 3.0 | 1.4 | 0.2 | Iris-setosa |
| 4.7 | 3.2 | 1.3 | 0.2 | Iris-setosa |
| 7.0 | 3.2 | 4.7 | 1.4 | Iris-versicolor |
| 6.4 | 3.2 | 4.5 | 1.5 | Iris-versicolor |
| 6.9 | 3.1 | 4.9 | 1.5 | Iris-versicolor |
| 6.3 | 3.3 | 6.0 | 2.5 | Iris-virginica |
| 5.8 | 2.7 | 5.1 | 1.9 | Iris-virginica |
| 7.1 | 3.0 | 5.9 | 2.1 | Iris-virginica |

If importing this table to FeatureBase Community using CLI ingest methods, you can:

* Combine two or more columns to create a unique identifier
* Auto-generate a unique identifier



## Ingest requirements


Ingesters support four ways to do specify the unique identifier.

- `primary-key-fields`,
- `id-field`,
- `external-generate`, to use the FeatureBase ID allocator, optionally including `offset-mode`,
- `auto-generate`, suitable for testing.
