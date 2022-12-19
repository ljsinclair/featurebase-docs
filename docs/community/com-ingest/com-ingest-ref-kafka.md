---
title: Kafka ingester reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 8
---

# Kafka ingest tool reference
{: .no_toc}

Ingest Apache Kafka <files, data, etc> using the `molecula-ingest-kafka` ingest tool.

{% include page-toc.md %}

## Before you begin

* [Learn how to manage ingestion](/docs/community/com-ingest/com-ingest-manage)
* [Prepare the Kafka file](/docs/community/com-ingest/com-datafile-ref-kafka)

## Syntax

```
molecula-consumer-csv       \
  --source-and-target-flags \
  --kafka-flags               \
  --id-flags                \
  --batch-flags             \
  --error-flags             \
  --log-stat-flags          \
  --testing-flags           \
  --kafka-auth-flags              \
```

---CSV CONTENT BELOW DELETE WHEN READY---
{% include community/com-ingest-flag-common.md %}

{% include community/com-ingest-flag-kafka.md %}

{% include community/com-ingest-flag-common-id.md %}

{% include community/com-ingest-flag-common-batch.md %}

{% include community/com-ingest-flag-common-error.md %}

{% include community/com-ingest-flag-common-log-stat.md %}

{% include community/com-ingest-flag-common-testing.md %}

{% include community/com-ingest-flag-kafka-auth.md %}

## Additional information

{: note}
List all the flags by entering `idk/molecula-consumer-csv` from the `/featurebase` directory.

{% include /community/com-ingest-missing-value-processing.md %}

## Examples

{% include /community/com-ingest-csv-header-datafile.md %}

{% include /community/com-ingest-csv-header-flag.md %}

{% include /community/com-ingest-csv-header-flag-tls.md %}

## Further information

* [Example CSV files and ingest tool flags](/docs/community/com-ingest/com-ingest-example-csv)
