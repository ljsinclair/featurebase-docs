---
title: STRINGSET
layout: default
parent: Data types & constraints
grand_parent: SQL guide
nav_order: 7
---

# STRINGSET data type

STRINGSET is a FeatureBase datatype used with `TIMEQUANTUM` and `TTL` (Time To Live) constraints.

## DDL Syntax

```
STRINGSET [TIMEQUANTUM {value} [TTL '{value}']]
```

## Arguments

| Argument | Description |
|---|---|
| STRINGSET | Data type used to set multiple STRING values for a single column. |
{% include /sql-guide/timequantum-ttl-args.md %}

## Additional information

The STRINGSET data type:
* has a `keyed set` internal datatype
* one standard view by default unless a timeQuantum is set.
* is used when:
  * grouping by
  * searching for discrete values

{% include /sql-guide/timequantum-additional.md %}

{% include /sql-guide/ttl-additional.md %}

## Examples

### CREATE TABLE with all data types

{% include /sql-guide/table_create_eg_all_datatypes.md %}
