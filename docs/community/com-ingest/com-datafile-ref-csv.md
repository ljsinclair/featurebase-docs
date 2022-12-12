---
title: CSV ingest reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 2
---

This reference file provides information required to create a CSV file to import data to FeatureBase Community.

## Before you begin

* [Learn how to manage ingestion](/docs/community/com-ingest/com-csv-ingest-manage)
* Learn about [RFC-4180 standard for CSV files](https://datatracker.ietf.org/doc/html/rfc4180#section-2) which is required for CSV ingestion.

## Syntax

```csv
<column-name>[__<data-type>],...<column-name>[__<data-type>]
field-value,...field-value
```

## Arguments

| Argument | Description |
|---|---|
| column-name | Destination table column name |
| data type | Column data type is required but can be defined in a CSV data file or in command-line settings when setting up the CSV ingester. |

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

This approach can be used when defining data types at the command line, or if the destination table already exists.

```csv
test_id, test_bool, test_STRING, test_TIMESTAMP
1, 0, escaped text in ""quotation marks"", 2022-01-01
2, 1, "string with, comma", 2022-01-02
3, "", test, 1900-01-01
```
