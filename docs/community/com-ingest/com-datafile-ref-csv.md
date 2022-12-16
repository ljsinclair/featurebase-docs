---
title: CSV datafile reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 1
---

# CSV datafile reference
{: .no_toc}

This reference page provides information on how to structure a CSV file with data so it can be [imported to FeatureBase Community using the command line CSV ingest tool](/docs/community/com-ingest/com-ingest-ref-csv).

{% include page-toc.md %}

## Before you begin

* [Learn how to manage data import](/docs/community/com-ingest/com-ingest-manage)
* Learn about [RFC-4180 standard for CSV files](https://datatracker.ietf.org/doc/html/rfc4180#section-2) which is required for CSV ingestion.

## Syntax

```
{source_column_name}[__data_type[_constraint-value...]],...
{record,...}
```

## Arguments

| Argument | Description | Required |
|---|---|---|
| source_column_name | Source column name to translate to FeatureBase index | Yes |
| data_type | Target data type. | Can be omitted if defined with ingest tool `--header` flag. |
| constraint_value | Available target data type constraint | Can be omitted if defined with ingest tool `--header` flag |
| record | record data to be translated to FeatureBase | Yes |

## Additional information

* Use double quotes `"..."` to enclose fields containing:
  * Line breaks (CRLF)
  * Commas
  * double quotes

## Examples

{% include /community/com-datafile-csv-header-defined.md %}

{% include /community/com-datafile-csv-header-undefined.md %}

## Next step

* [CSV ingest tool reference](/docs/community/com-ingest/com-ingest-ref-csv)
