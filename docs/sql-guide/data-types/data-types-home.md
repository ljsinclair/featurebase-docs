---
title: Data types & constraints
layout: default
parent: SQL guide
has_children: true
nav_order: 2
has_toc: false
---

# Data types and constraints
{: .no_toc }

Data types and constraints are used to define table columns when creating tables via SQL.

{% include page-toc.md %}

## Before you begin

* Create a database in two ways:
  1. [Create a Cloud database using the UI](/docs/cloud/cloud-databases/cloud-db-create)
  2. [Create a Cloud database using the API](https://api-docs-featurebase-cloud.redoc.ly/v2#operation/createDatabase)
* Create a table in three ways:
  1. [Create table using the UI](/docs/cloud/cloud-tables/cloud-table-create)
  2. [Create table using SQL](/docs/sql-guide/statements/statement-table-create)
  3. [Create table using the API](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/createTable)

## Data types

Data types used to define the type of data that a table column can contain. They are modified by Constraints.

### Mapping data types

{% include /sql-guide/datatype-mapping.md %}

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

{% include /sql-guide/summary-constraints-datatypes.md %}

## Further information

* [Create a Cloud table](/docs/cloud/cloud-tables/cloud-table-create)
* [Create a Cloud table with SQL](/docs/sql-guide/statements/statement-create-table)
* [Create a Cloud table using the API](https://api-docs-featurebase-cloud.redoc.ly/v2#operation/createTable)
