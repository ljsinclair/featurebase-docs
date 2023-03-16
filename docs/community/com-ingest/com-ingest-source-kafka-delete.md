---
title: Kafka delete message reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 8
---

# Kafka delete message reference

This reference page provides information on structuring an Avro encoded and formatted Kafka messages that is:
* referenced by the Kafka delete consumer CLI command
* used to delete values from a FeatureBase database

## Before you begin

{% include /com-ingest/com-ingest-kafka-confluent-before.md %}

## Kafka delete message syntax

```
{
    "namespace": "<example.test>",
    "type": "<delete-property>",
    "name": "<schema_name>",
    "delete": "<delete-property>",
    "fields":
      [
        {"name": "_id", "type": "string"},
        {"name": "<featurebase-sql-data-type"}, "type": "<featurebase-field-type>"
      ]
}
```

## Kafka message delete properties

| Property | Description | Required | Default | Additional |
|---|---|---|---|
| "namespace" |  |  | Yes |  |
| "type": "record" | Avro schema type `record` | Yes |  |  |
| "name" | AVRO schema name | Yes |  |  |
| "delete": "<delete-property>" | `delete` property determines how the Kafka consumer behaves, and what the Avro Schema should look like. |  | Yes | * [Delete fields properties](#delete-fields-properties)<br/>* [Delete values properties](#delete-values-properties)<br/>* [Delete records properties](#delete-records-properties) |
| `"fields"` | Delete all values in a list of fields for a single record without defining the specific data. | [Fields properties](#fields-properties)

## Additional information

### Delete Fields properties

{: .note}
If the `"delete"` property is not defined the `molecula-consumer` defaults to `"delete": fields`

Set `"delete": "fields"` to delete all values:
* in a list of fields
* for a single record
* for `IDSET` or `STRINGSET` fields where you don't know the specific values to delete

`"delete": "fields"` requires:
* FeatureBase index configured with `keys: true`
* At least one value for the `--primary-key-fields` key in `molecula-consumer-kafka-delete` to identify the `ID` of the record to delete data
* Kafka message `"fields"` parameter:
  * with `{"type": "array", "items": "string"}`
  * Values

#### Delete Values properties

Set `"delete": "values"` to:
* delete specified values from `IDSET` and `STRINGSET` fields
* specify `null` value for `BOOL`, `DECIMAL`, `INT` and `TIMESTAMP` fields

`"delete": "values"` requires:
* Avro fields containing data that can be deleted
* Matching name for Avro Record Schema field and target FeatureBase record

#### Avro data type field mapping

| SQL data type | FeatureBase field data type | Avro field data type |
|---|---|---|
| `_id` | `Record ID`<br/>`Key` | `string`<br/>`int` |
| `STRING` | Keyed `Mutex` | `string` |
| `STRINGSET` | Keyed `Set` | `string` or array of strings |
| `STRINGSETQ` | Keyed `Time` | N/A |
| `ID`   | Non-Keyed `Mutex` | `int` |
| `IDSET`| Non-Keyed `Set` | int or array of ints |
| `IDSETQ` | Non-Keyed `Time` | N/A |
| `INT`  | `Int` | `boolean` |
| `DECIMAL` | `Decimal` | `boolean` |
| `TIMESTAMP` | `Timestamp` | `boolean` |
| `BOOL` | `Bool` | `boolean` |

{: .note}
Kafka delete is not supported for the FeatureBase `time` or `time-quantum` data types.

#### Avro data types to Kafka message

| Avro data type | Kafka message | Additional |
|---|---|---|---|
| `string`<br/>`int` | Values to delete from FeatureBase field | Retain field values by using the `union` data type to union `null` value with `string` or `int` data types |
| `boolean` | `true` when FeatureBase field value should be deleted |

### Delete records properties

`"delete": "records"` is used to delete a list of records identified by their `_id`:
* where the index is configured as `keys: false`
*

`"delete": "records"` requires:
* one or more Avro records of data type `ids`, `keys` and `filter`
* `{"type": "array", "items": "int"}` message parameters



{: .note}
> A `"filter"` Avro field should be used to delete records based on a `PQL` row call.
> `{"type": "string"}` message parameters are required

### Data types

{% include /sql-guide/datatype-mapping.md %}

## Examples

### Kafka delete fields

{% include /com-ingest/com-ingest-eg-kafka-del-field-schema.md %}

{% include /com-ingest/com-ingest-eg-kafka-del-field-msg.md %}

{% include /com-ingest/com-ingest-eg-kafka-delete-ingest.md %}

### Kafka delete values

{% include /com-ingest/com-ingest-eg-kafka-del-values-schema.md %}

{% include /com-ingest/com-ingest-eg-kafka-del-values-msg.md %}

{% include /com-ingest/com-ingest-eg-kafka-del-values-ingest.md %}

### Kafka delete records

{% include /com-ingest/com-ingest-eg-kafka-del-records-schema.md %}

{% include /com-ingest/com-ingest-eg-kafka-del-records-msg.md %}

{% include /com-ingest/com-ingest-eg-kafka-del-records-ingest.md %}

## Next step

* [Kafka delete ingest consumer flags reference](/docs/community/com-ingest-flags-kafka-delete)
