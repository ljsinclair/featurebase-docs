---
title: Kafka ingest reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 8
---

# Kafka ingest reference
{: .no_toc}

{% include /com-ingest/com-ingest-kafka-summary.md %}

{% include page-toc.md %}

## Before you begin

* Choose a Kafka ingest method:
  * [Kafka Confluent Schema Management](/docs/community/com-ingest/com-ingest-source-kafka-confluent)
  * [Kafka static schema](/docs/community/com-ingest/com-ingest-source-kafka-static)
  * [Kafka Confluent delete](/docs/community/com-ingest/com-ingest-source-kafka-confluent-delete)
* [Start Apache Kafka services](https://kafka.apache.org/quickstart){:target="_blank"}

## Kafka CLI Syntax

```
molecula-consumer-{kafka | kafka-delete | kafka-static} \
  <source-and-target-flags>  \
  <kafka-flags>              \
  <id-flags>                 \
  <batch-flags>              \
  <error-flags>              \
  <log-stat-flags>           \
  <testing-flags>            \
  <kafka-auth-flags>         \
```

{% include /com-ingest/com-ingest-flag-source-target.md %}

{% include /com-ingest/com-ingest-flag-kafka.md %}

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

### Kafka Confluent ingest

To ingest data to FeatureBase tables from Confluent managed Kafka schemas, you will require:
* A list of Kafka hosts
* A FeatureBase index name (`--index <indexname>`),
* One primary key method:
  * `--primary-key-field <fieldnames>`, or
  * `--id-field <fieldname>`, or
  * `--auto-generate`

### Kafka Confluent environment variables

* Prefix flags with `CONSUMER_` and convert dots `.` and dashes `-` to underscores to use them as Kafka Consumer environment variables.

### Kafka Static ingest

The following ingest flags are used for Kafka static schemas

| Flag | Action | Description |
|---|---|---|
| `registry-url` | Remove |  |
| `header` | Insert | Path to a schema definition or "header" file in JSON format |
| `allow-missing-fields` | Insert |  |

### Kafka Confluent delete message

The following syntax is required when `"fields"` is set for:
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

{: .note}
If no `delete` property is

When the delete property in the Avro Record Schema is set to `"fields"`, the following should be true:
1. The `--primary-key-fields` configuration option is set (i.e. not `--id-field` or `--auto-generate`/`--external-generate`)
2. There are fields for each value in the `--primary-keys-fields` configuration option. The consumer will uses these fields to determine the `ID` of the record to delete data from.
2. There is a field named `fields` wit the following type: `{"type": "array", "items": "string"}`. The value is the list of fields to delete all the data from.

Prior to the introduction of the `delete` property in the Avro schema, this was the only delete option. Thus, if there is no `delete` property in the Avro schema, this is the behavior of the consumer.

### Kafka Confluent delete ingest

Kafka requires the following keys to be added to the JSON header file:

| Flag | Description |
|---|---|
| `fields` | Values in the fields defined in the array will be deleted at the specified key |
| `featurebase-grpc-hosts` | Required so the `inspect` call can determine the values to be deleted |

## Kafka delete packed `bool` data type requirements

```
  `bools|is-alive`
```

| Key | Description |
|---|---|
| `bools` | Name of the packed `bools` field that matches `pack-bools` defined in the ingest configuration. Defaults to `bools`. |
| `is-alive` | Name of individual boolean field. |

## Examples

* [Kafka Confluent ingest examples](/docs/community/com-ingest/com-ingest-eg-kafka-con)
* [Kafka static ingest examples](/docs/community/com-ingest/com-ingest-example-kafka-static)
* [Kafka Confluent delete ingest examples](/docs/community/com-ingest/com-ingest-eg-kafka-con-del)
