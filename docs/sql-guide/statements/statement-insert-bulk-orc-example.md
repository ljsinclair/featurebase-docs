---
title: BULK INSERT ORC example
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 5
---

# Ingest a ORC file with BULK INSERT

This example demonstrates how to:

* Create a FeatureBase table with a required structure
* Copy and transform data from an ORC source
* Use the `BULK INSERT` statement to copy data from the source to the target table.

## Before you begin

{% include /sql-guide/bulk-insert-eg-before-begin.md%}

## Step 1: create table

```sql
CREATE TABLE sampleorc (
    _id ID,
    a STRING,
    b BOOL,
    c INT
);
```

## Step 2: ingest data

```sql
BULK INSERT
      INTO sampleorc(_id,a,b,c )
      MAP(
    0 id,
    1 STRING,
    2 BOOL
    3 INT )
 FROM
	'https://sample-files-hh.s3.us-east-2.amazonaws.com/samplefile.orc'
 WITH 
    FORMAT 'ORC'
    INPUT 'URL';
```


## Step 3: query the data

```sql
SELECT * FROM sampleorc;
```

## Further information

* [SELECT statement](/docs/sql-guide/statements/statement-select)
* [BULK INSERT using NDJSON data source](/docs/sql-guide/statements/statement-insert-bulk-ndjson-example)
* [BULK INSERT using CSV data source](/docs/sql-guide/statements/statement-insert-bulk-csv-example)
* [BULK INSERT using PARQUET data source](/docs/sql-guide/statements/statement-insert-bulk-parquet-example)
