---
title: Kafka delete ingest reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 8
---

# Kafka delete ingest reference

The `molecula-consumer-kafka-delete` command and arguments are used for:

* purpose 1
* purpose 2

## Before you begin

* Refer to the [Kafka ingest flags reference](/docs/community/com-ingest/com-ingest-flags-kafka)

## Kafka delete required keys

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
