---
title: INSERT
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 12
---

# INSERT statement

`INSERT` or `REPLACE` multiple rows of data into existing columns in a FeatureBase table.

## BNF diagrams

![expr](/assets/images/sql-guide/insert_stmt.svg)

### column_list
![expr](/assets/images/sql-guide/column_list.svg)

{% include /tips/tip-show-table-for-structure.md %}

### value_list
![expr](/assets/images/sql-guide/value_list.svg)

## Syntax

```sql
INSERT INTO
  <table_name> [(<column_list>)]
  VALUES
      {(<value_list>),...};
```

## Arguments

| Argument | Description | Required? | Additional information |
|---|---|---|---|
|`<table-name>` | Target table name | Yes |  |
| `<column_list>` | List of columns which must include the `_id` column | Optional | When omitted, FeatureBase assumes `<value-list>` will be inserted into existing `<column-list>` |
| `<value-list>` | The list of constants and/or functions joined by operators, or a subquery to be inserted into the column. | Yes | [Value list additional](#value-list-additional) |

## Additional information

### Limitations

The `INSERT` statement has the following limitations:
* `<value-list>` must match `<column-list>`
* Rows with duplicate `_id` are overwritten
* NULL values in duplicate `_id` rows are ignored

### Value assignment

| Data type | Assignment | Additional information |
|---|---|---|
| All | `NULL` (case insensitive)<br/>`''`(String) | Cannot be assigned for `SETQ` value list |
| String | `'<value>'` | Empty string can also be represented as `NULL` |
{% include /sql-guide/set-setq-value-def.md %}
{% include /sql-guide/vector-value-def.md %}

{% include /sql-guide/set-setq-csv-datasource-ref.md %}

{% include /sql-guide/vector-csv-definition.md %}

## UPDATE/REPLACE behavior

{% include /sql-guide/update_behavior.md %}

## Examples

{% include /sql-guide/sql-eg-insert-statements.md %}

<!-- the following headings and sql commented out because most of them are in the insert statements include, above

### CREATE TABLE with string data types

{% include /sql-guide/table-create-prod-sale-string-eg.md %}

### INSERT multiple records INTO `products` and `services` tables

{% include /sql-guide/insert-into-products-table-eg.md %}

{% include /sql-guide/insert-into-services-table-eg.md %}

### INSERT value in services table

```sql
INSERT INTO services (_id, servicelist, price)
VALUES (1, 'free deliveries on orders over $50', 0.00);
```

### Overwrite existing value

```sql
INSERT INTO services (_id, servicelist, price)
VALUES (2, 'local postage per item', 2.20);
```

### CREATE TABLE with TIMEQUANTUM constraints

{% include /sql-guide/table-create-timequantum-eg.md %}

### INSERT for time quantum data types

The following statement inserts values with an associated timestamp (using either a unix time or timestamp) into `timeq`,  which has `IDSETQ` and `STRINGSETQ` data types.

{: .important}
Curly brackets in the following example are mandatory and do not represent syntax grammar.

```sql
INSERT INTO timeq(_id, stringsetcolq, idsetcolq)
VALUES (1, {'2018-08-31T00:00:00Z', ['A','B']}, {1676649734, [1]});
```

### CREATE TABLE with `STRINGSET` data types

{% include /sql-guide/table-create-stringset-datatype-eg.md %}

### INSERT data to `STRINGSET`

```sql
INSERT
  into myspecies (_id, species)
  values
    ('yes', ['Manatee', 'Sea Horse', 'Koala']),
    ('no', ['Starfish']);
```

### INSERT data to vector table

* [INSERT INTO VECTOR data type column](/docs/sql-guide/examples/sql-eg-insert/sql-eg-insert-cosvec-target)
-->
## Further information

* [IDSETQ data type](/docs/sql-guide/data-types/data-type-set-setq)
* [STRINGSETQ data type](/docs/sql-guide/data-types/data-type-set-setq)
