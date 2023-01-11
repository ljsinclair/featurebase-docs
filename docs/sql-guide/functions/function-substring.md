---
title: SUBSTRING
layout: default
parent: Functions
grand_parent: SQL guide
nav_order: 6
---

# SUBSTRING() function

`Substring()` extracts a substring from the given string, starting at the specified start index and with the specified length.

### Syntax

```
substring(expr,startIndex,length)
```

### Arguments

| Argument | Description | Data type |
|---|---|---|
| `expr` | The input string from which to extract the substring. | `string` |
| `startIndex` | The starting index of the substring in the evaluated expression, starting at zero. | `int` |
| `length` | Optional argument. The length of the substring to extract. Defaults to end of evaluated `expr` | `int` |

## Return Type

`string`

## Return Value

`substring()` returns the extracted substring

## Remarks

None

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

### Substring of a reversed string

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
