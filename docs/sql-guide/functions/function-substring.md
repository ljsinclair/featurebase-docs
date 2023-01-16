---
title: SUBSTRING()
layout: default
parent: functions
grand_parent: SQL guide
nav_order: 10
---

# SUBSTRING() string function

`Substring()` extracts a substring from the given string, starting at the specified start index and with the specified length.

## Syntax

```
substring(expr,startIndex,length)
```

## Arguments

| Argument | Description | Data type | Return value |
|---|---|---|---|
| `expr` | Input string to extract a substring |
| `startIndex` | The starting index of the substring in the evaluated expression is an `int` data type starting from zero. |
| `length` | An optional integer length of the substring to extract. Defaults to end of evaluated `expr`. |

## Returns

| Data type | Value |
|---|---|
| `string` | Returns the extracted substring based on `startIndex` and optional `length`. |

## Examples

### Substring of the string in a column

```sql
create table segments
    (_id id, segment string);

insert into segments(_id,segment)
    values (1,'green')

select _id, substring(segment,0,3) as substr from segments;
+-----+----------+
| _id | substr   |
+-----+----------+
|   1 | gre      |
+-----+----------+
```

B. Substring of a reversed string.
```sql
create table segments
    (_id id, segment string);

insert into segments(_id,segment)
    values (1,'red')

select _id, substring(reverse(segment), 1) as substr from segments;
+-----+----------+
| _id | substr   |
+-----+----------+
|   1 | er       |
+-----+----------+
```
