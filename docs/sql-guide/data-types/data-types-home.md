---
title: Data types & constraints
layout: default
parent: SQL guide
has_children: true
nav_order: 3
has_toc: false
---

# Data types and constraints
{: .no_toc }

Data types and constraints are used to define table columns when creating tables via SQL.

![expr](/assets/images/sql-guide/type_name.svg)

{% include page-toc.md %}

## Before you begin

{% include /sql-guide/sql-guide-before-begin.md %}
* [Learn about data cardinality](/docs/cloud/cloud-faq/cloud-faq-data-cardinality)

## Mapping data types for INSERT and BULK INSERT statements

| General data type | FeatureBase SQL data type | Internal data type |
|---|---|---|
| boolean | [BOOL](/docs/sql-guide/data-types/data-type-bool) | bool |
| integer | [INT](/docs/sql-guide/data-types/data-type-int) | int |
| decimal | [DECIMAL](/docs/sql-guide/data-types/data-type-decimal) | decimal |
| unsigned integer | [ID](/docs/sql-guide/data-types/data-type-id) | mutex |
| low-cardinality unsigned integer | * [IDSET and IDSETQ](/docs/sql-guide/data-types/data-type-set-setq) | set |
| string | [STRING](/docs/sql-guide/data-types/data-type-string) | keyed mutex |
| low-cardinality string | * [STRINGSET and STRINGSETQ](/docs/sql-guide/data-types/data-type-set-setq) | keyed set |
| timestamp | [TIMESTAMP](/docs/sql-guide/data-types/data-type-timestamp) | timestamp |
| varchar | [VARCHAR](/docs/sql-guide/data-types/data-type-varchar) |  |
| vector | [vector](/docs/sql-guide/data-types/data-type-vector) | vector |

## Date/Time data types

{% include /sql-guide/data-type-timestamp-summary.md %}

* [TIMESTAMP](/docs/sql-guide/data-types/data-type-timestamp)

## Numeric data types

| User data | Data type |
|---|---|
| Boolean, yes/no | [BOOL](/docs/sql-guide/data-types/data-type-bool) |
| Floating point | [DECIMAL](/docs/sql-guide/data-types/data-type-decimal) |
| Unsigned integer | [ID](/docs/sql-guide/data-types/data-type-id) |
| Comma-separated unsigned integers | [SET and SETQ](/docs/sql-guide/data-types/data-type-set-setq)
| Signed integer | [INT](/docs/sql-guide/data-types/data-type-int) |
| Floating point array | [VECTOR](/docs/sql-guide/data-types/data-type-vector) |

## String data types

| User data | Data type |
|---|---|
| Sequence of characters up to 256mb | [STRING](/docs/sql-guide/data-types/data-type-string) |
| Comma-separated array of string values | [SET and SETQ](/docs/sql-guide/data-types/data-type-set-setq)
| Fixed-length sequence of characters | [VARCHAR](/docs/sql-guide/data-types/data-type-varchar) |

## Low-cardinality data types

{% include /sql-guide/datatype-set-setq-summary.md %}

* [SET and SETQ](/docs/sql-guide/data-types/data-type-set-setq)

## Constraints

{% include /sql-guide/summary-constraints-datatypes.md %}

## Examples

### Create Table statement with all data types

{% include /sql-guide/table-create-types-all-eg.md %}

## Further information

* [Create a Cloud table using SQL](/docs/sql-guide/statements/statement-table-create)
* [Create a Cloud table using the Cloud UI](/docs/cloud/cloud-tables/cloud-table-create)
* [Create a Cloud table using the API](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/createTable)
