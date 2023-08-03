---
title: BULK INSERT CSV example
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 5
---

# Ingest a CSV with BULK INSERT

This example demonstrates how to:

* Create a FeatureBase table with a required structure
* Copy and transform data from an CSV source
* Use the `BULK INSERT` statement to copy data from the source to the target table.

## Before you begin

{% include /sql-guide/bulk-insert-eg-before-begin.md%}

## Step 1: create table

```sql
CREATE TABLE age (
    _id STRING,
    name STRING,
    description STRING,
    gender STRING,
    country STRING,
    occupation STRING,
    birth_year INT min -32767 max 32767,
    death_year INT min -32767 max 32767,
    death_manner STRING,
    birth_age INT min -32767 max 32767
);
```

## Step 2: ingest data

```sql
BULK INSERT
INTO age (_id, name, description, gender, country, occupation,
    birth_year, death_year, death_manner, birth_age )
MAP(0 STRING,
1 STRING,
2 STRING,
3 STRING,
4 STRING,
5 STRING,
6 INT,
7 INT,
8 STRING,
9 INT )
FROM
    'https://featurebase-public-data.s3.us-east-2.amazonaws.com/age.csv'
WITH
    BATCHSIZE 100000
    FORMAT 'CSV'
    INPUT 'URL'
    HEADER_ROW;

```

## Step 3: query the data

```sql
SELECT COUNT(*) FROM age;
```
```sql
SELECT TOP(10) * FROM age;
```

## Further information

* [SELECT statement](/docs/sql-guide/statements/statement-select)
* [BULK INSERT using NDJSON data source](/docs/sql-guide/statements/statement-insert-bulk-ndjson-example)
* [BULK INSERT using PARQUET data source](/docs/sql-guide/statements/statement-insert-bulk-parquet-example)
