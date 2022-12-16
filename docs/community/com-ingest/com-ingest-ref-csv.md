---
title: CSV ingester reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 2
---

# CSV ingest tool reference
{: .no_toc}


Once your CSV file(s) are constructed, they can be ingested by FeatureBase using the `molecula-ingest-csv` ingester.

{% include page-toc.md %}

## Before you begin

* [Learn how to manage CSV ingestion](/docs/community/com-ingest/com-ingest-manage)
* [Prepare the CSV file](/docs/community/com-ingest/com-datafile-ref-csv)

## Syntax

```
molecula-consumer-csv       \
  --source-and-target-flags \
  --csv-flags               \
  --id-flags                \
  --batch-flags             \
  --error-flags             \
  --log-stat-flags          \
  --testing-flags           \
  --auth-flags              \
```

{% include community/com-ingest-flag-common.md %}

{% include community/com-ingest-flag-csv.md %}

{% include community/com-ingest-flag-common-id.md %}

{% include community/com-ingest-flag-common-batch.md %}

{% include community/com-ingest-flag-common-error.md %}

{% include community/com-ingest-flag-common-log-stat.md %}

{% include community/com-ingest-flag-common-testing.md %}

{% include community/com-ingest-flag-csv-sql-auth.md %}

## Additional information

{: note}
List all the flags by entering `idk/molecula-consumer-csv` from the `/featurebase` directory.

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

{% include /community/com-ingest-csv-header-datafile.md %}

{% include /community/com-ingest-csv-header-flag.md %}

{% include /community/com-ingest-csv-header-flag-tls.md %}

## Further information

* [Example CSV files and ingest tool flags](/docs/community/com-ingest/com-ingest-example-csv)
