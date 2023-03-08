---
title: CHARINDEX()
layout: default
parent: SQL functions
grand_parent: SQL guide
---

# CHARINDEX() function

The `Charindex()` function supplies an integer value that represents the start of a substring within a string value

## Syntax

```
charindex(substring,expr,[position])
```

## Arguments

| Argument | Data type | Description | Required? | Further information |
|---|---|---|---|---|
| `substring` | string | Character or string to be identified in the input string | Yes |  |
| `expr` | string | Input string to search for `substring` | Yes |  [SQL expressions](/docs/sql-guide/expressions/expressions-home) |
| `position` | int | Position in `expr` to begin search for `substring`. | Optional | Defaults to `0` |

## Returns

| Data type | Value |
|---|---|
| `int` | Position of `substring` in the `expr` input string. |

## Examples

### CREATE TABLE and INSERT data statements

```sql
create table customers
    (_id id, segment string);

insert into customers(_id,segment)
    values (1,'this is great')
```

### CHARINDEX statement

```sql
select _id, charindex('is',segment) as charindex from customers;
```

Results:

| _id | charindex |
|---|---|
| 1 | 2 |

### CHARINDEX with starting from POSITION

```sql
select _id, charindex('is',segment,3) as charindex from customers;
```

RESULTS

| _id | charindex|
|---|---|
| 1 | 5 |
