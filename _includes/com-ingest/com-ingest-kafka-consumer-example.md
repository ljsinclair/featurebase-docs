Configuration and usage for this consumer is similar to the kafka consumer. It was developed for use in scenarios where Kafka is used without Confluent Schema Registry. In this case, the schema must be provided explicitly; the "static" in the consumer name refers to this "static schema". For compatibility with complex JSON message formats, the schema is specified with a JSON document rather than the "header spec" used in other consumers.

### Example 1: Simple ingest

Command:

```shell
molecula-consumer-kafka-static \
    --kafka-hosts "localhost:9092" \
    --index kafka-test \
    --batch-size 10000 \
    --topics test-topic \
    --max-msgs 10000 \
    --auto-generate \
    --external-generate \
    --header kafka-static-header-1.json
```


kafka-static-header-1.json:
```json
[
    {
        "name": "int-featurebase-name",
        "path": [
            "int-kafka-path"
        ],
        "type": "int"
    },
    {
        "name": "string-featurebase-name",
        "path": [
            "string-kafka-path"
        ],
        "type": "string"
    }
]
```

Example Kafka message:
```json
{
    "int-kafka-path": 12345,
    "string-kafka-path": "arbitraryString"
}
```

The header file specifies two fields:

- `int-featurebase-name`, a FeatureBase field of type `int`, populated with the value from the `int-kafka-path` item in the Kafka message.
- `string-featurebase-name`, a string-keyed FeatureBase field of type `set`, populated with the value from the `string-kafka-path` item in the Kafka message.
