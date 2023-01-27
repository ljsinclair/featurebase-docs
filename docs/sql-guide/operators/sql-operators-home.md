---
title: Operators
layout: default
parent: operators
grand_parent: SQL guide
nav_order: 1
---

# SQL Operators

SQL Operators are used in SELECT statements to perform mathematical and logical operations on operands.

## Before you begin

{% include /cloud/cloud-db-create-before-begin.md %}


## unary_op
![expr](/assets/images/sql-guide/unary_op.svg)

| Operator | Description | Examples | Binary | Result |
|---|---|---|---|---|
| `!` | **Not** inverts all the bits of the operand. | `SELECT !5;` | `101` | `010` |
| `+` and `-` | Change the leading **sign** bit for the operand. | `SELECT -1` | `10001` | `00001` |

## binary_op
![expr](/assets/images/sql-guide/binary_op.svg)

### Logical

| Operator | SELECT query returns **true** when... | Examples |
|---|---|---|
| `AND` | **Both** conditions match the operand. | `SELECT 1 WHERE 1=1 AND 0=0;` |
| `OR` | **Either** condition matches the operand |  `SELECT 1 WHERE 1=1 OR 0=1;` |
| `=` | **Both** sides of the equation are equal. | `SELECT 1 WHERE 1=1` |
| `!=` | **Both** sides of the equation are **not** equal. | `SELECT 1 WHERE 1!=0;` |

### Comparison

| Operator | Select statement returns **True** when... | Examples |
|---|---|---|
| `<` | the operand on the left is **less than** the operand on the right. | `SELECT 1 WHERE 10 < 100;` |
| `>` | the operand on the left is **greater than** the operand on the right. | `SELECT 1 WHERE 10 > 1;` |
| ``<=` | the operand on the left is **less than  or equal to** the operand on the right. | `SELECT 1 WHERE 10 >= 10;` |
| `>=` | the operand on the left is **greater than or equal to** the operand on the right. | `SELECT 1 WHERE 10 <= 11;` |

### Arithmetic

| Operator | Description | Examples |
|---|---|---|
| `+` | Add two operands. | `SELECT 1+1;` |
| `-` | Subtract two operands. | `SELECT 1-1` |
| `*` | Multiply two operands. | `SELECT 12*11` |
| `/` | Divide two operands. | `SELECT 120/12;` |
| `%` | Modulo divides two operands then returns the remainder or signed remainder. | `SELECT 5%3;` |

### Bitwise

| Operator | Description | Example | Binary | Result |
|---|---|---|---|---|
| `&` | **And** sets each bit to 1 where both bits are 1 | `SELECT 5 & 1` | `0101 & 0001` | `0001` |
| `|` | **Or** sets each bit to 1 if one of two bits = 1 | `SELECT 5 | 1` | `0101 | 0001` | `0101` |
| `<<` | The second operand determines the number of zeroes to **insert** to the right which then **shifts left** the value of the first operand. | `SELECT 5 << 1;` | `0101 << 1` | `1010` |
| `>>` | The second operand determines the number of zeroes to **remove** from the right which then **shifts right** the value of the first operand. | `SELECT 5 >> 1;` | `0101 >> 1` | `0010` |

### String

| Operator | Description | Example | Result |
|---|---|---|---|
| `||` | Concatenate two strings into a single string. | `SELECT 'CON' || 'CAT';` | `CONCAT` |
