---
title: Part 2 - Prepare CSV
layout: default
parent: Import data using CSV
grand_parent: Community
nav_order: 2
---

The CSV file must be constructed in a specific manner to successfully import your records to FeatureBase Community.

## Before you begin

* [Learn how to manage CSV ingestion](/docs/community/com-csv-ingest/com-csv-ingest-manage)
* [part 1 - data modeling](/docs/community/com-csv-ingest/com-csv-ingest-step1)
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
| data type | Column data type is optional but must be defined before data is ingested. |

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

```csv
test_id, test_bool, test_STRING, test_TIMESTAMP
1, 0, escaped text in ""quotation marks"", 2022-01-01
2, 1, "string with, comma", 2022-01-02
3, "", test, 1900-01-01
```
