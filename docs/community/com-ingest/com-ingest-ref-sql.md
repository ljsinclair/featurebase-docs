---
title: SQL ingester reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 4
---

# SQL ingest tool reference
{: .no_toc}

The SQL ingester tool selects data from a MSSQL, MySQL or Postgres database table using a SQL endpoint.

Once your SQL file(s) are constructed, they can be ingested by FeatureBase using the `molecula-ingest-csv` ingester.

Source column names are used to specify column names for each record.

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

<!-- Enable once com-ingest-csv PR is merged

{% include community/com-ingest-flag-common.md %}

{% include community/com-ingest-flag-sql.md %}

{% include community/com-ingest-flag-common-id.md %}

{% include community/com-ingest-flag-common-batch.md %}

{% include community/com-ingest-flag-common-error.md %}

{% include community/com-ingest-flag-common-log-stat.md %}

{% include community/com-ingest-flag-common-testing.md %}

{% include community/com-ingest-flag-csv-sql-auth.md %}

-->

## Additional information

{: note}
List all the flags by entering `idk/molecula-consumer-sql` from the `/featurebase` directory.

## Additional information

<!-- Enable once com-ingest-csv is merged and deployed

 {% include /community/com-ingest-flag-sql-connect-string.md%}

{% include /community/com-ingest-missing-value-processing.md %}
-->

## Examples

{% include /community/com-ingest-flag-sql-server.md %}

## Examples

{% include /community/com-ingest-csv-header-datafile.md %}

{% include /community/com-ingest-csv-header-flag.md %}

{% include /community/com-ingest-csv-header-flag-tls.md %}

## Further information

* [Example SQL and ingest tool flags](/docs/community/com-ingest/com-ingest-example-sql)
