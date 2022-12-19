### Example 2:

Command:

```shell
molecula-consumer-kafka-static \
    --kafka-hosts "localhost:9092" \
    --index kafka-test \
    --batch-size=10000 \
    --topics test-topic \
    --auto-generate \
    --allow-missing-fields \
    --header kafka-static-header-2.json
```

kafka-static-header-2.json:
```json
[
    {
        "name": "from_ip",
        "path": [
            "from_interface",
            "ip"
        ],
        "type": "string"
    },
    {
        "name": "from_port",
        "path": [
            "from_interface",
            "port"
        ],
        "type": "int"
    },
    {
        "name": "to_ip",
        "path": [
            "to_interface",
            "ip"
        ],
        "type": "string"
    },
    {
        "name": "to_port",
        "path": [
            "to_interface",
            "port"
        ],
        "type": "int"
    },
    {
        "name": "event_time",
        "path": [
            "event_time"
        ],
        "type": "timestamp"
    },
    {
        "name": "severity",
        "path": [
            "severity"
        ],
        "type": "set"
    },
    {
        "name": "bytes",
        "path": [
            "bytes"
        ],
        "type": "int"
    },
    {
        "name": "protocol",
        "path": [
            "protocol"
        ],
        "type": "string"
    }
]
```
<!-- TODO more complex path selection -->
<!-- TODO more types and config options in header file -->


Sample Kafka message:

```json
{
    "from_interface": {
        "ip": "10.203.33.18",
        "port": 38935
    },
    "to_interface": {
        "ip": "203.77.221.220",
        "port": 5872
    },
    "event_time": "2021-06-01T16:02:55Z06:00",
    "protocol": "UDP",
    "severity": 0,
    "bytes": 8593
}
```
