---
title: Query sample data
layout: default
parent: Running queries
nav_order: 1
has_toc: false
---

# How do I evaluate FeatureBase sample data?
{: .no_toc }

{% include /cloud-db/cloud-sample-db-summary.md %}

Learn how fast the FeatureBase database is by running queries against the `cseg` (customer segmentation) and `skills` tables

## Before you begin

* [Create a database with sample data](/docs/cloud/cloud-databases/cloud-db-create-sample)
* [Learn about the Cloud SQL editor](/docs/cloud/cloud-query/cloud-query-home)

## Table statements

Run the [SHOW CREATE TABLE statement](/docs/sql-guide/statements/statement-table-create-show) to output CREATE TABLE statements for both tables.

```sql
SHOW CREATE TABLE cseg;
SHOW CREATE TABLE skills;
```

### What are `IDSET` and `STRINGSET` data types?

The `cseg` table has multiple columns assigned to [`IDSET`](/docs/sql-guide/data-types/data-type-idset) and [`STRINGSET`](/docs/sql-guide/data-types/data-type-stringset) data types. These data types enable FeatureBase to store low-cardinality data (1:many relationships) in a single column without needing to rely on traditional data models such as the star schema.

## SQL queries

The following queries demonstrate sub-second latency in the FeatureBase database

## Queries

### Data Exploration 

Prove the sample database contains 1000025000 rows, the majority contained in `cseg`.

```sql
SELECT COUNT(*) FROM cseg;
SELECT COUNT(*) FROM skills;
```

Output the top 10 rows in each table:
```sql
SELECT TOP(10) * FROM cseg;
SELECT TOP(10) * FROM skills;
```

### Complex Segmentation 

```sql
SELECT SUM(income) FROM cseg
WHERE income > 5000 AND age = 45 AND (SETCONTAINSANY(skills,['Ms Office','Excel']));
```

### Aggregations

```sql
SELECT SUM(income) FROM cseg;
```

```sql
SELECT SUM(income) FROM cseg where income > 5000;
```

```sql
SELECT AVG(income) FROM cseg;
```

### Grouping with Complex Conditions

```sql
SELECT hobbies, COUNT(*) as cnt
FROM cseg
WITH (flatten(hobbies))
GROUP BY hobbies
HAVING COUNT(*) > 200000000
ORDER BY cnt DESC;
```

```sql
SELECT education, SUM(income)
FROM cseg
WITH (flatten(education))
WHERE age=18
GROUP BY education;
```

### JOINS

```
[cseg]Count(Intersect(
Row(hobbies="Teaching"),
Distinct(Row(bools='available_for_hire'), field= id, index=skills)))
```

### Top K 

```
[cseg]TopK(hobbies, k=5)
```

```
[cseg]TopK(hobbies, k=10, filter=Intersect(Row(sex=Female),Row(hobbies='Scuba Diving')))
```

## Next step

{: .important}
* [Delete the sample database](/docs/cloud/cloud-databases/cloud-db-delete) to reduce costs as soon as testing concludes

## Related information

* [FeatureBase SQL guide](/docs/sql-guide/sql-guide-home)
* [FeatureBase data types](/docs/sql-guide/data-types/data-types-home)
