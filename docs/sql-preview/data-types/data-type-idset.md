---
title: IDSET
layout: default
parent: Data types
grand_parent: SQL preview
nav_order: 3
---

# IDSET data type

IDSET is a FeatureBase datatype used with `timeQuantum` and `ttl` constraints.

## API syntax

```
IDSET [TIMEQUANTUM {value} [TTL '{value}}']]
```

## Arguments

| Argument | Description |
|---|---|
| IDSET | Data type used where there is a need to set multiple ID values for a single column |
{% include /data-types/timequantum-ttl-args.md %}

## Additional information

The IDSET data type:
* has a `set` internal data type
* one standard view by default unless a timeQuantum is set.
* is used for:
  * grouping by
  * searching for discrete values

NOTE: Use the INT data type to perform range queries using `<` or `>`

{% include /data-types/timequantum-additional.md %}

{% include /data-types/ttl-additional.md %}
