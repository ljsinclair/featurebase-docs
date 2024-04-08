---
title: SET & SETQ
layout: default
parent: Data types & constraints
grand_parent: SQL guide
nav_order: 8
---

# `SET` and `SETQ` data types

{% include /sql-guide/datatype-set-setq-summary.md %}

## Syntax

```sql
{ID | STRING}SET{Q TIMEQUANTUM '<date-unit>' [TTL '<int-value><time-unit>']}
```

## Arguments

| Argument | Description | Required? | Default | Additional information |
|---|---|---|---|---|
| `ID` | Values to be inserted conform to `ID` data type |  |  | [ID data type](/docs/sql-guide/data-types/data-type-id) |
| `STRING` | Values to be inserted conform to `STRING` data type |  |  | [STRING data type](/docs/sql-guide/data-types/data-type-string) |
| `SET` | Comma-separated array of values | Yes |  |
| `SETQ` | Comma-separated array of values identified by a Unix-epoch or ISO-8601 timestamp |  |  | [TIMESTAMP data type](/docs/sql-guide/data-types/data-type-timestamp) |
| `TIMEQUANTUM` | `SETQ` constraint that creates views on `SETQ` data for each `<date-unit>` | Y |  | [TIMEQUANTUM views](#timequantum-views)<br/>* [TIMEQUANTUM view deletion](#timequantum-view-deletion) |
| `<date-unit>` | One or more sequential, descending date units, defined as `Y`, `M`, `D`, `H` | Y |  | [TIMEQUANTUM views](#timequantum-views) |
| `TTL` | Governs automatic deletion of `TIMEQUANTUM` views | Optional | `0s` (disables `TTL`) | * [TTL (Time To Live)](#ttl-time-to-live)<br/>* [TIMEQUANTUM view deletion](#timequantum-view-deletion)|
| `'<int-value><time-unit>'` | String literal that requires a positive integer with time-unit | Y | `'0s'` | [TTL (Time To Live)](#ttl-time-to-live) |

## Additional information

### INSERT and UPSERT behaviour

INSERT or UPSERT behaviour occurs when any of the following are true:

| Change type | `_id` | `TIMEQUANTUM` | `SET` values |
|---|---|---|---|
| INSERT | New | New | New |
| UPSERT | Existing | Existing | New |

### TIMEQUANTUM views

A TIMEQUANTUM view is created for each `<date-unit>` defined in a `CREATE TABLE` statement

| Name | `<date-unit>` declaration | View timestamp |
|---|---|---|
| Year | `Y` | YYYY-01-01T00:00:00.000Z |
| Month | `M` | YYYY-MM-01T00:00:00.000Z |
| Day | `D` | YYYY-MM-DDT00:00:00.000Z |
| Hour | `H` | YYYY-MM-DDTHH:00:00.000Z |

TIMEQUANTUM views:
* improve the responsiveness of Range queries where a query uses the same combination of date units
* increase storage overheads which may require the use of `TTL`(time-to-live)

### TTL (Time To Live)

An integer and time unit are used to calculate the number of seconds before a `TIMEQUANTUM` view can be deleted.

{: .note}
>`TTL` defaults to `0s` which means:
>* No `TIMEQUANTUM` views are deleted,
>* Disk requirements will increase
> FeatureBase recommends `TTL '1h'` for best results

| Name | `<time-unit>` declaration |
|---|---|
| Hour | `h` |
| Minute | `m` |
{% include /sql-guide/timestamp-ttl-timeunit-table.md %}

### `TIMEQUANTUM` view deletion

To determine when `TIMEQUANTUM` views are deleted, FeatureBase performs the following operations:

* Timestamp values are converted to Unix-epoch seconds since 1970-01-01
* TTL is converted to seconds, regardless of its `<time-unit>`

If the following equation is true, the `TIMEQUANTUM` view is deleted:

```
<database-timestamp> - <view-timestamp> >= <ttl-value>
```

{: .note}
`TIMEQUANTUM` view deletion may not occur immediately because:
* the database timestamp is governed by the vendor region
* views may contain large quantities of data

### Value definition

Use the following syntax to `INSERT` or `BULK INSERT` values to `SET` and `SETQ` columns in a target table:

| Column data type | Assignment | Additional information |
|---|---|---|
{% include /sql-guide/set-setq-value-def.md %}

{% include /sql-guide/set-setq-csv-datasource-ref.md %}

### GROUP BY issues on SET and SETQ data types

* [GROUP BY issues for SET and SETQ data types](/docs/sql-guide/issues/select-groupby-flatten-set-setq)

## Examples

{% include /sql-guide/table-create-types-all-eg.md %}

### INSERT statement

```sql
INSERT INTO all-datatypes (_id, idsetcol, idsetqcol, stringsetcol, stringsetqcol) VALUES

(1, [10,20,30],
{1709706283,[90,80,70]},
['ten', 'twenty', 'thirty'],
{'2024-03-06T06:24:43.261Z',['ninety','eighty','seventy']});

```

## Further information

* [SET functions](/docs/sql-guide/functions/function-set)
* [RANGE function](/docs/sql-guide/functions/function-rangeq)
