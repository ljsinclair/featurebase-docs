---
title: SETCONTAINSANY()
layout: default
parent: SQL functions
grand_parent: SQL guide
---

# SETCONTAINSANY() function

`SETCONTAINSANY()` tests membership of a set of values within a set. It returns true if any of the members of `testset` exist in `targetset`

## Syntax

```
setcontainsany(targetset, testset)
```

## Arguments

| Argument | Description | Data type | Return value |
|---|---|---|---|
| `targetset` | The set in which the members of testset are being tested for membership. | `stringset` or `idset` |
| `testset` | The set of values to test membership for in the targetset. | Match `targetset` |

## Returns

| Data type | Value |
|---|---|
| `bool` | True if any member of `testset` exists within `targetset`

## Examples

{% include /sql-guide/create-table-segments.md %}

### Testing set membership in the select list

This query returns `true`

```sql
select setcontainsany(segment, ['BLUE', 'RED']) as HasBlueOrRed  
    from segments;
```

### Testing set membership as a where clause filter

This query returns `true`.

```sql
select _id, segment from segments where setcontainsany(segment, ['BLUE', 'RED']);
```
