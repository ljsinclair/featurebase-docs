---
title: Unique identifier
layout: default
parent: Concepts
nav_order: 4
---

## Unique identifier (working title)

Unique identifiers are required for every row of data to be imported to FeatureBase.

Traditional databases use keys to identify columns in tables. FeatureBase has a similar concept in the `_id` column.

## Before you begin

{: .important}
You may need to experiment to determine the correct values to use as your `_id`. Featurebase Cloud provides **Development** database settings for this purpose.

## How do I identify the correct `_id`?

The data you wish to import to FeatureBase may have:
* a single identifier
* two or more identifiers
* no unique identifiers

## Data contains single unique identifier

Data that contains a single unique identifier is easiest to conceptualise. For example:

| Name | Surname | Age | UUID | CampusID | Grade |
|---|---|---|---|---|---|---|
| Toby | Bandini | 14 | 63a8 | An | 9 |
| Kham | Thibault | 16 | 98e9 | An | 11 |
| Neta | Van Ogtrop | 16 | 9ccb | An | 11 |
| Refilwe | Ahlers | 15 | 7325 | An | 10 |
| Mitra | Bandini | 17 | 6ed3 | Bo | 12 |
| Hed | Pahlke | 16 | 62a5 | Bo | 11 |
| Rani | Knudsen | 15 | bd6c | Bo | 10 |
| Bahati | Cuesta | 16 | 5651 | Bo | 9 |

## Data contains two unique identifiers



| Name | Surname | Age | UUID | CampusID | Grade | StudentID |
|---|---|---|---|---|---|---|---|
| Toby | Bandini | 14 | 63a8 | An | 9 | An0 |
| Kham | Thibault | 16 | 98e9 | An | 11 | An1 |
| Neta | Van Ogtrop | 16 | 9ccb | An | 11 | An2 |
| Refilwe | Ahlers | 15 | 7325 | An | 10 | An3 |
| Mitra | Bandini | 17 | 6ed3 | Bo | 12 | Bo1 |
| Hed | Pahlke | 16 | 62a5 | Bo | 11 | Bo2 |
| Rani | Knudsen | 15 | bd6c | Bo | 10 | Bo3 |
| Bahati | Cuesta | 16 | 5651 | Bo | 9 | Bo4 |

## Source data - Students table



| SubjectID | Subject |
|---|---|
| Eng | English |
| Bio | Biology |
| Geo | Geography |
| Eco | Economics |
| Fin | Finance |
| Sci | General Science |

## Scenario 1 - import all data

If importing all data from the source table, the `UUID` column can be used as the unique identifier

## Scenario 2 - Import year 9 data



## Scenario 2 - Import Anderson Campus data

There are two ways to key the Anderson Campus data

| UUID | Age | Grade |
|---|---|---|
| 63a8 | 14 | 9 |
| 98e9 | 16 | 11 |
| 9ccb | 16 | 11 |
| 7325 | 15 | 10 |

| Campus | studentID | UUID | Age | Grade |
|---|---|---|---|---|
| (string) | (int) | (string) | (int) | (int) |
| Anderson | 0 | 63a8 | 14 | 9 |
| Anderson | 1 | 98e9 | 16 | 11 |
| Anderson | 2 | 9ccb | 16 | 11 |
| Anderson | 3 | 7325 | 15 | 10 |





If only the Anderson campus data is to be imported, there are two possible unique identifiers:
* UUID
* studentID

| Campus | studentID | UUID | Age | Grade |
|---|---|---|---|---|
| (string) | (int) | (string) | (int) | (int) |
| Anderson | 0 | 63a8 | 14 | 9 |
| Anderson | 1 | 98e9 | 16 | 11 |
| Anderson | 2 | 9ccb | 16 | 11 |
| Anderson | 3 | 7325 | 15 | 10 |

## Scenario 3 - Import student age and grade

| StudentID | Grade | Age |
|---|---|---|
| 0 | 9 | 14 |






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


## Example 2 - the data has two or more identifiers

The

| PK(_id)| INCIDENT_NUMBER | OFFENSE_CODE | OFFENSE_CODE_GROUP | OCCURRED_ON_DATE |
| ------- | ------------ | ------------ | ------------ | ------------ |
| 1 | I162097077 | 00735 | Auto Theft Recovery | 2016-11-28T12:00:00Z |
| 2 | I162097077 | 01300 | Recovered Stolen Property | 2016-11-28T12:00:00Z |
| 3 | I162097077 | 03125 | Warrant Arrests | 2016-11-28T12:00:00Z |


## Example 3 - the data has no unique identifier

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
