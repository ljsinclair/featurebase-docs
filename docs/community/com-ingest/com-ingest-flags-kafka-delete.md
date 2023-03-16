---
title: Kafka delete ingest consumer
layout: default
parent: Import data
grand_parent: Community
nav_order: 8
---

# Kafka delete ingest consumer reference
{: .no_toc}

{% include /com-ingest/com-ingest-kafka-summary.md %}

To ingest data to FeatureBase tables from Confluent managed Kafka schemas, you will require:
* A list of Kafka hosts
* A FeatureBase index name (`--index <indexname>`),
* One primary key method:
  * `--primary-key-field <fieldnames>`, or
  * `--id-field <fieldname>`, or
  * `--auto-generate`

The Kafka Avro delete consumer was built to supply delete functionality that doesn't exist in the Kafka Avro consumer.

The `"fields"`values in the Kafka Avro message define the data to be deleted at the `--primary-key-fields` specified on the CLI.

{: .note}
`molecula-consumer-kafka-delete` processes Kafka messages one at a time.

{% include page-toc.md %}

## Before you begin

* [Learn how to configure the Kafka message to delete values](/docs/community/com-ingest/com-ingest-source-kafka-delete)
* [Start Apache Kafka services](https://kafka.apache.org/quickstart){:target="_blank"}

## Kafka CLI Syntax

```
molecula-consumer-kafka-delete \
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

IMPORTANT > New kafka flags for each consumer method!!

The following syntax is required when the Kafka Avro message `"fields"` value is set for:
* the Avro Record Schema
* the Kafka message `"delete"` property

```
  --primary-key-fields "<primary-keys>" \
  --topics delete_topic \
  --kafka-bootstrap-server <url-or-ip>:9092 \
  --schema-registry-url <url-or-ip>:8081 \
  --featurebase-hosts <url-or-ip>:10101 \
  --featurebase-grpc-hosts <url-or-ip>:20101 \
  --index <an_index>
```

| Flag | Description |
|---|---|
| <primary-keys> | Used by the Kafka delete consumer to determine `ID` of the record to delete data from. |
| `featurebase-grpc-hosts` | Required so the `inspect` call can determine the values to be deleted |



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

### Kafka delete packed `bool` data type requirements

```
  `bools|is-alive`
```

| Key | Description |
|---|---|
| `bools` | Name of the packed `bools` field that matches `pack-bools` defined in the ingest configuration. Defaults to `bools`. |
| `is-alive` | Name of individual boolean field. |

## Examples

* [Kafka delete ingest consumer examples](/docs/community/com-ingest/com-ingest-eg-kafka-con-del)
