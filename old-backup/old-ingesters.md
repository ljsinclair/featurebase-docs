---
title: Ingesters
layout: default
parent: Import data
grand_parent: Community
---

## What is an ingester?

The Molecula Ingest Development Kit is a system for efficiently loading large amounts of data into a FeatureBase cluster.
It provides services which convert other data formats to FeatureBase's Roaring data format and load it into FeatureBase.

The ingester has three steps:
1. Collect records from a data source.
2. Translate records into FeatureBase's Roaring Bitmap format.
3. Copy the converted data into FeatureBase.

### 1. Collect records from a data source.

This process operates in large "batches" of records.
The entirety of a single batch is copied into FeatureBase at the same time.
Large batches mean that the per-batch overhead is less significant.
A batch is created once a specified number of records have been pulled.

**NOTE:**
When using the Kafka ingester, a smaller batch will be created if Kafka stops supplying records for at least a second.

In Molecula `v2.2` and newer, the ingester has a `--track-progress` CLI option which periodically logs the number of records which have been pulled from a source, as well as the lifetime average record sourcing rate.

### 2. Translate records into FeatureBase's Roaring Bitmap format.

During the first step, the records are accumulated in a mostly uncompressed format. In order to compress them, the ingester needs to acquire "Key IDs" for all keyed rows and columns. In the case of a string field, there is one ID for each string value which can be present in the field. For a string-keyed index, there is one ID for each row. If the specified row/column did not previously exist, FeatureBase will generate an ID in this step.

The process of obtaining these Key IDs is referred to as translation in the ingester's logs:

```text
2020/07/20 14:14:47 translating batch of 10 took: 10.1172ms
```

Once all of the IDs have been mapped, the ingester converts the batch into roughly the format that FeatureBase will store it in.

### 3. Copy the converted data into FeatureBase.

The ingester acquires a transaction in order to ensure that no other application accesses an incompletely written index, and then copies all of the data into FeatureBase. This step is typically bottlenecked either by the network or the storage device backing the FeatureBase cluster.

The process of copying this data into FeatureBase is referred to as "flushing" in the ingester's logs, and typically takes a very small amount of time:

```text
2020/07/20 14:14:47 flushing batch of 10 to fragments took 84.2µs
```


## ID generation

When ingesting into FeatureBase, each record must be associated with a key. Ingesters support four ways to do this, three suitable for production workloads:

- `primary-key-fields`,
- `id-field`,
- `external-generate`, to use the FeatureBase ID allocator, optionally including `offset-mode`,
- `auto-generate`, suitable for testing.

The `id-field` option should be considered when there is an existing field in the data which uniquely identifies each record and consists of contiguous positive integers. For example, the auto-incremented ID field from a relational database is usually perfect for this.

In most other cases, the `primary-key-fields` option should be used. This uses one or more fields, converted to strings, then concatenated (using `|` as the delimiter), to create unique record IDs. When only a single field is used for this, it will *not* be indexed as a field in FeatureBase. When multiple source fields are used, each individual field will be indexed in FeatureBase, in addition to being used for the record ID.

As an example, consider a data set of students across multiple schools, perhaps with a different CSV file for each school:

| school   | studentID | UUID     |   age | grade | ... |
| ---      |       --- | ---      |   --- |   --- | --- |
| (string) |     (int) | (string) | (int) | (int) |     |
| Anderson |         0 | 63a8     |    14 |     9 |     |
| Anderson |         1 | 98e9     |    16 |    11 |     |
| Anderson |         2 | 9ccb     |    16 |    11 |     |
| Anderson |         3 | 7325     |    15 |    10 |     |
| Bowie    |         0 | 6ed3     |    17 |    12 |     |
| Bowie    |         1 | 62a5     |    16 |    11 |     |
| Bowie    |         2 | bd6c     |    15 |    10 |     |
| Bowie    |         3 | 5651     |    16 |    10 |     |

The studentID column, unique within a single school, serves as an identifier. When ingesting a single file corresponding to a single school, an ingest option like `--id-field=studentID` might work well. This will result in an index with `studentID` as FeatureBase record IDs, and every *other* column potentially represented as a FeatureBase field, including `school`, `UUID`, `age`, and `grade`.

To ingest multiple files without conflicting IDs, a different approach is required. When an appropriate identifier like a UUID is available, that can be used directly, with an option like `--primary-key-fields=UUID`. This will result in an index with `UUID` as FeatureBase record keys, so the index depends on key translation to convert UUID string values to integer record IDs. Every other column would potentially be represented as a FeatureBase field, including `school`, `studentID`, `age`, and `grade`.

Sometimes, an appropriate unique identifier is not directly available, or perhaps a data set is designed to use a composite key as a unique identifier. For example, if the students data set did not include a UUID column. In this case, multiple values can be combined to produce a composite identifier that is unique. One option that would work well here is the pair (school, studentID), which would be specified as `--primary-key-fields=school,studentID`. This would result in an index with this composite key as FeatureBase record keys. The key for the first row in the data set would be "Anderson|0". Again, this index would depend on key translation. This index, in contrast to the previous, could include *every* column as a FeatureBase field, including both `school` and `studentID` as separate fields.

The `auto-generate` option can create auto-incrementing integer IDs, when generating test data, or when ingesting from a CSV source, for example. This option is suitable for quick testing purposes, but does not support using multiple ingest processes or stopping and restarting ingest.

Finally, setting `external-generate` in addition to `auto-generate` uses FeatureBase's ID generation feature. Additionally, `offset-mode` can be set for use with Kafka.

## Kafka Ingester

The Kafka ingester reads Avro-encoded records from a Kafka topic, uses the Confluent schema registry to decode them, and ingests the data into FeatureBase.

[Full configuration reference](/docs/community/com-ingest/com-ingest-manage#kafka-ingester)

### Schema Registry Behavior

How the Ingester indexes data in FeatureBase can be controlled to some extent via the schema registry. Avro schemas allow arbitrary properties to be associated with any item to implement features like [logical types](https://avro.apache.org/docs/current/spec.html#Logical+Types).

A "float" or "double" type field in an Avro schema will be ingested into FeatureBase as a decimal field. If the property "scale" is provided, and is an integer, the value will be multiplied by 10^scale before being ingested. FeatureBase also stores the scale internally, so decimal fields will scale their query parameters appropriately, and floating point numbers are accepted as query parameters. A type which uses the logical type "decimal" will also be ingested as a decimal provided that it is 8 bytes or less (64 bit).

A "boolean" type field (or a union of boolean and null), will be ingested according to the "pack-bools" setting on the ingester. By default, boolean fields are packed into two "set" fields in FeatureBase which has a few benefits. It reduces fragmentation internally in FeatureBase, and allows one to perform "TopN" queries on all boolean fields together. The reason there are two fields is to distinguish between true, false, and null. Each row in the "bools" field represents whether the boolean value is true. Each row in the "bools-exists" field represents whether or not the value is null. So, a set bit in the "bools" field always implies the corresponding set bit in the "bools-exists" field, but the lack of a set bit in the "bools" field needs to check "bools-exists" to determine if the value is null or false.

An "enum" type will be ingested into a FeatureBase mutex field by default. Unlike a set field, if a different value comes in for the same record, the existing value will automatically be cleared—that is, each record (FeatureBase column) can only have one value for a mutex field.

A "string" type will be ingested into a FeatureBase set field by default. One can choose to use a mutex field instead by adding the property '"mutex": true' to the schema for that field.

Currently, the ingester supports a limited subset of Avro types. The top level type must be a Record, and nested fields are not supported—meaning that fields must not be of type Record or Map. Unions are only supported if it is a union of a supported type and null. Arrays are supported as long as they contain strings, bytes, fixed or enum types.

Field names must be valid FeatureBase field names, so they must be all lower case, start with a letter, contain only letters, numbers, or dashes, and be 64 characters or less. We're hoping to lift these restrictions in an upcoming release.


## Kafka Delete Ingester

The delete ingester for Kafka works similarly to the Kafka ingester in that it takes Avro-encoded records and uses the schema registry to decode them. It differs, however, in that a specific format is required to specify what should be deleted. Each record should contain the same fields for primary key (or ID) that the Kafka ingester uses, and in addition to that, there should be one other field called "fields" which is an array of strings and contains the names of the fields which should have their values deleted for the record at the given key. An example schema is:


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

There is one special case when using packed bools: the string identifying the field for deletion in this case should resemble "bools|is-alive", where "bools" is the name of the packed bools field (as specified in the ingester via `pack-bools`, but defaulting to `bools`) and `is-alive` is the name of an individual boolean field.


### Configuration

The Kafka delete ingester configuration is the same as the Kafka ingester with the addition of `pilosa-grpc-hosts` (or `featurebase-grpc-hosts` with `future.rename` flag) which is the endpoint on which FeatureBase is listening for GRPC connections. This is necessary as the delete ingester uses an `Inspect` call to figure out what values need to be deleted and that call is only available over this interface. By default it's `localhost:20101`.


## Kafka Static Ingester

The Kafka Static ingester reads JSON-encoded records from a Kafka topic, uses a statically defined schema (with the ingester JSON header format) to decode them, and ingests the data into FeatureBase.

[Full configuration reference](/docs/community/com-ingest/com-ingest-manage#kafka-static-ingester)


## CSV Ingester

The CSV ingester can read CSV files (optionally gzipped) and ingest them to FeatureBase. It uses a naming convention in the header of the CSV file to [specify how each field](/docs/community/com-ingest/com-ingest-manage#field-types) should be ingested. The header can either be included in the file or passed in separately if editing the file is not desirable. If passed in separately one should use the `--ignore-header` option if the CSV file has a header so that it is not interpreted as data.

[Full CSV Ingester Configuration Reference](/docs/community/com-ingest/com-ingest-manage#csv-ingester)


## SQL Ingester

The SQL ingester uses a sql connection (via MSSQL, MySQL, or Postgres) to select data using the SQL CLI, and ingests the data into FeatureBase. It uses the SQL table column names to [specify how each field](/docs/community/com-ingest/com-ingest-manage#field-types) should be ingested, similar to the CSV Ingester.

[Full SQL Ingester Configuration Reference](/docs/community/com-ingest/com-ingest-manage#sql-ingester)

## Field types

Many Molecula ingesters use the same syntax for describing how you want the fields in your source data to be ingested into FeatureBase. The basic structure is

`field_name__FieldType_Arg1_Arg2`

That is, you name each field, and then you specify the field's type (separated by two underscores), and then any arguments that the field type takes. For example:

`age__Int_0_120`

declares that field is named 'age', is expected to be an integer, and be between 0 and 120. In general, all arguments are optional, but they are also positional, so if you want to specify a maximum value for the int field, you must first specify a minimum value.

[Here](/docs/community/com-ingest/com-ingest-manage) is the full list of field types along with their arguments.

## Ingest Tuning

### Optimizing the ingest process

There are a few options to tune the ingest process for a specific workload:
1. Batch size
2. Cache length
3. Number of ingesters

#### 1. Batch size

There is a fixed overhead from setting up a transaction, as well as a fixed overhead for each row.
Ingesting larger batches will cause these to average out more.
In general, larger batches will improve performance and proportionally raise memory usage.
There is no default batch size because the memory usage per record varies greatly between workloads.
For workloads with a large number of sparse keys, batch sizes of around 20,000 will typically use a few hundred megabytes of memory.
For workloads mostly consisting of high-frequency keys, it may be practical to use batch sizes of a million or more.

#### 2. Cache length

Under most workloads, the key translation process is the most expensive part of the ingest process.
In order to make this more efficient, the ingester keeps a cache of recently used keys in order to avoid re-requesting them from FeatureBase.
Using a longer cache will use more memory but potentially improve performance.
Using a shorter cache will potentially reduce performance but will also reduce memory requirements.

Before Molecula `v2.1`, every ingester had several LRU caches configured to each store up to approximately 1 million keys, with >100 bytes of memory overhead per key.

After Molecula `v2.1`, every ingester stores all keys used in the past 64 batches (keys used in multiple batches are only stored once). This cache length value can be changed with the `--cache-length` CLI flag.

The steady-state cache miss rate can be approximated as:

```math
p = (1-q)^(l*s)
```

Where:
- `p` = probability of a cache miss on a key
- `q` = frequency of usage of the key
- `l` = cache length
- `s` = batch size

The graph below shows the cache miss rate over different cache lengths assuming a key with an average frequency of 1 per 10000 records and a batch size of 5000. The default of 64 gives a miss rate of approximately 4% for this frequency. Beyond this, there are substantial declining returns.

[![Cache Miss Rate vs Cache Length](/assets/images/cache-miss-rate-vs-length.png "Cache Miss Rate vs Cache Length")](https://www.desmos.com/calculator/bjcjris94d)

The graph below shows the cache miss rate over different key frequencies with a batch size of 5000 and a variety of cache lengths. For the default length of 64, the miss rate is negligible for keys more frequent than 1 per 10000, and extremely high for keys less frequent than 1 per million. If the cache length is doubled to 128, it spikes at a frequency a bit lower, at the expense of double the memory:

[![Cache Miss Rate vs Key Frequency](/assets/images/cache-miss-rate-vs-freq.png "Cache Miss Rate vs Key Frequency")](https://www.desmos.com/calculator/hdhzehaeeg)


#### 3. Number of ingesters

It may sometimes be desirable to run multiple ingesters in parallel.
This may improve utilization on multi-core systems, or allow for redundancy.

It is possible to run multiple identical ingesters in the same process with the `--concurrency` CLI flag.
These ingesters are mostly independent, and roughly behave the same as two independent ingester processes would.
`--concurrency` CLI flag is not supported for `./molecula-consumer-csv` and `./molecula-consumer-sql`.

Alternatively, it is possible to launch multiple ingester processes, possibly on multiple machines.

### Common performance problems

#### Large mutex fields

Ingest of a mutex field with many possible values can be extremely slow.
The FeatureBase cluster has to compare every ingested row with every row in the field to detect if a pre-existing value needs to be cleared.
When operating with many unique mutex values, this results in `O(n^2)` ingest complexity.


## CSV Ingester

The CSV ingester can read CSV files (optionally gzipped) and ingest them to FeatureBase. It uses a naming convention in the header of the CSV file to [specify how each field](/docs/community/com-ingest/com-ingest-manage) should be ingested. The header can either be included in the file or passed in separately if editing the file is not desirable. If passed in separately one should use the `--ignore-header` option if the CSV file has a header so that it is not interpreted as data.

The CSV ingester uses the CSV conventions outlined in [RFC-4180](https://datatracker.ietf.org/doc/html/rfc4180#section-2). CSV files following other conventions may result in undefined behavior. Few things to note from the specifications:
- "Fields containing line breaks (CRLF), double quotes, and commas should be enclosed in double-quotes."
- "If double-quotes are used to enclose fields, then a double-quote appearing inside a field must be escaped by preceding it with another double quote."

Use `./molecula-consumer-csv -h` to list all available flags. Each flag is also available as an environment variable by prefixing it with "CONSUMER_".

| Flag            | Type    | Description                                                                                                                   |
| -               | -       | -                                                                                                                             |
| 	files         | strings | List of files, URLs, or directories to ingest.                                                                                |
| 	header        | strings | Optional header. If not passed, first line of each file is used.                                                              |
| 	ignore-header | bool    | Ignore header in file and use configured header. You *must* configure a header.                                               |
| 	just-do-it    | bool    | Any header field not in the appropriate format, just downcase, use it as the name and process the value as a String/set field |

### Missing Values

Missing values and empty string values (`""`) are handled identically.

| Field Type 	| Expected Behavior	During CSV Ingestion																			|
| -------------	| --------------------------------------------------------------------------------------------------------------	|
|`"ID"`			| Raise error during ingestion if `"ID"` is selected for primary-key-field. Otherwise, behave same as `"String"`. 	|
|`"DateInt"`	| Raise error during ingestion - timestamp must have a valid value.													|
|`"Timestamp"`	| Raise error during ingestion - input is not time. 																|
|`"RecordTime"`	| Do not update value in index. 																					|
|`"Int"` 		| Do not update value in index. 								 													|
|`"Decimal"`	| Do not update value in index. 																					|
|`"String"`		| Do not update value in index. 																					|
|`"Bool"`		| Do not update value in index. 																					|
|`"StringArray"`| Do not update value in index. 																					|
|`"IDArray"`	| Do not update value in index. 																					|
|`"ForeignKey"` | Do not update value in index. 																				 	|

## SQL Ingester

The SQL ingester uses a sql connection (via MSSQL, MySQL, or Postgres) to select data using the SQL CLI, and ingests the data into FeatureBase. It uses the SQL table column names as [header descriptions to specify how each field](/docs/community/com-ingest/com-ingest-manage) should be ingested, similar to the CSV Ingester.

Use `./molecula-consumer-sql -h` to list all available flags (or see table below). A few sample configurations are noted below:

```shell
molecula-consumer-sql \
	--connection-string 'server=sqldb.myserver.com;userid=mysqlusername;password=secret;database=mydbname' \
	--pilosa-hosts 10.0.0.1:10101 \
	--batch-size 1000000 \
	--driver=mssql \
	--index=myindexname \
	--id-field=id \
	--row-expr 'SELECT tableID as id__ID, zipcode as zipcode__String limit 10'
```
<!-- future.rename is depreciated
Or, equivalently, with the [`--future.rename` configuration flag](/docs/community/old-versions/old-featurebase-rename) configuration flag:

```shell
molecula-consumer-sql \
    --future.rename \
	--connection-string 'server=sqldb.myserver.com;userid=mysqlusername;password=secret;database=mydbname' \
	--featurebase-hosts 10.0.0.1:10101 \
	--batch-size 1000000 \
	--driver=mssql \
	--index=myindexname \
	--id-field=id \
	--row-expr 'SELECT tableID as id__ID, zipcode as zipcode__String limit 10'
```
-->

Example connection strings:

MySQL:
```shell
--driver mysql --connection-string 'myusername:password@(10.0.0.1:3306)/mydb'
```
MS SQL:
```shell
--driver mssql --connection-string 'server=sqldb.myserver.com;userid=mysqlusername;password=secret;database=mydbname'
```
Postgres:
```shell
--driver postgres --connection-string 'postgresql://postgres:password@localhost:5432/molecula?sslmode=disable'
```
or
```shell
--driver postgres --connection-string 'user=postgres password=password host=localhost port=5432 dbname=molecula sslmode=disable'
```

See the following documentation for more details on connection strings:

MySQL: 		https://github.com/go-sql-driver/mysql#dsn-data-source-name

MSSQL: 		https://github.com/denisenkom/go-mssqldb#connection-parameters-and-dsn

postgres:	https://godoc.org/github.com/lib/pq

| Flag                           | Type    | Description |
| -                              | -       | - |
| assume-empty-pilosa            | bool    | Alias for --assume-empty-featurebase. Will be deprecated in the next major release. |
| assume-empty-featurebase       | bool    | Setting this means that you're doing an initial bulk ingest which assumes that data does not need to be cleared/unset in FeatureBase. There are various performance enhancements that can be made in this case. For example, for booleans if a false value comes in, we'll just set the bit in the bools-exists field... we won't clear it in the bools field. |
| auto-generate                  | bool    | Automatically generate IDs. |
| batch-size                     | int     | Number of records to read before indexing all of them at once. Generally, larger means better throughput and more memory usage. 1,048,576 might be a good number. (default 1) |
| connection-string              | string  | credentials for connecting to sql database (default "postgres://user:password@localhost:5432/defaultindex?sslmode=disable") |
| driver                         | string  | key used for finding go sql database driver (default "postgres") |
| exp-split-batch-mode           | bool    | Tell go-pilosa to build bitmaps locally over many batches and import them at the end. Experimental. Does not support int or mutex fields. Don't use this unless you know what you're doing. |
| id-field                       | string  | Field which contains the integer column ID. May not be used in conjunction with primary-key-fields. If both are empty, auto-generated IDs will be used. |
| index                          | string  | Name of FeatureBase index. |
| log-path                       | string  | Log file to write to. Empty means stderr. |
| pack-bools                     | string  | If non-empty, boolean fields will be packed into two set fields—one with this name, and one with &lt;name>-exists. (default "bools") |
| pilosa-hosts                   | strings | Alias for --featurebase-hosts. Will be deprecated in the next major release. |
| featurebase-hosts              | strings | Comma separated list of host:port pairs for FeatureBase. (Default: localhost:10101) |
| pprof                          | string  | host:port on which to listen for pprof (default "localhost:6062") |
| primary-key-fields             | strings | Data field(s) which make up the primary key for a ecord. These will be concatenated and translated to a FeatureBase ID. If empty, record key translation will not be used. (default []) |
| row-expr                       | string  | sql + type description on input |
| stats                          | string  | host:port on which to host metrics (default "localhost:9093") |
| string-array-separator         | string  | separator used to delineate values in string array (default ",") |
| tls.ca-certificate             | string  | Path to CA certificate file. |
| tls.certificate                | string  | Path to certificate file. |
| tls.enable-client-verification | bool    | Enable verification of client certificates. |
| tls.key                        | string  | Path to certificate key file. |
| tls.skip-verify                | bool    | Disables verification of server certificates. |
| verbose                        | bool    | Enable verbose logging. |
| write-csv                      | string  | Write data we're ingesting to a CSV file with the given name. |

## Header Descriptions

The [CSV](/docs/community/com-ingest/com-ingest-flags-csv) and [SQL](/docs/community/com-ingest/com-ingest-flags-sql) ingesters use the same syntax for describing how you want the fields in your source data to be ingested into FeatureBase. The basic structure is

`field_name__FieldType_Arg1_Arg2`

That is, you name each field, and then you specify the field's type (separated by two underscores), and then any arguments that the field type takes. For example:

`age__Int_0_120`

declares that field is named 'age', is expected to be an integer, and be between 0 and 120. In general, all arguments are optional, but they are also positional, so if you want to specify a maximum value for the int field, you must first specify a minimum value.

Here is the full list of field types along with their arguments:

### String
Example:
`state__String_T_YMD`

String is for arbitrary string data. The data will be stored in a 'set', 'mutex', or 'time' type field depending on the arguments given, but will always use key translation.

Argument 1 — Mutex: Either 'T' or 'F'. Specifies whether a "mutex" type field should be used  in FeatureBase. If 'T', a "mutex" field is used, and any particular record may only have a single value. If 'F', a "set" field is used, and a particular record may have multiple values for this field.

Argument 2 — Time Quantum: If this argument is provided, the field will be a "time" field rather than "set" or "mutex". "time" fields work similarly to "set" fields but each value can have a coarse grained timestamp associated with it. The granularity is controlled by this argument and can be anything from yearly down to hourly. See the [FeatureBase Data Model docs](/docs/concepts/overview-data-modeling) for more information about time fields.

### ID
Example:
`class__ID_T_YMD`

ID has the same arguments and works the same way as String, but doesn't use key translation. The values must be parseable into unsigned integers.

### Bool
Example:
`is_alive__Bool`

Bool will either be stored in a "bool" field, or into packed bools fields if that option is enabled and available on the ingester in use. In the case of packed bools, the name of the field becomes the value at which a bit will be set in the "bools" and "bools-exists" fields. The ingester attempts to coerce incoming data to `true` or `false`. Any integer value will be interpreted as `false` if 0 and `true` otherwise. The strings (in any upper/lower case combination) '0', 'f', 'false',  and the empty string will be interpreted as `false`, and `true` otherwise.

No arguments.

### Int
Example:
`age__Int_1_120`

Int will be stored in an "int" field in FeatureBase. A string value will be attempted to be parsed as an integer.

Argument 1 — Min: The lower bound on the field's values.

Argument 2 — Max: The upper bound on the field's values.

### Decimal
Example:
`cost__Decimal_2`

Decimal will be stored in a "decimal" field in FeatureBase. Strings will be attempted to be parsed as floats. Note that values will be truncated to the appropriate decimal place, not rounded, so you should round the value as needed before ingesting.

Argument 1 — Scale: The "scale" for the decimal field. Essentially the number of digits after the decimal point that you wish to store. In the example we have a cost, so we use a scale of '2' to track cost in dollars down to the cent.

### ForeignKey
Example:
`user_id__ForeignKey_users`

ForeignKey is used when values of a field refer to records in another table. The foreign table may be using keys or not, and if it is using keys, the foreign key values can be strings, otherwise they should be unsigned integers. Under the hood, this uses an int field, so each record may only have a single value (as opposed to a 'set' field where each record may have many values associated).

Argument 1 — The name of the foreign table.

### DateInt
Example:
`modified_day__DateInt_2006-01-02_1970-01-01_C_1d`

DateInt stores a datetime in an "int" field in FeatureBase. The dates are converted to ints according to the arguments. The integer value stored represents the number of units of time since some 'epoch' time.

Argument 1 - Layout: gives an example format for how the date value should be parsed. The default value for layout is '2006-01-02T15:04:05Z07:00'. Write this same datetime in whatever format your values have. For example, for a traditional MM/DD/YYYY representation, you would use '01/02/2006' for layout.

Argument 2 - Epoch: The 'zero' timestamp from which the int values are calculated. Written using the same layout as specified by argument 1.

Argument 3 - Unit: The time unit to store. If the unit is a day, then a value of 17 means 17 days since the epoch. Unit may be `"d"`, `"h"`, `"m"`, `"s"`, `"ms"`, `"us"`, `"ns"` or `"c"` for custom. If `"c"` is used, argument 4 specifies the customer duration.

Argument 4 - Custom Unit: A 'duration' value which specifies a custom time unit. Accepts values like "6h" for 6 hours, "1m30s" for 1 minute and 30 seconds. Valid time units are "ns", "us", "ms", "s", "m", "h".


### RecordTime
Example:
`time__RecordTime_2006-01-02_2018-03-04_d`

RecordTime is for a timestamp in a record which applies to the whole record. Any field in the record which will be stored as a 'time' field in FeatureBase will have this time associated with its value. Note that using this field type alone will not explicitly create a field in FeatureBase.

Argument 1: Layout: gives an example format for how the date value should be parsed. The default value for layout is '2006-01-02T15:04:05Z07:00'. Write this same datetime in whatever format your values have. For example, for a traditional MM/DD/YYYY representation, you would use '01/02/2006' for layout.

Argument 2 - Epoch: The 'zero' timestamp from which the int values are calculated. Written using the same layout as specified by argument 1.

Argument 3 - Unit: the incoming value will be interpreted as a duration with this Unit, starting at the configured Epoch. Can be `"d"`, `"h"`, `"m"`, `"s"`, `"ms"`, `"us"`, `"ns"`, for day, hour, minute, second, millisecond, microsecond, or nanosecond respectively. Defaults to `"s"`.


### Timestamp
Example:
`purchase_date__Timestamp_s_2006-01-02T15:04:05Z07:00_2018-03-04T15:04:05Z_ms`

Timestamp fields are implemented internally the same way as integer fields and store the number of time units (e.g. seconds) since an epoch. By default, the time unit is in seconds and the epoch is midnight, January 1, 1970 UTC. Adjusting the granularity and epoch can reduce the storage requirements and computation time when processing records.

Argument 1 - Granularity: the resolution at which the incoming values will be stored. Allowed values are `s`, `ms`, `us`, `ns`. Defaults to `"s"`.

Argument 2 - Layout: gives an example format for how the date value should be parsed. The default value is RFC3339Nano: '2006-01-02T15:04:05.999999999Z07:00'. Write this same datetime in whatever format your values have. Refer to [Go's format docs](https://golang.org/pkg/time/#pkg-constants).

Argument 3 - Epoch: The 'zero' timestamp from which the int values are calculated. Written using the same layout as specified by argument 2.

Argument 4 - Unit: the incoming value will be interpreted as a duration with this Unit, starting at the configured Epoch. Can be `"d"`, `"h"`, `"m"`, `"s"`, `"ms"`, `"us"`, `"ns"`, for day, hour, minute, second, millisecond, microsecond, or nanosecond respectively. Defaults to `"s"`.


### StringArray
Example:
`tags__StringArray_`

StringArray is similar to the `String` type, but expects multiple values in a single record. Each value will be set in the corresponding row of the FeatureBase 'set' or 'time' field. To retrieve Array values from a CSV file, the data within the CSV column should be a comma separated list of array values enclosed in double quotes, e.g. `"Georgia,Texas,Oregon"`.

Argument 1 — Time Quantum: If this argument is provided, the field will be a "time" field rather than "set". "time" fields work similarly to "set" fields but each value can have a coarse grained timestamp associated with it. The granularity is controlled by this argument and can be anything from yearly down to hourly. See the [FeatureBase Data Model docs](/docs/concepts/overview-data-modeling) for more information about time fields.

### IDArray
Example:
`links__IDArray_`

IDArray is similar to the `ID` type, but expects multiple values in a single record. Each value will be set in the corresponding row of the FeatureBase 'set' or 'time'  field. To retrieve Array values from a CSV file, the data within the CSV column should be a comma separated list of values enclosed in double quotes, e.g. `"10,23,18"`.

Argument 1 — Time Quantum: If this argument is provided, the field will be a "time" field rather than "set". "time" fields work similarly to "set" fields but each value can have a coarse grained timestamp associated with it. The granularity is controlled by this argument and can be anything from yearly down to hourly. See the [FeatureBase Data Model docs](/docs/concepts/overview-data-modeling) for more information about time fields.

### Ignore
Example:
`uuid__Ignore`

Ignore the value in this field. If you have values you don't want to ingest, but it is inconvenient to remove them ahead of time, you can use the Ignore field to explicitly ignore them.
