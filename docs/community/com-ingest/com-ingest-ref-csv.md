---
title: CSV ingester reference
layout: default
parent: Import data using CSV
grand_parent: Community
nav_order: 3
---

Once your CSV file(s) are constructed, they can be ingested by FeatureBase using the `molecula-ingest-csv` ingester.

## Before you begin

* [Learn how to manage CSV ingestion](/docs/community/com-ingest/com-ingest-manage)
* [Prepare the CSV file](/docs/community/com-ingest/com-datafile-ref-csv)

## Syntax

```
molecula-consumer-csv \
--flag...
 --flag \
--index=table-name
--files=data-file.csv,...
```

## Arguments

| Argument | Description | Further information |
|---|---|---|
| --flag | ingest flags | [molecula-consumer-csv flags](#flags) |
| table-name | alphanumeric table name, must be lower-case and start with a letter. Underscores and hyphens are permitted. |
| files | One ore more defined data files may be processed at a time |

## Additional information

| Flag | Type | Description |
|---|---|---|
| --auto-generate | |
| --batch-size |  |
| --files | strings | List of one or more source files, URLs or directories to ingest |
| --header | strings | Define the destination table column names and data types where they are not defined in the CSV file |
| --ignore-header | bool | Ignore the header row in source file when defining one using `--header` or where destination table already exists. **CHECKME!** |
| --index | Alphanumeric destination table name with columns and data types defined by the CSV header row or using `--header` |
| --just-do-it | bool | Force incorrectly configured headers to lower case and record values processed as String/Set data types |
| --pilosa-hosts | URL of running FeatureBase server in form `https://localhost:10101` |
| --tls.certificate | tls certificate name (e.g., `featurebase.local.crt`) |
| --tls.key | tls local key (e.g., `featurebase.local.key`) |
| --tls.skip-verify | Optional flag to skip TLS verificatio |


## Additional information

* Enter `molecula-ingest-csv -h` at the command line for a full list of flags.
* --header definition is identical to that of the CSV file: `<column-name>[__<data-type>],...<column-name>[__<data-type>]`

### Missing value processing

Missing and empty string values are handled the same.

| Field data type | Expected behaviour |
|---|---|
|`"ID"`| Raise error during ingestion if `"ID"` is selected for primary-key-field. Otherwise, behave same as `"String"`. |
|`"DateInt"`| Raise error during ingestion - timestamp must have a valid value.|
|`"Timestamp"`| Raise error during ingestion - input is not time. |
|`"RecordTime"`| Do not update value in index. |
|`"Int"` | Do not update value in index. |
|`"Decimal"`| Do not update value in index. |
|`"String"`| Do not update value in index. |
|`"Bool"`| Do not update value in index. |
|`"StringArray"`| Do not update value in index. |
|`"IDArray"`| Do not update value in index. |
|`"ForeignKey"` | Do not update value in index. |

## Examples

### Ingest data file with defined column names and data types

```
molecula-ingest-csv data-file.csv --ignore-header
```

### Define header row on command line.

Use this method if the CSV file does not define column data types.

```
molecula-consumer-csv \
    --batch-size=10000 \
    --auto-generate \
    --header=asset_tag__String,fan_time__RecordTime_2006-01-02,fan_val__String_F_YMD \
    --ignore-header
    --index=csv-ingest-test \
    --files=sample.csv,sample2.csv \
```

### Ingest over tls

```shell
molecula-consumer-csv \
    --pilosa-hosts=https://localhost:10101
    --tls.certificate=featurebase.local.crt \
    --tls.key=featurebase.local.key \
    --tls.skip-verify \
    --batch-size=10000 \
    --auto-generate \
    --index=csv-ingest-test \
    --files=sample.csv \
```
