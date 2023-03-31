### Mapping Avro and FeatureBase data types

The `molecula-consumer-kafka` and `molecula-consumer-kafka-delete` CLI commands:
* Read the Avro schema from the Confluent Schema Registry
* Infers the FeatureBase data type for each field

#### avro.Array

| Avro data type | Properties | FeatureBase Data type |
|---|---|---|
| avro.Array : avro.String |  | STRINGSET |
| avro.Array : avro.Bytes  |  | STRINGSET |
| avro.Array : avro.Fixed  |  | STRINGSET |
| avro.Array : avro.Enum   |  | STRINGSET |
| avro.Array : avro.String | quantum=(YMD) | STRINGSETQ |
| avro.Array : avro.Bytes  | quantum=(YMD) | STRINGSETQ |
| avro.Array : avro.Fixed  | quantum=(YMD) | STRINGSETQ |
| avro.Array : avro.Enum   | quantum=(YMD) | STRINGSETQ |
| avro.Array : avro.Long   |  | IDSET |
| avro.Array : avro.Long   | quantum=(YMD)  | IDSETQ |

#### avro.Bytes

| Avro data type | Properties | FeatureBase Data type |
|---|---|---|
| avro.Bytes | logicalType=decimal, scale | `DECIMAL` |
| avro.Bytes | fieldType=decimal, scale | `DECIMAL` |
| avro.Bytes | fieldType=recordTime | `STRINGSETQ` and `IDSETQ` |
| avro.Bytes |  | `STRINGSET`   |
| avro.Bytes | mutex=true | `STRING` |
| avro.Bytes | quantum=(YMD) | `STRINGSETQ` |

#### avro.boolean

| Avro data type | Properties | FeatureBase Data type |
|---|---|---|
| avro.Boolean |  | `BOOL` |

#### avro.Double, avro.Float

| Avro data type | Properties | FeatureBase Data type |
|---|---|---|
| avro.Double, avro.Float | scale | `DECIMAL` |

#### avro.Enum

| Avro data type | Properties | FeatureBase Data type |
|---|---|---|
| avro.Enum |  | `STRING` |

#### avro.Int, avro.Long

| Avro data type | Properties | FeatureBase Data type |
|---|---|---|
| avro.Int, avro.Long | fieldType=id   | IDSET  |
| avro.Int, avro.Long | fieldType=id, mutex=false | ID  |
| avro.Int, avro.Long | fieldType=id, quantum=(YMD)    | IDSETQ |
| avro.Int, avro.Long | fieldType=int, min, max| INT |

#### avro.String

| Avro data type | Properties | FeatureBase Data type |
|---|---|---|
| avro.String || STRINGSET   |
| avro.String | mutex=true| STRING |
| avro.String | quantum=(YMD)  | STRINGSETQ  |

#### avro.Union

| Avro data type | Properties | FeatureBase Data type |
|---|---|---|
| avro.Union  || Supports one or two members (if two, one must be avro.NULL) |

#### Not supported in FeatureBase

| Avro data type | Properties | FeatureBase Data type |
|---|---|---|
| avro.Map |  | NOT SUPPORTED  |
| avro.Null |  | NOT SUPPORTED |
| avro.Record |  | NOT SUPPORTED  |
| avro.Recursive |  | NOT SUPPORTED  |
