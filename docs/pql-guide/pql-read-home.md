---
title: PQL Read
layout: default
parent: PQL guide
has_children: true
nav_order: 1
has_toc: false
---





## Read operations



Read operations can be further grouped into several types. All of these types are summarized below.

### Row Calls

Row calls return an object representing a set of column keys, contained in a single row. Row calls may be used as input arguments to other queries.

| PQL | Further information |
|---|---|
| [PQL ALL()](/docs/pql-guide/pql-read-all) |
|

Row calls include
- Row selection
  - [All()](/pql-guide/read/all){:target="_blank"}
  - [ConstRow()](/pql-guide/read/constrow){:target="_blank"} provides a "literal" bitmap value -- i.e. it returns the record IDs or record keys specified by the user.
  - [Row()](/pql-guide/read/row){:target="_blank"} selects from a single set row, by row key -- i.e. it returns the record IDs or record keys that have a specified value in a specified field.
  - [Limit()](/pql-guide/read/limit){:target="_blank"} is also a row call by return type. It wraps other row calls to select a subset of results, in a pagination sense.
- Boolean operations
  - [Difference()](/pql-guide/read/difference){:target="_blank"} computes the set difference between its first argument and all subsequent arguments (all row calls).
  - [Intersect()](/pql-guide/read/intersect){:target="_blank"} computes the set intersection across its two or more [row call](#row-calls){:target="_blank"} arguments.
  - [Not()](/pql-guide/read/not){:target="_blank"} computes the complement of the single row call argument, relative to the *universal set* for the index -- i.e. it returns the difference between `All()` and some other [row call](#row-calls){:target="_blank"}.
  - [Union()](/pql-guide/read/union){:target="_blank"} computes the set union across its one or more [row call](#row-calls){:target="_blank"} arguments.
  - [UnionRows()](/pql-guide/read/unionrows){:target="_blank"} computes the set union across many rows. Rather than accepting several row call arguments, `UnionRows()` accepts any number of `Rows` arguments.
  - [Xor()](/pql-guide/read/xor){:target="_blank"} computes the exclusive set difference between its first argument and all subsequent arguments (all [row calls](#row-calls){:target="_blank"}).

[Distinct](/pql-guide/read/distinct){:target="_blank"} is a special row-like call, in that it can be used in the same context that other row calls can be used, despite a slight variation in its output type.

### Rows Calls

Rows calls return an object representing a set of row keys, contained in a single column. Rows calls may be used as input arguments to other queries.

Rows calls include:
- [Rows](/pql-guide/read/rows){:target="_blank"} returns a list of row IDs in the given field which have at least one bit set -- i.e. it returns a list of value in a field for all values associated with a record.

### Membership Calls

Membership calls return a boolean value indicating set membership.

Membership calls include:
- [IncludesColumn](/pql-guide/read/includescolumn){:target="_blank"} indicates whether a given record ID or record key is present in a given [row call](#row-calls){:target="_blank"}.

### Count Calls

Count calls return counts of the number of elements in *groups of sets*. Count calls are often the top-level call in a query.

Count calls include:
- [Count](/pql-guide/read/count){:target="_blank"} computes the scalar count of elements contained in its single [row call](#row-calls) argument.
- [GroupBy](/pql-guide/read/groupby){:target="_blank"} computes counts of the intersection of every combination of its [rows call](#rows-calls) arguments. GroupBy provides much of the basic grouping functionality that is available in a relational database.
- [TopK](/pql-guide/read/topk){:target="_blank"} computes the count of the top `K` rows in a field, with fewer caveats.
- [TopN](/pql-guide/read/topn){:target="_blank"} computes the count of the top `N` rows in a field, with some caveats.

### Aggregation Calls
Aggregation calls perform other aggregation operations on *individual sets*.

Aggregation calls include:
- [Max](/pql-guide/read/max){:target="_blank"} computes the maximum integer value or timestamp value in a field, from a single [row call](#row-calls){:target="_blank"} argument.
- [Min](/pql-guide/read/min){:target="_blank"} computes the minimum integer value or timestamp value in a field, from a single [row call](#row-calls){:target="_blank"} argument.
- [Percentile](/pql-guide/read/percentile){:target="_blank"} computes the percentile of integer values in a field, from a single [row call](#row-calls){:target="_blank"} argument.
- [Sum](/pql-guide/read/sum){:target="_blank"} computes the sum of integer values in a field, from a single [row call](#row-calls){:target="_blank"} argument.

### Exploratory Calls

Exploratory calls are used to drill down into a data set.

- [Extract](/pql-guide/read/extract){:target="_blank"} is analogous to a general `select` query in a relational database, returning a subset of both rows and columns.

### DataFrame Calls
- [Apply](/pql-guide/read/apply){:target="_blank"} executes Ivy code against data stored using the `float64` and / or `int64` data type.
- [Arrow](/pql-guide/read/arrow){:target="_blank"} is analogous to `Extract()` and a `SELECT <columns> FROM <table> WHERE <condition>` query in SQL. Executes on data stored using the `float64` and / or `int64` data type.
