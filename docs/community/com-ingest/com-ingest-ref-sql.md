---
title: SQL ingester reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 5
---

The SQL ingester tool selects data from a MSSQL, MySQL or Postgres database table using a SQL endpoint.

Once your SQL file(s) are constructed, they can be ingested by FeatureBase using the `molecula-ingest-csv` ingester.

Source column names are used to specify column names for each record.

## Syntax

```shell
molecula-consumer-sql \

```

## Arguments



## Additional information


<!-- {% include /community/com-ingest-flag-sql-connect-string.md%} -->


## Examples

{% include /community/com-ingest-flag-sql-server.md %}


---
title: SQL ingester reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 4
---

# SQL ingest tool reference
{: .no_toc}


[identify the data to copy] they can be ingested by FeatureBase using the `molecula-ingest-sql` ingester.

{% include page-toc.md %}

## Before you begin

* [Learn how to manage ingestion](/docs/community/com-ingest/com-ingest-manage)
* [Prepare the SQL ](/docs/community/com-ingest/com-datafile-ref-csv)

## Syntax

```
molecula-consumer-sql       \
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

{% include community/com-ingest-flag-sql.md %}

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
