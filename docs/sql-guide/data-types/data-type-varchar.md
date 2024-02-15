---
title: VARCHAR
layout: default
parent: Data types & constraints
grand_parent: SQL guide
nav_order: 11
---

# VARCHAR data type

`VARCHAR()` is a length constrained string data type.

## Syntax

```sql
VARCHAR({<length> | max})
```

## Arguments

| Argument | Description |
|---|---|
| `<length>` | integer value representing the number of characters allowed in the string |
{% include /sql-guide/max-val-string-varchar.md %}




## Additional information

* The `Data overflow` error is generated if a VARCHAR value excedes the `<length>` constraint

## Examples

### CREATE TABLE with VARCHAR

```sql
CREATE TABLE doctest (_id ID, limited VARCHAR(21), unlimited VARCHAR(max));

INSERT INTO doctest (_id, limited, unlimited)
VALUES (1, 'A 21 character string', 'Varchar max does not limit the number of characters allowed.');
```

```sql
INSERT INTO doctest (_id, limited)
VALUES (2, 'This string will cause a data overflow');
```
