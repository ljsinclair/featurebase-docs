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

{% include /cloud/cloud-db-create-before-begin.md %}

## Data types

Data types used to define the type of data that a table column can contain. They are modified by Constraints.

![expr](/assets/images/sql-guide/type_name.svg)

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

## CREATE TABLE with all data types

This example SQL demonstrates all data types and selected constraints.

{% include /sql-guide/table_create_eg_all_datatypes.md %}

## Further information

* [Create a Cloud table](/docs/cloud/cloud-tables/cloud-table-create)
* [Create a Cloud table with SQL](/docs/sql-guide/statements/statement-table-create)
* [Create a Cloud table using the API](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/createTable)
