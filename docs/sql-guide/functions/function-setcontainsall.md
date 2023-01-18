---
title: SETCONTAINSALL()
layout: default
parent: SQL functions
grand_parent: SQL guide

---

# SETCONTAINSALL() function

`SETCONTAINSALL()` tests membership of a set of values within a set. It returns true if all of the members of `testset` exist in `targetset`

## Syntax

```
setcontainsall(targetset, testset)
```

## Arguments

| Argument | Description | Data type | Return value |
|---|---|---|---|
| `targetset` | The set in which the members of testset are being tested for membership. | `stringset` or `idset` |
| `testset` | The set of values to test membership for in the targetset. | Type must match `targetset` |

## Returns

| Data type | Value |
|---|---|
| `bool` | True if all members of `testset` exists within `targetset`

## Examples

### Testing set membership in the select list

This query returns `true`.

```sql
create table segments  
    (_id id, segment stringset);  

insert into segments(_id, segment)  
    values (1, ['RED', 'BLUE', 'GREEN']);  

select setcontainsall(segment, ['BLUE', 'RED']) as HasBlueOrRed  
    from segments;  

```

### Testing set membership as a where clause filter
```sql
create table segments  
    (_id id, segment stringset);  

insert into segments(_id, segment)  
    values (1, ['RED', 'BLUE', 'GREEN']);  

select _id, segment from segments where setcontainsall(segment, ['BLUE', 'RED']);
+-----+------------------+
| _id | segment          |
+-----+------------------+
|   1 | [RED BLUE GREEN] |
+-----+------------------+
```
