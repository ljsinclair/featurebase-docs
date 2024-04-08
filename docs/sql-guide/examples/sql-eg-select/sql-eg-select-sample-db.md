---
title: Query a billion row database
layout: default
parent: SQL Examples
grand_parent: SQL guide
nav_order: 1
nav_exclude: true
---

# How do I query the billion row database?
{: .no_toc }

{% include /cloud-db/cloud-sample-db-summary.md %}

Learn how fast the FeatureBase database is by running queries against the `cseg` (customer segmentation) and `skills` tables

{% include page-toc.md %}

## Before you begin
{: .no_toc }

* [Create a Cloud database with sample data](/docs/cloud/cloud-getstart/cloud-evaluate)

## Table statements

Run `SHOW CREATE TABLE` statements to view the table structure:

```sql
SHOW CREATE TABLE cseg;
SHOW CREATE TABLE skills;
```

{: .note}
>FeatureBase `IDSET` and `STRINGSET` data types are present in both tables:
>* [Learn about the IDSET data type](/docs/sql-guide/data-types/data-type-set-setq)
>* [Learn about the STRINGSET data type](/docs/sql-guide/data-types/data-type-set-setq)

## SQL queries

The following queries demonstrate sub-second latency in the FeatureBase database

### Data Exploration 

Prove there are over one billion rows in the database with these queries:

| Query | Result |
|---|---|
| `SELECT COUNT(*) FROM cseg;` | 1000000000 |
| `SELECT COUNT(*) FROM skills;` | 25000 |

Output the top 10 rows in each table:
```sql
SELECT TOP(10) * FROM cseg;
SELECT TOP(10) * FROM skills;
```

### Aggregate queries

These queries aggregate the values in the `income` column of the `cseg` table.

| Query | Result |
|---|---|
| `SELECT SUM(income) FROM cseg;` | 100775986981472 |
| `SELECT SUM(income) FROM cseg where income > 5000;` | 100700159226528 |
| `SELECT AVG(income) FROM cseg;` | 100775.9869 |

### Complex segmentation 

The following query, based on the aggregate queries above, has the following conditions:
* `income` is greater-than 5000
* `age` is 45
* `skills` column contain either of `MS Office` or `Excel`

| Query | Result | Additional information |
|---|---|---|
| `SELECT SUM(income) FROM cseg WHERE income > 5000 AND age = 45 AND (SETCONTAINSANY(skills,['Ms Office','Excel']));` | 32177307009 | [SETCONTAINSANY function](/docs/sql-guide/functions/function-set) |

### Grouping with Complex Conditions


<!-- commenting out because these hang cloud. Jira is FB-2480

```sql
SELECT hobbies, COUNT(*) as cnt
FROM cseg
GROUP BY hobbies
HAVING COUNT(*) > 200000000
ORDER BY cnt DESC;
```

```sql
SELECT education, SUM(income)
FROM cseg
WHERE age=18
GROUP BY education;
```
-->

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
WITH (FLATTEN(education))
WHERE age=18
GROUP BY education;
```

## Next step

{: .important}
Delete the database or tables as soon as testing finishes to reduce costs.

* [Delete the sample database in FeatureBase Cloud](/docs/cloud/cloud-databases/cloud-db-delete), or
* Delete the tables with SQL `DROP TABLE cseg;` and `DROP TABLE skills;`

## Related information

* [FeatureBase SQL guide](/docs/sql-guide/sql-guide-home)
* [FeatureBase data types](/docs/sql-guide/data-types/data-types-home)
