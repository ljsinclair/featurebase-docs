---
title: Data types & constraints
layout: default
parent: SQL guide
has_children: true
nav_order: 3
has_toc: false
---

# Data types and constraints

Data types and constraints are used to define table columns when creating tables via SQL.

{: .note}
For ease of use, Constraint information is included with the relevant Data type reference.

{% include page-toc.md %}

## Before you begin

* [Create a Cloud database using the UI](/docs/cloud/cloud-databases/cloud-db-create), OR
* [Create a Cloud database using the API](https://api-docs-featurebase-cloud.redoc.ly/v2#operation/createDatabase)

## Data types

Data types used to define the type of data that a table column can contain. They are modified by Constraints.

### Mapping data types

| SQL Data Type | FeatureBase Data Type |
|---------------|---|
| int | int |
| bool | bool |
| timestamp | timestamp |
| decimal | decimal |
| string | keyed mutex |
| stringset | keyed set |
| id | mutex |
| idset | set |

### Numeric data types

* [BOOL](/docs/sql-guide/data-types/data-type-bool)
* [DECIMAL](/docs/sql-guide/data-types/data-type-decimal)
* [ID](/docs/sql-guide/data-types/data-type-id)
* [INT](/docs/sql-guide/data-types/data-type-int)

### String data types

* [STRING](/docs/sql-guide/data-types/data-type-string)

### Date/Time data types

* [TIMESTAMP](/docs/sql-guide/data-types/data-type-timestamp)

### FeatureBase data types

* [IDSET](/docs/sql-guide/data-types/data-type-idset)
* [STRINGSET](/docs/sql-guide/data-types/data-type-stringset)

## Constraints

Constraints are applied to data types to modify and optimize how table data is stored and accessed.

Constraints are applied when a column is created.

| Constraint | Data type |
|---|---|
| EPOCH | [TIMESTAMP](/docs/sql-guide/data-types/data-type-timestamp)
| MIN, MAX | [INT](/docs/sql-guide/data-types/data-type-int) |
| SCALE | [DECIMAL](/docs/sql-guide/data-types/data-type-decimal) |
| TIMEQUANTUM, TTL | [IDSET](/docs/sql-guide/data-types/data-type-idset)<br/> [STRINGSET](/docs/sql-guide/data-types/data-type-stringset) |
| TIMEUNIT | [TIMESTAMP](/docs/sql-guide/data-types/data-type-timestamp) |

## Further information

* [Create a Cloud table](/docs/cloud/cloud-tables/cloud-table-create)
* [Create a Cloud table using the API](https://api-docs-featurebase-cloud.redoc.ly/v2#operation/createTable)
