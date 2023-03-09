---
title: DATETIMEFROMPARTS()
layout: default
parent: SQL functions
grand_parent: SQL guide
---

# DATETIMEFROMPARTS() function

The `DATETIMEFROMPARTS()` function takes integer date and time arguments and returns timestamp.

## Syntax

```
DATETIMEFROMPARTS(int_year, int_month, int_date, int_hour, int_minute, int_seconds, int_milliseconds)
```

## Arguments

| Argument         | Data type | Description                                                                                     | Required | Further information |
|------------------|-----------|-------------------------------------------------------------------------------------------------|---|---|
| int_year         | integer   | Integer value that specifies year [0,9999]                                                      | Yes | |
| int_month        | integer   | Integer value that specifies month [1,12]                                                       | Yes | |
| int_day          | integer   | Integer value that specifies day [0,31]                                                         | Yes | |
| int_hour         | integer   | Integer value that specifies hour [0,23]                                                        | Yes | |
| int_minutes      | integer   | Integer value that specifies minutes [0,59]                                                     | Yes | |
| int_seconds      | integer   | Integer value that specifies seconds [0,59]                                                     | Yes | |
| int_milliseconds | integer   | Integer value that specifies milliseconds [0,999]                                               | Yes | |


## Returns

| Data type | Value                                                       |
|-----------|-------------------------------------------------------------|
| timestamp | Returns date-time representing the date and time specified. |

## Additional information

The `DATETIMEFROMPARTS` function combines date and time arguments to return a fully initialized `timestamp` value. 
If any of the arguments have an invalid value, such as a month value that is greater than 12 
or a day value that is greater than the number of days in the specified month, the function will raise an error.
Additionally, if any of the required arguments have a `null` value, the function will return a `null` value.

## Examples

### Creating timestamp of the first commit to Featurebase.

```sql
select datetimefromparts(2013,10,16,17,34,43,0) as FirstCommit;

|      FirstCommit     |
+----------------------+
| 2013-10-16T17:34:43Z |

```
