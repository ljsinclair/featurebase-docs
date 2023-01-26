---
title: Operators
layout: default
parent: operators
grand_parent: SQL guide
nav_order: 1
---

# SQL Operators



## Before you begin

{% include /cloud/cloud-db-create-before-begin.md %}


## unary_op
![expr](/assets/images/sql-guide/unary_op.svg)

### ! → Bit-wise NOT

This operator inverts all the bits of the operand passed

```sql
SELECT !5;
```

### +, - → plus and minus, change the sign of the operand

```sql
SELECT -1;
```

```sql
SELECT +1;
```

## binary_op
![expr](/assets/images/sql-guide/binary_op.svg)

### Logical

#### AND → logical AND displays a result if both conditions are TRUE

```sql
SELECT 1 WHERE 1=1 AND 0=0;
```

#### OR → logical OR displays a result if either conditions are TRUE

```sql
SELECT 1 WHERE 1=1 OR 0=1;
```

### Equality
#### = → Equal tests for equality and returns TRUE when equal

```sql
SELECT 1 WHERE 1=1;
```

#### != → Not Equal tests for inequality and returns TRUE when not equal

```sql
SELECT 1 WHERE 1!=0;
```

### Comparison
#### < → Less Than tests and returns TRUE when the operand on the left is less than the operand on the right

```sql
SELECT 1 WHERE 10 < 100;
```

#### > → Greater Than tests and returns TRUE when the operand on the left is greater than the operand on the right


```sql
SELECT 1 WHERE 10 > 1;
```

#### <= → Less Than or Equal To tests and returns TRUE when the operand on the left is less than  or equal to the operand on the right


```sql
SELECT 1 WHERE 10 >= 10;
```

#### >= → Greater Than or Equal To tests and returns TRUE when the operand on the left is greater than or equal to the operand on the right


```sql
SELECT 1 WHERE 10 <= 11;
```

### Arithmetic
#### + → Add two operands

```sql
SELECT 1+1;
```

#### - → Subtract two operands

```sql
SELECT 1-1;
```

#### * → Multiply two operands

```sql
SELECT 12*11;
```

#### / → Divide two operands

```sql
SELECT 120/12;
```

#### % → Modulo of two operands

```sql
SELECT 5%3;
```

### Bitwise
#### & → And sets each bit to 1 if both bits are 1

`0101 & 0001` ->  `0001`

```sql
SELECT 5 & 1;
```

#### | → Or sets each bit to 1 if one of two bits is 1

```sql
SELECT 5 | 1;
```

`0101 | 0001` -> `0101`

#### << → Shift Left shifts bits left by pushing n zeros in from the right based on the second operand

```sql
SELECT 5 << 1;
```

`0101 << 1` ->  `1010`

#### >> → Shift Right shfits bits right by pushing copies of the leftmost bit in from the left by n places based on the second operand

```sql
SELECT 5 >> 1;
```

`0101 >> 1` -> `0010`

### String
#### || → (string) concatenation

```sql 
SELECT 'CON' || 'CAT';
```