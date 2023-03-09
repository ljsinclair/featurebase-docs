---
title: PQL guide
layout: default
has_children: true
nav_order: 5
has_toc: false
---

# FeatureBase PQL guide
{: .no_toc }

Pilosa Query Language (PQL) is FeatureBase's native query language.

{% include page-toc.md %}

## About PQL

Like SQL, PQL is a declarative, set-based language. Unlike SQL, PQL expressions are built by composing function calls, using the familiar parentheses call syntax. With this function-compositional syntax, PQL functions operate on bitmaps as the atomic elements of the data store, expressing boolean operations of arbitrary complexity. PQL also provides a number of functions outside of this paradigm, which implement common data tasks like aggregation.

## PQL calls

Many PQL calls return or accept objects representing rows ([row calls](/docs/pql-guide/pql-read-home#row-calls{:target="_blank"}) or columns ([rows calls](#rows-calls){:target="_blank"}), and understanding these types is key to composing the various types of PQL call to build a query.

For example, the [row call](/docs/pql-guide/pql-read-home#row-calls) is the basic query type for reading bitmaps and performing boolean operations on them. The input type signatures of row calls vary, but they always return an object representing a set contained in a single row (i.e. a *computed row*, not necessarily a *stored row*), which can be passed as an argument to other queries.

For a simple example, consider this diagram:

![PQL diagram](/assets/images/pql-guide/pql-diagram.png)

This is a PQL query on a table of users which includes fields for gender, age, location, and interests. It asks a question involving a moderately complex boolean combination of these fields. Note that each annotated component within the `Count` is a separate [row call](/docs/pql-guide/pql-read-home#row-calls), representing a set of users; each of these could be a standalone query, or passed to a `Count` call, for example. `Count` accepts a single row call, regardless of its structure, and returns a scalar value.

While other calls may accept different types, this composition of function calls is an important concept for PQL usage.

###  A Note About Terminology

For historical reasons, FeatureBase's concepts of "row" and "column" are not conventional, and may be confusing.

In PQL:

- An *index* is a single "universe" of data, with a shared column space, and a group of related fields. The term *table* may be used interchangeably, as well as the deprecated term *VDS* (Virtual Data Source).
- A *column* represents an instance of the entity of concern for a given table, such as a user or an event. Columns are common to all fields and rows within an index. Because this concept might be referred to as a row in other data stores, to reduce ambiguity, a column may be referred to as a *record*.
- A *row* represents a single, binary characteristic that may be associated with any record. A row maintains a [set](https://en.wikipedia.org/wiki/Set_(mathematics)){:target="_blank"} of bits — a bitmap — indicating which records have a bit [Set](/docs/pql-guide/pql-write-set){:target="_blank"} for its attribute. To reduce ambiguity, a row may be referred to as a field value. Note that this is conceptually different from the use of "column" in other data stores, in that each row stores membership information per value. While this is mainly an implementation detail in normal FeatureBase usage, it can be helpful in understanding the underlying data model.
- A *field* is a grouping of rows, for example, to combine several single rows into a non-boolean categorical value, or an integer value. From a user's perspective, this term aligns well with usage by other data stores.

The names of the *Row Calls* and *Rows Calls* types, as well as calls like `Row` and `Rows` are all based on these definitions.

## Subexpressions

Because of the nested structure of the language, subexpressions in a query are often meaningful queries on their own, and terms like "query", "call", "keyword", and "function" may be used somewhat interchangeably. Here, *query* is used to refer to a conceptually complete, runnable query, and *call* refers to the individual named PQL functions from which queries are composed.

## PQL top level calls

In some contexts, particularly FeatureBase's `/index/{index}/query` HTTP endpoint, a PQL *query request* may consist of any number of disjoint *queries* (also known as top-level calls), optionally separated by whitespace. These queries are executed serially, and their results are returned in order.

## Query Types

PQL queries can be broadly grouped into:

| Grouping | Description | Further information |
|---|---|---|
| Read operations | Comprise the majority of PQL keywords, and often the majority of PQL usage. | [PQL Read operations](/docs/pql-guide/pql-read-home) |
| Write operations | Write operations can be used instead of command-line ingestion tools | [PQL Write operations](/docs/pql-guide/pql-write-home)<br/>[CLI ingest tools](/docs/community/com-ingest/com-ingest-manage) |
| Other operations | Modify the execution context and return types of the queries passed to it. | [PQL options](/docs/pql-guide/pql-options) |


<!--

## General Ingestion Rules

### Value Path Selection

The path option is an array of JSON object keys which are applied in order.
For example, `["a","b","c"]` would select `1` within `{"a":{"b":{"c":1}}}`.
This path must only consist of strings - array indexing is not supported. If a value is missing, the ingester will return an error. To override this behavior for non-primary key fields, use `allow-missing-fields`.

### Types

The available values for `type` are:

| `"type":`            | JSON Input Type                         | FeatureBase Field Type                       | Config Options                                   |
|----------------------|-----------------------------------------|----------------------------------------------|--------------------------------------------------|
| `"id"`               | `10`                                    | set/mutex/time                               | `"Mutex"`, `"Quantum"`, `"TTL"`, `"CacheConfig"` |
| `"ids"`              | `[1, 2, 3]`                             | set/time                                     | `"Quantum"`, `"TTL"`, `"CacheConfig"`            |
| `"string"`           | `"example"`                             | keyed set/mutex/time                         | `"Mutex"`, `"Quantum"`, `"TTL"`, `"CacheConfig"` |
| `"strings"`          | `["a", "b", "c"]`                       | keyed set/time                               | `"Quantum"`, `"TTL"`, `"CacheConfig"` |
| `"bool"`             | `true`/`false`                          | packed bool field (row in keyed set fields)  | None                                             |
| `"int"`              | `10`/`-12`/`"example"`                  | integer (possibly a foreign-index reference) | `"Min"`, `"Max"`, `"ForeignIndex"`               |
| `"decimal"`          | `10.9`/`"10.9"`                         | decimal                                      | `"Scale"`                                        |
| `"signedIntBoolKey"` | `10`/`-12`                              | same as id, except a negative value clears   | None                                             |
| `"recordTime"`       | `"2006-01-02T15:04:05Z07:00"`/`1273823` | applied to id(s)/string(s) (using "Quantum") | `"Layout"`, `"Epoch"` , `"Unit"`                  |
| `"dateInt"`          | `"2006-01-02T15:04:05Z07:00"`/`1273823` | integer timestamp relative to an epoch       | `"Layout"`, `"Epoch"`, `"Unit"`, `"CustomUnit"`  |
| `"timestamp"`        | `"2006-01-02T15:04:05Z07:00"`/`1273823` | integer(BSI) timestamp relative to an epoch  | `"Granularity"`, `"Layout"`, `"Epoch"`, `"Unit"` |


### Field Configuration Options

When all config options are left as default, the `"Config"` field may be omitted. Otherwise, the config options are:
* `"Mutex"`: if set to `true`, the data will be ingested into a mutex field instead of a set field
* `"Quantum"`: the time quantum selection (Any Combination of  time granularity `Y`,`M`,`D`,`H` that doesn't skip a grain e.g. `"YM"`/`"MDH"` but not `YD`) to use when ingesting into a time column using the time value from a `"recordTime"`
* `"CacheConfig"`: the configuration when using a `TopN` cache; does not affect time fields
* `"TTL"`: Time To Live duration for views specifies when views will deleted. Allowed time units are `h`, `m`, `s`, `ms`, `us`, `ns`. Time quantum is required in order to use TTL.
* `"Layout"`: the format in which to parse time strings (defaults to RFC3339) - specified in [Go's format](https://golang.org/pkg/time/#pkg-constants)
* `"Min"`: the minimum possible value for an acceptable integer (defaults to -2^63)
* `"Max"`: the maximum possible value for an acceptable integer (defaults to 2^63 - 1)
* `"ForeignIndex"`: the target index to reference columns of
* `"Scale"`: the number of digits of precision to store after the decimal point
* `"Epoch"`: Only set `Epoch` if the incoming data is a number (rather than a timestamp string). The incoming number will be interpreted as the number of `Unit` since `Epoch`. The value may specify a timezone, for example `"1980-11-30T14:20:28.000+07:00"`, or use zulu time (i.e. +00:00) `"1980-11-30T14:20:28.000Z"`. Defaults to the Unix epoch if not configured.  E.G. If the `Unit` is 's' and the `Epoch` is January 1, 2000 and the number is 86,400 then the number represents January 2, 2000.
* `"Unit"`: For a (`dateInt`) type field, `Unit` is the time unit in which to store a timestamp.  For the (`recordTime`, `timestamp`) type fields, only set `Unit` if the incoming data is a number (rather than a timestamp string). The incoming number will be interpreted as the number of `Unit` since `Epoch`. `Unit` Can be `"d"`, `"h"`, `"m"`, `"s"`, `"ms"`, `"us"`, `"ns"`, for day, hour, minute, second, millisecond, microsecond, nanosecond respectively or `"c"` for custom (using `"CustomUnit"` for `dateInt`). Defaults to `"s"`.  E.G. If the `Unit` is 's' and the `Epoch` is January 1, 2000 and the number is 86,400 then the number represents January 2, 2000.
* `"CustomUnit"`: a 'duration' value which specifies a custom time unit; accepts values like "6h" for 6 hours, "1m30s" for 1 minute and 30 seconds; valid units can be described using "ns", "us", "ms", "s", "m", or "h"
* `"Granularity"`: the resolution at which the incoming values will be stored. Allowed values are `s`, `ms`, `us`, `ns`. Defaults to `"s"`.

The `"CacheConfig"` option specifies the size and type of a [`TopN`](/docs/pql-guide/pql-read-topn) cache for a set or mutex field.
This "cache" is used for the `TopN` approximation.
The default setting is:
```json
{
    "CacheType": "ranked",
    "CacheSize": 50000,
}
```


-->
