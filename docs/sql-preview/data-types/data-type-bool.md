---
title: BOOL          # page title for nav
layout: default
parent: Data types & Constraints         # L2 page title (requires has_children: true in L2 page)
grand_parent: SQL-preview   # L1 page title (requires has_children: true in L1 page)
nav_order: 3
---

## BOOL data type

## Syntax

```
BOOL
```

## Arguments

| Argument | Description |
|---|---|
| BOOL | The BOOL type stores simple Boolean (true/false) values and is used for simple query filtering. |

## Additional information

Use this table to determine how integer and string values are represented when added to a Boolean column.

| data | value | bool |
|---|---|---|
| integer | 0 | 0 |
| integer > 0 | 1 | 1 |
| string | empty, `0`, `f`, `false` | 0 |
| string | other string values | 1 |
