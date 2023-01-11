---
title: STRINGSPLIT
layout: default
parent: Functions
grand_parent: SQL guide
nav_order: 5
---

# STRINGSPLIT() function

The `Stringsplit()` function splits a string into multiple substrings based on a specified separator.

## Syntax

```
stringsplit(expr,seperator,position)
```

## Arguments

| Argument | Description | Data type |
|---|---|---|
| `expr` | The input string to split. | `string` |
| `seperator` | A character or string that will be used to split the evaluated expression `expr`. | `string` |
| `position` | Optional substring to retrive from the resulting array of substrings. Defaults to 0 | `int` |

## Return Type

`string`

## Return Value

`stringsplit()` returns the substring at the position, from the resulting array of substrings.

## Remarks

None

## Examples

### Split strings and return second substring

```sql
create table segments
    (_id id, segment string);

insert into segments(_id,segment)
    values (1,'red,blue,green')

select _id, stringsplit(segment,',',1) as segment from segments;
+-----+----------+
| _id | segment  |
+-----+----------+
|   1 | blue     |
+-----+----------+
```

### Split with a column as separator

```sql
create table segments
    (_id id, segment string, separator);

insert into segments(_id, segment, separator)
    values (1,'red,blue', ',')

insert into segments(_id, segment, separator)
    values (2,'green:yellow', ':')

select _id, stringsplit(segment, separator, 0) as segment from segments;
+-----+----------+
| _id | segment  |
+-----+----------+
|   1 | red      |
|   2 | green    |
+-----+----------+
```
