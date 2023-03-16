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
        {
 "type": "array",
 "items": "string"
        }`
        ...
      ]
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

| Property | Description | Data types | Required ingest flags | Additional |
|---|---|---|---|---|---|
| `"fields"` | Delete all values in a list of fields for a single record without defining the specific data. | `stringset`<br/>`idset` | `--primary-key-fields`<br/>`keys:true` for index | Fails when used with `keys:false` indexes |

| `"values"` | Delete specific values from a list of fields for a single record. | `BOOL`<br/>`DECIMAL`<br/>`IDSET`<br/>`INT`<br/>`STRINGSET`<br/>`TIMESTAMP` |  | Set `BOOL`<br/>`DECIMAL`<br/>INT`<br/>`TIMESTAMP` fields to null without knowing their values |
| `"records"` | Delete full records either as a list or using a `PQL` row query | `STRING`<br/>`INT` | index `keys: true` for `STRING values`<br/>index `keys:false` for `INT` values |

#### `"delete": "values"` property

Where the Avro Record Schema `"delete"` property is set to `"values"`:
* Avro fields must contain fields containing data that can be deleted
* Name of the field in the Avro Record Schema must match a target field in a FeatureBase table

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
| `_id` |


The `_id` field in the Avro message
* is reserved for the record ID / key.
This is used to identify the record for which data should be deleted.

If the FeatureBase index has keys set to `true` then the type of the `_id` Avro field should be set to `string`. Otherwise, it should be set to `int`.



### Data types

{% include /sql-guide/datatype-mapping.md %}


## Examples

{% include /com-ingest/com-ingest-eg-kafka-delete-schema.md %}

{% include /com-ingest/com-ingest-eg-kafka-delete-msg.md %}

{% include /com-ingest/com-ingest-eg-kafka-delete-ingest.md %}

## Next step

* [Kafka delete ingest consumer flags reference](/docs/community/com-ingest-flags-kafka-delete)
