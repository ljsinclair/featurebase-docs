---
title: Kafka delete ingest reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 8
---

# Kafka delete ingest reference

The `molecula-consumer-kafka-delete` command and arguments are used to delete records from a FeatureBase table.

## Before you begin



## Kafka delete JSON syntax

```json
  "namespace": "org.test",
  "type": "record",
  "name": "deletes",
  "doc": "",
  "fields": [
    {
        "name": "abc",
        "doc": "The ABC",
        "type": "string"
    }
  ]
}
```

## Kafka delete JSON parameters

| Parameter | Description | Required | Further information |
|---|---|---|---|
| `namespace` |  |  |  |
| `type` | Valid values are `record`, `VALUE`, `VALUE` |  |  |
| `name` |  |  |  |
| `doc` |  |  |  |
| `fields` |  |  |  |
| `name` |  |  |  |
| `doc` |  |  |  |
| `type` | Data type |  |  |

## Additional information

* `fields` values repeat as an array for each record to be deleted from the FeatureBase table.

### Data types

{% include /sql-guide/datatype-mapping.md %}

## Examples

### JSON configuration for Kafka delete

```json
{
	"namespace": "org.test",
	"type": "record",
	"name": "deletes",
	"doc": "",
	"fields": [
    	{
        	"name": "abc",
        	"doc": "The ABC",
        	"type": "string"
    	},
    	{
        	"name": "db",
        	"doc": "TE DB Number",
        	"type": "string"
    	},
    	{
        	"name": "user_id",
        	"doc": "User ID",
        	"type": "int"
    	},
    	{
        	"name": "fields",
        	"type": {
                	"type": "array",
                	"items": "string"
            	}
    	}
	]
}
```

## Next step

{% include /com-ingest/com-ingest-kafka-next.md %}
