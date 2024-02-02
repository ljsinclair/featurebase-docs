---
title: Low cardinality data
layout: default
parent: SQL Examples
grand_parent: SQL guide
nav_exclude: true
---

# CREATE TABLE myspecies

A BULK INSERT statement will read data from a CSV file then insert to `myspecies` table.

The `STRINGSET` data type allows a comma-separated array of data to be inserted in a single table record.

## Before you begin

* [Learn about data modeling low-cardinality data](/docs/cloud/cloud-faq/cloud-faq-data-modeling)
* [STRINGSET data type](/docs/sql-guide/data-types/data-type-stringset)

## CREATE TABLE statement

```sql
CREATE TABLE myspecies
  (
    _id string,
    species stringset
  );
```

## Next step

* [Create a CSV data source then run BULK INSERT](/docs/sql-guide/examples/sql-eg-insert/sql-eg-insert-bulk-myspecies)
