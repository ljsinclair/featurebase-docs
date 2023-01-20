---
title: BULK INSERT JSON example
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 1
---

# BULK INSERT example using NDJSON file

This example demonstrates how to:

* Create a FeatureBase table with a required structure
* Copy and transform data from an NDJSON source
* Insert data into the FeatureBase table

## Before you begin

* [Learn about the age dataset](https://www.gharchive.org/)
* [BULK INSERT statement](/docs/sql-guide/statements/statement-insert-bulk)
Cloud users:
{% include /cloud-db/cloud-db-dependencies.md %}
Community users:
* [Learn how to create tables](/docs/sql-preview/sql-create-table)

## Step 1: create `github-stats` table

```sql
CREATE TABLE github-stats (
_id ID,
type STRING,
actor_id ID,
actor_login STRING,
actor_url STRING,
repo_id ID,
repo_name STRING,
repo_url STRING,
payload_ref STRING,
payload_ref_type STRING,
payload_master_branch STRING,
payload_description STRING,
payload_pusher_type STRING,
public BOOL,
created_at TIMESTAMP
);
```

## Step 2: BULK INSERT data to `github-stats` table

This BULK INSERT SQL statement:

* Designates a target table
* MAPS source data
* Performs a pre-insertion TRANSFORM on MAPped data
* Designates a source URL
* Adds WHERE clauses to
  * indicate ingest batch size,
  * state NDJSON format and URL source
  * override batch ingest error

```sql
BULK INSERT INTO github-stats (
_id,
type,
actor_id,
actor_login,
actor_url,
repo_id,
repo_name,
repo_url,
payload_ref,
payload_ref_type,
payload_master_branch,
payload_description,
payload_pusher_type,
public,
created_at
)
MAP (
'$.id' ID,
'$.type' STRING,
'$.actor.id' ID,
'$.actor.login' STRING,
'$.actor.url' STRING,
'$.repo.id' ID,
'$.repo.name' STRING,
'$.repo.url' STRING,
'$.payload.ref' STRING,
'$.payload.ref_type' STRING,
'$.payload.master_branch' STRING,
'$.payload.description' STRING,
'$.payload.pusher_type' STRING,
'$.public' BOOL,
'$.created_at' TIMESTAMP )
TRANSFORM(
@0,
@1,
@2,
@3,
@4,
@5,
@6,
@7,
@8,
@9,
@10,
@11,
@12,
CAST(@13 as BOOL),
@14)
FROM 'https://featurebase-public-data.s3.us-east-2.amazonaws.com/github-2015-data.json'
WITH
BATCHSIZE 10000
FORMAT 'NDJSON'
INPUT 'URL'
ALLOW_MISSING_VALUES;
```

## Step 3: query the data

```sql
SELECT COUNT(*) FROM github-stats;
```
```sql
SELECT TOP(10) * FROM github-stats;
```

## Further information

* [BULK INSERT using CSV data source](/docs/sql-guide/statements/statement-insert-bulk-csv-example)
