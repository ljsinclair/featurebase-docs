---
title: STR()
layout: default
parent: SQL functions
grand_parent: SQL guide
---

# STR() function

`STR()` function returns the given number formatted to a String of a certain length, with given precision.

## Syntax

```
STR(num_expr, lenofstr, precision)
```

## Arguments


| Argument | Description | Data type | Return value |
|---|---|---|---|
| `num_expr` | Required `int` or `float` value to format as a `string`. |
| `lenofstr` | Optional `int` value for the length of the output string. Defaults to 10. |
| `precision` | Optional `int` value for the precision to round `num_expr` to. Defaults to 0. |


## Returns

| Data type | Value |
|---|---|
| `string` | Returns a string representation of `num_expr` rounded to the `precision` and space-padded to the `length`. |

## Remarks
If the number cannot be shown within the allocated length, it will be replaced by asterisks.

## Examples
A. Str function on a column.

```sql
create table segments
    (_id id, segment decimal(3));

insert into segments(_id, segment)
    values (1, 7.543)

select _id, str(segment) as text from segments;
+-----+------------+
| _id | text       |
+-----+------------+
|   1 |          8 |
+-----+------------+
```

B. Str function with precision on a column.

```sql
create table segments
    (_id id, segment decimal(3));

insert into segments(_id, segment)
    values (1, 7.543)

select _id, str(segment, 10, 2) as text from segments;
+-----+------------+
| _id | text       |
+-----+------------+
|   1 |       7.54 |
+-----+------------+
```

C. Str function with a long number

```sql
create table segments
    (_id id, segment decimal(3));

insert into segments(_id, segment)
    values (1, 987654.321)

select _id, str(segment, 7, 2) as text from segments;
+-----+---------+
| _id | text    |
+-----+---------+
|   1 | ******* |
+-----+---------+
```

