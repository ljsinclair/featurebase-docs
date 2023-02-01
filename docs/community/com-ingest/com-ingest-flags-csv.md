---
title: CSV ingester flags
layout: default
parent: Import data
grand_parent: Community
nav_order: 2
---

# CSV ingest flags reference
{: .no_toc}

Once your CSV file(s) are constructed, they can be ingested by FeatureBase using the `molecula-consumer-csv` ingester.

{% include page-toc.md %}

## Before you begin

* [Learn how to manage ingestion](/docs/community/com-ingest/com-ingest-manage)
* [Prepare the CSV file](/docs/community/com-ingest/com-ingest-source-csv)

## Syntax

```
molecula-consumer-csv \
  <common-flags>      \
  <csv-flags>         \
  <id-flags>          \
  <error-flags>       \
  <log-stat-flags>    \
  <testing-flags>     \
  <auth-flags>        \
```

{% include /com-ingest/com-ingest-flag-common.md %}

{% include /com-ingest/com-ingest-flag-csv.md %}

{% include /com-ingest/com-ingest-flag-common-id.md %}

{% include /com-ingest/com-ingest-flag-common-error.md %}

{% include /com-ingest/com-ingest-flag-common-log-stat.md %}

{% include /com-ingest/com-ingest-flag-common-testing.md %}

{% include /com-ingest/com-ingest-flag-csv-sql-auth.md %}

{% include /com-ingest/com-ingest-flag-extra-auth.md %}

## Additional information

{: .note}
List all the flags by entering `idk/molecula-consumer-csv` from the `/featurebase` directory.

{% include /com-ingest/com-ingest-flag-extra-env-var.md %}

{% include /com-ingest/com-ingest-extra-missing-val.md %}

## Examples

{% include /com-ingest/com-ingest-csv-header-datafile.md %}

{% include /com-ingest/com-ingest-csv-header-flag-tls.md %}

## Further information

* [Example CSV files and ingest tool flags](/docs/community/com-ingest/com-ingest-example-csv)
