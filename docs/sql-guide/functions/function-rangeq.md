---
title: RANGEQ()
layout: default
parent: Functions
grand_parent: SQL guide
---

# RANGEQ() function

The `RANGEQ()` function returns values between specified timestamps for `SETQ` columns.

## Before you begin
* [Learn about unix epoch/unix time](https://en.wikipedia.org/wiki/Unix_time){:target="_blank"}
* [SETQ data type](/docs/sql-guide/data-types/data-type-set-setq)

## Syntax

```sql
RANGEQ(<setq-column>,{<timestamp-start> | NULL},{<timestamp-end> | NULL})
```

## Arguments

| Argument | Description | Additional information |
|---|---|---|
| `<setq-column>` | Any `IDSETQ` or `STRINGSETQ` column | * [SET and SETQ data types](/docs/sql-guide/data-types/data-type-set-setq) |
| `<timestamp-start>` | Unix-epoch timestamp which is the first value in a range from which to return results | Substitute `NULL` if value not known |
| `<timestamp-end>` | Unix-epoch timestamp which is last value in range from which to return results. | Substitute `NULL` if value not known |

## Additional information

{: .note}
Only one `NULL` value is permitted

## Returns

| Data type | Value |
|---|---|
| `TIMESTAMP` | Returns UNIX-epoch integer timestamp between `<timestamp-start>` and `<timestamp-end>` |

## Examples

### Source table definition

{% include /sql-guide/create-table-with-stringsetq-timeq.md %}

{% include /sql-guide/insert-into-table-stringsetq-timeq.md %}

### SELECT with two RANGEQ() timestamps

{% include /sql-guide/select-from-stringsetq-timeq.md %}

## SELECT with one RANGEQ() timestamp

{% include /sql-guide/select-from-stringsetq-timeq-one-arg.md %}

## Further information

* [SET functions](/docs/sql-guide/functions/function-set)
