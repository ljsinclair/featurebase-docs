---
title: Issue - unexpected values returned on query
layout: default
parent: FeatureBase SQL issues
grand_parent: SQL guide
---
# Issue - unexpected values returned on query

Unexpected results are returned for `SELECT...DISTINCT` and `SELECT...GROUP BY` queries that include columns assigned the following data types:
* [IDSET](/docs/sql-guide/data-types/data-type-set-setq)
* [IDSETQ](/docs/sql-guide/data-types/data-type-set-setq)
* [STRINGSET](/docs/sql-guide/data-types/data-type-set-setq)
* [STRINGSETQ](/docs/sql-guide/data-types/data-type-set-setq)

## Cause

{% include /sql-guide/datatype-set-setq-summary.md %}

{% include /sql-guide/select-set-setq-unexpected-results.md %}

## Solution

* [Learn how to use the `FLATTEN()` hint to return expected values](/docs/sql-guide/hints/hint-flatten)

## Further information

* [SELECT statement](/docs/sql-guide/statements/statement-select)
