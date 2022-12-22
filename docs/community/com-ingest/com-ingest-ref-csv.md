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

* [Learn how to manage ingestion](/docs/community/com-ingest/com-ingest-manage)
* [Prepare the CSV file](/docs/community/com-ingest/com-datafile-ref-csv)

## Syntax

```
molecula-consumer-csv       \
  --common-flags \
  --csv-flags               \
  --id-flags                \
  --error-flags             \
  --log-stat-flags          \
  --testing-flags           \
  --auth-flags              \
```

{% include community/com-ingest-flag-common.md %}

{% include community/com-ingest-flag-csv.md %}

{% include community/com-ingest-flag-common-id.md %}

{% include community/com-ingest-flag-common-error.md %}

{% include community/com-ingest-flag-common-log-stat.md %}

{% include community/com-ingest-flag-common-testing.md %}

{% include community/com-ingest-flag-csv-sql-auth.md %}

## Additional information

{: note}
List all the flags by entering `idk/molecula-consumer-csv` from the `/featurebase` directory.

{% include /community/com-ingest-flag-extra-auth.md %}

{% include /community/com-ingest-flag-extra-env-var.md %}

{% include /community/com-ingest-extra-missing-val.md %}

## Examples

{% include /community/com-ingest-csv-header-datafile.md %}

{% include /community/com-ingest-csv-header-flag.md %}

{% include /community/com-ingest-csv-header-flag-tls.md %}

## Further information

* [Example CSV files and ingest tool flags](/docs/community/com-ingest/com-ingest-example-csv)
