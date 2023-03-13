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
  * [Kafka consumer with Confluent Schema Management](/docs/community/com-ingest/com-ingest-source-kafka-consumer)
  * [Kafka static schema](/docs/community/com-ingest/com-ingest-source-kafka-static)
  * [Kafka delete](/docs/community/com-ingest/com-ingest-source-kafka-delete)
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

{% include community/com-ingest-flag-source-target.md %}

{% include community/com-ingest-flag-kafka.md %}

{% include community/com-ingest-flag-common-id.md %}

{% include community/com-ingest-flag-common-batch.md %}

{% include community/com-ingest-flag-common-error.md %}

{% include community/com-ingest-flag-common-log-stat.md %}

{% include community/com-ingest-flag-common-testing.md %}

{% include community/com-ingest-flag-kafka-auth.md %}

## Additional information

{% include /com-ingest/com-ingest-help-kafka.md %}

{% include /community/com-ingest-missing-value-processing.md %}

### Field configuration



### Quoting values

Use double quotes `"..."` to enclose fields containing:
* Line breaks (CRLF)
* Commas
* double quotes

### Value Path Selection

The path option is an array of JSON object keys which are applied in order.
For example, `["a","b","c"]` would select `1` within `{"a":{"b":{"c":1}}}`.
This path must only consist of strings - array indexing is not supported. If a value is missing, the ingester will return an error. To override this behavior for non-primary key fields, use `allow-missing-fields`.

### Kafka consumer ingest

To ingest data to FeatureBase tables from Confluent managed Kafka schemas, you will require:
* A list of Kafka hosts
* A FeatureBase index name (`--index <indexname>`),
* One primary key method:
  * `--primary-key-field <fieldnames>`, or
  * `--id-field <fieldname>`, or
  * `--auto-generate`

### Kafka consumer environment variables

* Prefix flags with `CONSUMER_` and convert dots `.` and dashes `-` to underscores to use them as Kafka Consumer environment variables.

### Kafka Static ingest

The following ingest flags are used for Kafka static schemas

| Flag | Action | Description |
|---|---|---|
| `registry-url` | Remove |  |
| `header` | Insert | Path to a schema definition or "header" file in JSON format |
| `allow-missing-fields` | Insert |  |

### Kafka delete ingest


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

* [Kafka consumer ingest examples](/docs/community/com-ingest/com-ingest-example-kafka-consumer)
* [Kafka static ingest examples](/docs/community/com-ingest/com-ingest-example-kafka-static)
* [Kafka delete ingest examples](/docs/community/com-ingest/com-ingest-example-kafka-delete)
