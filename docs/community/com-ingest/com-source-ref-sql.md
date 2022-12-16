---
title: SQL source reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 4
---

FeatureBase can import data from MySQL, Postgres and MySQL databases using SQL queries executed at the command line.

## Before you begin

* [Learn how to manage import]FILE COMING IN OTHER PR
* [Learn about data modeling]FILE COMING IN OTHER PR
* Login credentials to the source database
* SELECT privileges on source tables
* Other privileges as required

### Connect string (merge into the include file, below)

The SQL ingest tool connects to the source database using your login credentials before executing SQL queries.

<!-- Enable once com-ingest-csv is merged and deployed

 {% include /community/com-ingest-flag-sql-connect-string.md%}

-->

## Command-line SQL statements

QUESTION: ARE SQL STATEMENTS EXECUTED ON THE SOURCE DB? IF SO, they can be tested before using in SQL ingest tool?

Once connected to the source database, SQL queries copy data which is then batched, converted to Roaring Bitmap format then saved to a target FeatureBase index.

FeatureBase SQL ingest tool supports the following SQL:

* [SQL-preview] LINK ONCE IT'S COPIED ACROSS
* [Data types]
* [Functions]

## Mapping data types

CONVERT SOURCE MAPPING TABLE TO INCLUDE THEN ADD HERE

## Examples

NOT SURE IF THERE ARE ANY?
