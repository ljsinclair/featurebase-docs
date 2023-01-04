---
title: STRINGSET data type
---

STRINGSET is a FeatureBase datatype used with `TIMEQUANTUM` and `TTL` (Time To Live) constraints.

## Syntax

```
STRINGSET [TIMEQUANTUM {value} [TTL '{value}}']]
```

## Arguments

| Argument | Description |
|---|---|
| STRINGSET | Data type used to set multiple STRING values for a single column. |
{% include /data-types/timequantum-ttl-args.md %}

## Additional information

The STRINGSET data type:
* has a `keyed set` internal datatype
* one standard view by default unless a timeQuantum is set.
* is used when:
  * grouping by
  * searching for discrete values

{% include /data-types/timequantum-additional.md %}

{% include /data-types/ttl-additional.md %}
