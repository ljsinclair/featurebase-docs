---
title: REPLACEALL
layout: default
parent: Functions
grand_parent: SQL guide
nav_order: 2
---

# REPLACEALL() function

The `ReplaceAll()` function replaces all occurrences of the expression `exprOld` in the evaluated expression `expr` with a new expression `exprNew`.

## Syntax

```
replaceall(expr,exprOld,exprNew)
```

## Arguments

| Arguments | Description | Data type |
|---|---|---|
| `expr` | The evaluated expression in which all occurrences of `exprOld` should be replaced with `exprNew`. | `string` |
| `exprOld` | The substring that should be replaced. | `string` |
| `exprNew` | The substring that should be used as a replacement for `exprOld`. | `string` |

## Return Type

`string`

## Return Value

`replaceall()` returns a string that is the result of replacing all occurrences of `exprOld` in `expr` with `exprNew`.

## Remarks

None

## Examples

### Replace string

```sql
create table segments
    (_id id, segment string);

insert into segments(_id,segment)
    values (1,'hello world!')

select _id, segment ,replaceall(segment, 'world','universe') as replaced from segments;
+-----+--------------+-----------------+
| _id | segment      | replaced        |
+-----+--------------+-----------------+
|   1 | hello world! | hello universe! |
+-----+--------------+-----------------+
```

### Replace with reversed string

```sql
create table segments
    (_id id, segment string, rev string);

insert into segments(_id,segment)
    values (1,'tic tac', 'cot')

select _id, segment, replaceall(segment, 'tac', reverse(rev)) as replaced from segments;
+-----+--------------+-----------------+
| _id | segment      | replaced        |
+-----+--------------+-----------------+
|   1 | tic tac      | tic toc         |
+-----+--------------+-----------------+
```
