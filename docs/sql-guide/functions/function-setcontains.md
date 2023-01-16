---
title: SETCONTAINS()
layout: default
parent: functions
grand_parent: SQL guide
nav_order: 1
---

# SETCONTAINS() function

SETCONTAINS() tests membership of a value within a set expression.

## Syntax

```
setcontains(set, value)
```

## Arguments

| Argument | Description | Data type | Return value |
|---|---|---|---|
| `set` | The set in which value is being tested for membership. | `stringset` or `idset` |
| `value` | The value to test membership for in the set. `value` must be assignment compatible with the element type of the set. |

## Returns

| Data type | Value |
|---|---|
| `bool` | True if `value` is member of set. |

## Examples

### Testing set membership in the select list

This query returns `true`.

```sql
create table segments  
    (_id id, segment stringset);  

insert into segments(_id, segment)  
    values (1, ['RED', 'BLUE', 'GREEN']);  

select setcontains(segment, 'BLUE') as HasBlue  
    from segments;  
```

### Testing set membership as a where clause filter

```sql
create table segments  
    (_id id, segment stringset);  

insert into segments(_id, segment)  
    values (1, ['RED', 'BLUE', 'GREEN']);  

select _id, segment from segments where setcontains(segment, 'BLUE');  
+-----+------------------+
| _id | segment          |
+-----+------------------+
|   1 | [RED BLUE GREEN] |
+-----+------------------+
```
