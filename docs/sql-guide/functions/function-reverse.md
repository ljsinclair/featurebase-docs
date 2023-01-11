---
title: REVERSE
layout: default
parent: Functions
grand_parent: SQL guide
nav_order: 3
---

# REVERSE() function

The `Reverse()` function returns the reversed strings from the selected column.

## Syntax

```
reverse(expr)
```

## Arguments

| Argument | Description | Data type |
|---|---|---|
| `expr` | Any expression. | `string` |

## Return Type

`string`

## Return Value

`reverse()` returns the reversed input string

## Remarks

None

## Examples

### Reversing strings in a column

```sql
create table segments
    (_id id, segment string);

insert into segments(_id,segment)
    values (1,'green')

select _id, reverse(segment) as reversed from segments;
+-----+----------+
| _id | reversed |
+-----+----------+
|   1 | neerg    |
+-----+----------+
```

### Nested reverse function

```sql
create table segments
    (_id id, segment string);

insert into segments(_id,segment)
    values (1,'red')

select _id, reverse(reverse(segment)) as segment from segments;
+-----+----------+
| _id | reversed |
+-----+----------+
|   1 | red      |
+-----+----------+
```
