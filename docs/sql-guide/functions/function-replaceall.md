---
title: REPLACEALL()
layout: default
parent: functions
grand_parent: SQL guide
nav_order: 3
---

# REPLACEALL() string function

`ReplaceAll()` replaces all occurrences of the expression `exprOld` in the evaluated expression `expr` with a new expression `exprNew`.

## Syntax

```
replaceall(expr,exprOld,exprNew)
```

## Arguments

| Argument | Description | Data type | Return value |
|---|---|---|---|
| `expr` | String expression to evaluate |
| `exprOld` | String expression to replace |
| `exprNew` | String expression that replaces `exprOld` |

## Returns

| Data type | Value |
|---|---|
| `string` | String with `exprOld` replaced by `exprNew` |

## Examples

### Replace `hello world` string

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
### Nested REPLACE() and REVERSE() functions

Replace `exprOld` with reversed `exprNew`

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

## Further information

* [REVERSE()](/sql-guide/functions/function-reverse)
