---
title: TUPLE()
layout: default
parent: SQL functions
grand_parent: SQL guide
---

# TUPLE() function

The `TUPLE()` function takes in n arguments and returns a tuple containing an element for each argument.

## Syntax

```
TUPLE(expr1,expr2,...)
```

## Arguments

| Argument | Data type | Description | Required | Further information |
|---|---|---|---|---|
| expr | any | an expression to represent an element in the resultant tuple. Supports 1 to n arguments of any type. | Yes | |

## Returns

| Data type | Value |
|---|---|---|
| tuple | tuple with an element per evaluated expression `(eval_expr1,eval_expr2,...)` | 

## Additional information

### Time quantum data

This function is used in the `TRANSFORM` clause in order to load [IDSETQ](/docs/sql-guide/data-types/data-type-idsetq) and [STRINGSETQ](/docs/sql-guide/data-types/data-type-stringsetq) columns by returning a tuple containing a `TIMESTAMP` and an [IDSET](/docs/sql-guide/data-types/data-type-idset) or [STRINGSET](/docs/sql-guide/data-types/data-type-stringset)

## Examples

### Load time quantum data

```sql
create table if not exists tuple-demo (
    _id STRING,
    time_col TIMESTAMP,
    stringset_col STRINGSET,
    ideset_col IDSET,
    stringsetq_col STRINGSETQ timequantum 'YMD',
    idesetq_col IDSETQ timequantum 'Y' 
);

BULK INSERT INTO tuple-demo (
_id,
time_col,
stringset_col,
ideset_col,
stringsetq_col,
idesetq_col)
map (
0 STRING,
1 TIMESTAMP,
2 STRINGSET,
3 IDSET)
transform(
@0,
@1,
@2,
@3,
TUPLE(@1,@2),
TUPLE(@1,@3)
)
FROM x'
A,2013-07-15T01:18:46Z,stringset1, 1
B,2014-07-15T01:18:46Z,stringset2, 2
'
with
    BATCHSIZE 10000
    format 'CSV'
    input 'STREAM';

```

### return a tuple

```sql
select i_d, tuple(time_col, stringset_col, idset_col) as tup from tuple-demo


_id | tup
-----+---------------------------------------------
  A |        (2013-07-15T01:18:46Z,stringset1, 1)
  B |        (2014-07-15T01:18:46Z,stringset2, 2)
```