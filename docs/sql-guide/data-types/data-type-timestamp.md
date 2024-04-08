---
title: TIMESTAMP
layout: default
parent: Data types & constraints
grand_parent: SQL guide
nav_order: 10
---

# TIMESTAMP data type

`TIMESTAMP()` accepts any unix-epoch or ISO-8601 timestamp value.

These values are encoded by FeatureBase as a unix-epoch integer based on the chosen time-unit.

## Before you begin

* [Learn about ISO-8601 timestamp standard](https://www.iso.org/iso-8601-date-and-time-format.html){:target="_blank"}
* [Learn about unix epoch/unix time](https://en.wikipedia.org/wiki/Unix_time){:target="_blank"}

## Syntax

```
TIMESTAMP [TIMEUNIT {time-unit}]
```

## Arguments

| Argument | Description | Default | Additional information |
|---|---|---|
| TIMESTAMP | Data type that accepts unix epoch integer or string literal ISO-8601 timestamps |  | [Time stamp converter](https://www.timestamp-converter.com/){:target="_blank"} |
| TIMEUNIT | Time unit used to convert the value to unix-epoch timestamp | `s` (second) | [TIMEUNIT values](#timeunit-value) |

## Additional information

### TIMEUNIT value

{: .important}
Time units are treated as string literals and require a single quotation mark.

| Unit | Declaration |
|---|---|
{% include /sql-guide/timestamp-ttl-timeunit-table.md %}

## Examples

### Implicitly convert integer to timestamp

Integer values inserted into a column with `timestamp` data type are converted to a value of seconds since the beginning of the unix epoch.

#### Demo table

```sql
create table demo
    (_id id, ts timestamp timeunit 's');

insert into demo(_id, ts)
    values (1, 0);
insert into demo(_id, ts)
    values (2, 86400);
insert into demo(_id, ts)
    values (3, 90061);
insert into demo(_id, ts)
    values (4, -86400);
```

#### SELECT() statement

```sql
select _id, ts from demo;
```

#### Results

```
| _id |           ts                  |
|-----|-------------------------------|
| 1   | 1970-01-01 00:00:00 +0000 UTC |
| 2   | 1970-01-02 00:00:00 +0000 UTC |
| 3   | 1970-01-02 01:01:01 +0000 UTC |
| 4   | 1969-12-31 00:00:00 +0000 UTC |
```
