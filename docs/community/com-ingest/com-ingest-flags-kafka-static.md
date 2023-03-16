---
title: Kafka static ingest consumer
layout: default
parent: Import data
grand_parent: Community
nav_order: 8
---

# Kafka static ingest consumer reference
{: .no_toc}

{% include /com-ingest/com-ingest-kafka-summary.md %}

{% include page-toc.md %}

## Before you begin

* [Learn how to setup Kafka messages and JSON files ready for ingestion](/docs/community/com-ingest/com-ingest-source-kafka-static)
* [Start Apache Kafka services](https://kafka.apache.org/quickstart){:target="_blank"}

## Kafka CLI Syntax

```
molecula-consumer-kafka-static \
  <source-and-target-flags>    \
  <kafka-flags>                \
  <id-flags>                   \
  <batch-flags>                \
  <error-flags>                \
  <log-stat-flags>             \
  <testing-flags>              \
  <kafka-auth-flags>           \
```

{% include /com-ingest/com-ingest-flag-source-target.md %}

{% include /com-ingest/com-ingest-flag-kafka.md %}

ALTER TO STATIC INCLUDE which contains:


| Flag | Action | Description |
|---|---|---|
| `registry-url` | Remove |  |
| `header` | Insert | Path to a schema definition or "header" file in JSON format |
| `allow-missing-fields` | Insert |  |

{% include /com-ingest/com-ingest-flag-common-id.md %}

{% include /com-ingest/com-ingest-flag-common-batch.md %}

{% include /com-ingest/com-ingest-flag-common-error.md %}

{% include /com-ingest/com-ingest-flag-common-log-stat.md %}

{% include /com-ingest/com-ingest-flag-common-testing.md %}

{% include /com-ingest/com-ingest-flag-kafka-auth.md %}

## Additional information

{% include /com-ingest/com-ingest-help-kafka.md %}

{% include /com-ingest/com-ingest-extra-missing-val.md %}

{% include /com-config/com-config-extra-quoting-values.md%}

{% include /com-ingest/com-ingest-extra-path-selection.md %}

{% include /com-ingest/com-ingest-extra-config-datatype.md %}

{% include /com-ingest/com-ingest-extra-env-var-consumer.md %}

## Examples

* [Kafka static ingest consumer examples](/docs/community/com-ingest/com-ingest-example-kafka-static)
