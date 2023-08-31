---
title: SETEXLCUDES()
layout: default
parent: Functions
grand_parent: SQL guide
---

# SETEXCLUDES() function

`SETEXCLUDES()` tests membership of a set of values within a set. It returns true if all of the members of `testset` do not exist in `targetset`

## Syntax

```
setexcludes(targetset, testmember)
```

## Arguments

| Argument | Description | Data type |
|---|---|---|
| `targetset` | The set in which the members of testset are being tested for membership. | `stringset` or `idset` |
| `testmember` | The single member or value to test membership for in the targetset. | Type must match `targetset` |

## Returns

| Data type | Value |
|---|---|
| `bool` | True if the member of `testmember` does not exist within `targetset` |

## Examples

{% include /sql-guide/create-table-segments.md %}

### Testing set membership in the select list

This query returns `true`.

```sql
select setexcludes(segment, 'purple') as NOTPURPLE 
    from segments;  
```

### Testing set membership as a where clause filter

This query returns `true` with the selected `_id`.

```sql
select _id from segments where setexcludes(segment, 'purple');
```

### Testing set membership as a where clause filter with multiple set members 

This query returns `true` with the selected `_id`.

```sql
select _id from segments where setexcludes(segment, 'purple') and setexcludes(segment, 'yellow');
```
