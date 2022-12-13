---
title: CSV datafile reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 2
---

This reference page provides information on how to structure a CSV file with data so it can be [imported to FeatureBase Community using the command line CSV ingest tool](/docs/community/com-ingest/com-ingest-ref-csv).

## Before you begin

* [Learn how to manage ingestion](/docs/community/com-ingest/com-csv-ingest-manage)
* Learn about [RFC-4180 standard for CSV files](https://datatracker.ietf.org/doc/html/rfc4180#section-2) which is required for CSV ingestion.

## Syntax

```csv
{column-name[__<data-type>],...<column-name>[__<data-type>]}
{field-value,...field-value}
```

## Arguments

| Argument | Description |
|---|---|
| column-name | Destination column name |
| data type | data type can be defined in the CSV file or using command line arguments with the CSV ingest tool. |

## Additional information

* Use double quotes `"..."` to enclose fields containing:
  * Line breaks (CRLF)
  * Commas
  * double quotes

## Examples

### CSV with defined column names and data types

```csv
test_id__ID, test_bool__BOOL, test_STRING__STRING, test_TIMESTAMP__timestamp
1, 0, escaped text in ""quotation marks"", 2022-01-01
2, 1, "string with, comma", 2022-01-02
3, "", test, 1900-01-01
```

### CSV file with no defined data types

Use this method if the target table already exists, or when defining data types with the CSV ingest tool.

```csv
test_id, test_bool, test_STRING, test_TIMESTAMP
1, 0, escaped text in ""quotation marks"", 2022-01-01
2, 1, "string with, comma", 2022-01-02
3, "", test, 1900-01-01
```

## Further information

* [Command line CSV ingester reference](/docs/community/com-ingest/com-ingest-ref-csv)
