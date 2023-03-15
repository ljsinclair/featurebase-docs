---
title: Delete Kafka data on ingest
layout: default
parent: Import data
grand_parent: Community
nav_order: 8
---

# Kafka delete ingest reference

Delete records from a FeatureBase Table using a Kafka Confluent source.

## Before you begin

{% include /com-ingest/com-ingest-kafka-confluent-before.md %}

## Kafka delete message syntax
```
{
    "namespace": "<example.test>",
    "type": "<delete-property>",
    "name": "<schema_name>",
    "delete": "<delete-property>",
    "fields": [ ... ]
}
```

## Kafka message delete properties

| Property | Description | Required | Default | Additional information |
|---|---|---|---|
| "namespace" |  |  | Yes |  |
| "type": "record" | Avro schema type `record` | Yes |  |  |
| "name" | AVRO schema name | Yes |  |  |
| "delete": "fields" | `delete` property determines how the Kafka consumer behaves, and what the Avro Schema should look like | Yes | `fields` | [Delete property](#delete-property) |
| "fields" | Field names containing data to be deleted | Yes |  |  |

## Additional information

### Delete property

{: .note}
The Kafka consumer can read messages containing each of the delete properties and apply to the Kafka topic.

| Delete property | Description | Data types | Required ingest flags | Additional |
|---|---|---|---|---|---|
| `"fields"` | Delete all values in a list of fields for a single record without defining the specific data. | `stringset`<br/>`idset` | `--primary-key-fields`<br/>`keys:true` for index | Fails when used with `keys:false` indexes |
| `"values"` | Delete specific values from a list of fields for a single record. | `BOOL`<br/>`DECIMAL`<br/>`IDSET`<br/>`INT`<br/>`STRINGSET`<br/>`TIMESTAMP` |  | Set `BOOL`<br/>`DECIMAL`<br/>INT`<br/>`TIMESTAMP` fields to null without knowing their values |
| `"records"` | Delete full records either as a list or using a `PQL` row query | `STRING`<br/>`INT` | index `keys: true` for `STRING values`<br/>index `keys:false` for `INT` values |

### Data types

{% include /sql-guide/datatype-mapping.md %}

## Examples

{% include /com-ingest/com-ingest-eg-kafka-delete-schema.md %}

{% include /com-ingest/com-ingest-eg-kafka-delete-msg.md %}

{% include /com-ingest/com-ingest-eg-kafka-delete-ingest.md %}

## Next step

{% include /com-ingest/com-ingest-kafka-next.md %}
