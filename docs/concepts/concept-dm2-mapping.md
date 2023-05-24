---
title: Data Modeling - Mapping
layout: default
parent: Concepts
nav_order: 2
---

# Data Modeling - Part 2 - Mapping

Three mapping actions take place during data modeling:

* Mapping source to destination data types
* [HIGH LEVEL REASON FOR USING SET DATA TYPES]
* Determining data to use as a unique identifier for each row to be imported

## Mapping to FeatureBase data types

| Data type | Represented as | Support | Additional information |
|---|---|
| `BOOLEAN` |  |  |
| `DECIMAL` |  |  |
| `ID` |  |  |
| `IDSET` |  |  |
| `IDSETQ` |  |  |
| `INT` |  | Range queries |  |
| `STRING` |  |  |
| `STRINGSET` |  |  |
| `STRINGSETQ` |  |  |
| `TIMESTAMP` |  |  |


<!--ORIGINAL CONTENT FROM overview-data-modeling.md

### Numeric Types

FeatureBase has three ways to represent numeric data; sets, mutexes, and integer fields. Each of these field types uses a set of bitmaps under the hood where each bitmap represents a particular value for the field, and each position in a bitmap represents whether a record has that value. In a set field, each record can have any number of different values. Each value is logically independent. In general, sets are a good way to represent data where multiple traits or parameters are logically independent.  A mutex is like a set, but each record can only have one value at a time; setting one value will clear the others. Int fields represent arbitrary values within a range, using multiple bitmaps to store binary digits of the values. Like a mutex, an int field has only one value per record at any given time.

Even in the case where only one value is likely to be set for a given record, you may prefer set fields. If you always know the previous value, clearing that value directly will be more efficient than relying on the mutex logic to clear the other possible values. Integer fields support range queries, but any query will generally have to access all the bitmaps in the field since each one represents a binary digit. Set and mutex fields don't support range queries, but can query only the values they care about.


### Integer Field Implementation

In FeatureBase's current architecture, integer fields are implemented using bitplanes. The values in the field are decomposed into bits, and corresponding bits from integer field become bitmaps in the storage. So, one of the bitmaps represents the lowest-order bit (value 1) of every record's value. An integer field has existence and sign bits, and represents values around a given base value. Thus, the total number of rows used will be 2 + log<sub>2</sub>(N), where N is the distance from the base to the highest or lowest value. (The exact size might vary depending on how you set the field up; a range from 0 to 100,000 which never uses negative values has a sign bit which is never set, a range from -50,000 to +50,000 with an offset of 50,000 has the same range but needs one less row for data values.)

The following table gives approximate estimated storage density for about a million records, assuming every record has values. A "weighted" distribution implies one with a significant variance in distribution, such as power-law or zipfian distributions, where some rows are very populated and some lightly populated.

Storage requirements for data


|                         | Integer |             |               | Mutex |             |               |
| ---                     |     --- | ---         | ---           |   --- | ---         | ---           |
| **Range, Distribution** |    Rows | Storage/Row | Total Storage |  Rows | Storage/Row | Total Storage |
| 0-15, even              |       4 | 128KiB*     | 513KiB        |    16 | 128KiB      | 2040KiB       |
| 0-15, weighted          |       4 | 60-128KiB*  | 445KiB        |    16 | 4KiB-128KiB | 638KiB        |
| 0-63, even              |       6 | 128KiB*     | 769KiB        |    64 | 33KiB       | 2064KiB       |
| 0-63, weighted          |       6 | 14-128KiB   | 506KiB        |    64 | 0.5-128KiB  | 687KiB        |
| 0-1023, even            |      10 | 128KiB      | 1282KiB       |  1024 | 2KiB        | 2304KiB       |
| 0-1023, weighted        |      10 | 1-128KiB    | 536KiB        |  1024 | 0-128KiB    | 743KiB        |


[*] Existence bitmaps are 352 bytes, and sign bitmaps are 0, in this data set; the table only shows sizes for the value bitmaps. In sparser data, the existence and sign bitmaps might be non-trivial.

Integer fields with evenly distributed values will tend to have fairly high cardinality -- every value will probably set every bit in its range about half the time, so if you have values for most records, the individual bitmaps will tend to be fairly full, and will approach the maximum storage requirements, slightly over one bit per record per bitmap. With weighted values, the top bits may well have low enough cardinality to produce some space savings. The differences are much more significant with set/mutex type fields; most of the higher values in the 1024-value mutex field were empty (no file created on disk at all), and most of them were under 50 bytes.

### Timestamp Field Implementation

Timestamp fields are implemented internally the same way as integer fields and store the number of time units (e.g. seconds) since an epoch.
By default, the `timeUnit` is in seconds (`s`) and the epoch is midnight, January 1, 1970 UTC. Other `timeUnit` values are `ms`, `us`, `ns`.
Adjusting the `timeUnit` and epoch can limit the range of integer value and reduce the storage requirements and computation time when processing records.

The following table gives approximate estimated storage density for about a million records, assuming every record has values.
Storage requirements for timestamp data when using a "seconds" time unit

|                         | Integer |             |               |
| ---                     |     --- | ---         | ---           |
| **Range, Distribution** |    Rows | Storage/Row | Total Storage |
| 1 day                   |      17 | 128KiB*     | 2176KiB       |
| 1 week                  |      20 | 128KiB*     | 2560KiB       |
| 1 month                 |      22 | 128KiB*     | 2816KiB       |
| 1 year                  |      25 | 128KiB*     | 3200KiB       |
| 10 years                |      29 | 128KiB*     | 3712KiB       |


Bottom line: If you're storing timestamps at second granularity, you can expect it to use about 3.7MB per million records.
At millisecond granularity, it would use 4.9MB per million records.

-->

## [REASON SET DATATYPES USEFUL]

For example, `GROUP BY` and `UNION` clauses are typically used when querying data spread across multiple tables, columns and rows. As data increases these queries become less efficient

The FeatureBase `SET` and `SETQ` data types are used to reduce reliance on these clauses and streamline data.

## The `SET` datatype

{% include /concepts/concept-set-datatype-summary.md%}

## The `SETQ` datatype

{% include /concepts/concept-setq-datatype-summary.md%}

{% include /sql-guide/sql-timequantum-extra.md %}

{% include /sql-guide/sql-ttl-extra.md %}



## Determine the unique identifier


THEN rewrite content fropm concept_ingest_id (also rewritten in concepts-rewrites branch)


## Next step

* [Part 3 - Destination](/docs/concepts/concept-dm3-destination)
