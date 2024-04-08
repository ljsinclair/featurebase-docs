---
title: STRING
layout: default
parent: Data types & constraints
grand_parent: SQL guide
nav_order: 7
---

# STRING data type

The `STRING` data type has a `keyed-mutex` internal type and is recommended for queries:
* on discrete values,
* with `group by` where cardinality is low

## Syntax

```
STRING[(max)]
```

## Arguments

| Argument | Description |
|---|---|
{% include /sql-guide/max-val-string-varchar.md %}

## Additional information

{% include /sql-guide/unique-id-string-warning.md %}

### String literals

{% include /sql-guide/string-literal-def.md %}

## Examples

{% include /sql-guide/table-create-prod-sale-string-eg.md %}

{% include /sql-guide/select-string-type-eg.md %}
