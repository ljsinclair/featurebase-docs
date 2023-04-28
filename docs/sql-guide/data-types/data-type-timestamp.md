---
title: TIMESTAMP
layout: default
parent: Data types & constraints
grand_parent: SQL guide
nav_order: 10
---
## Before you begin
* [Learn about unix epoch/unix time](https://en.wikipedia.org/wiki/Unix_time){:target="_blank"}

# TIMESTAMP data type

Timestamp is a date-time data type which represents the specified `timeunit` as integer values elapsed since the specified Unix Epoch.

## DDL Syntax

```
TIMESTAMP [TIMEUNIT {value}]
```

## Arguments

| Argument | Description | Further information |
|---|---|---|
| TIMESTAMP | Time and date data type used for time series analysis | [Time stamp](https://en.wikipedia.org/wiki/Timestamp) |
| TIMEUNIT | The time unit in which to store a timestamp that defaults to second `s` | See [TIMEUNIT values](#timeunit-value) |

## Additional information

{% include /sql-guide/timestamp-timeunit-table.md %}

## Update Behavior

{% include /sql-guide/mutex_updates.md %}

## Examples

### CREATE TABLE with all data types

{% include /sql-guide/table_create_eg_all_datatypes.md %}
