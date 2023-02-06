---
title: Glossary
layout: default
parent: Concepts
has_children: false
nav_order: 10
---

# FeatureBase Glossary of terms
{: .no_toc }

{% include /page-toc.md %}

## 0-9

| Term | Context | Further information |
|---|---|---|---|
| 1,048,576 | FeatureBase Community `batch-size` ingest flag | [CSV ingest flags](/docs/community/com-ingest/com-ref-ingest-csv) |

## A

| Term | Context | Further information |
|---|---|---|---|
| Anti-entropy | FeatureBase Community cluster | A periodic process that compares each shard and its replicas across the cluster to repair inconsistencies. |
| Authentication | FeatureBase Cloud | [Manage cloud users](/docs/cloud/cloud-users/cloud-users-manage) |
| Authentication | FeatureBase Community | [Community authentication](/docs/community/com-config-auth/com-config-auth-home) |

## B

| Term | Context | Further information |
|---|---|---|
| Batch (ingest) | Data import to FeatureBase | [BULK INSERT statement](/docs/sql-guide/statements/statement-insert-bulk) |
| Bitmap<br/>Bitmap Index (BMI)<br/>Roaring B-Tree format (RBT) | FeatureBase database table rows | FeatureBase uses the [Roaring Bitmap](https://roaringbitmap.org/){:target="_blank"} format to store data. |
| Bit Sliced Indexing (BSI) | Multi-bit integer and timestamp data types used for Range, Min, Max and Sum queries | * [INT data type](/data/sql-guide/data-types/data-type-int)<br/>* [TIMESTAMP data type](/data/sql-guide/data-types/data-type-timestamp)<br/>* [MIN query](/docs/pql-guide/pql-read-min)<br/>* [MAX query](/docs/pql-guide/pql-read-max)<br/>* [SUM query](/docs/pql-guide/pql-read-sum) |

## C

| Term | Context | Further information |
|---|---|---|
| Cluster | FeatureBase Community | A Cluster configuration of [FeatureBase nodes](#n) where data is evenly distributed and any node can respond to queries. Also defines how data is replicated and inter-node communication. |

## D

| Term | Context | Further information |
|---|---|---|
| Database | FeatureBase database | Dedicated resources which contain tables and data. [Manage Cloud databases](/docs/cloud/cloud-databases/cloud-db-manage) |
| Data source | Source of data imported to FeatureBase | FeatureBase imports data from external data sources via HTTPS, Kafka, SQL or CSV ingest processing |
| Data types | Table columns | [Data types and constraints](/docs/sql-guide/data-types/data-types-home) |

## F

| Term | Context | Further information |
|---|---|---|
| Field | Table rows | Field data types to group rows into different categories:<br/>* [`bool`](/docs/sql-guide/data-types/data-type-bool)<br/>* [`int`](/docs/sql-guide/data-types/data-type-int)<br/>* [`set`](/docs/pql-guide/pql-write-set)<br/>* [`time`]()<br/>* [`timestamp`](/docs/sql-guide/data-types/data-type-timestamp)<br/>* [Mutex]()|
| Fields, ranked | Table rows | Rows kept in sorted order within the field. |
| Fragment | FeatureBase Community Row fields and database shards | A fragment typically corresponds to a file on disk which represents an intersection of:<br/>* field and shard, or<br/>* field, shard and `time` data type `time quantum` constraint |

## G

| Term | Context | Further information |
|---|---|---|
| Group By | PQL Query | [PQL Group By Query](/docs/pql-guide/pql-read-groupby) |

## H

| Term | Context | Further information |
|---|---|---|

## I

| Term | Context | Further information |
|---|---|---|
| Index | FeatureBase tables | Denormalized top-level container roughly the same as an RDBMS table. |
| Ingest | Importing data to FeatureBase | [Manage community ingest](/docs/community/com-ingest/com-ingest-home) |

## J

| Term | Context | Further information |
|---|---|---|

## K

| Term | Context | Further information |
|---|---|---|

## L

| Term | Context | Further information |
|---|---|---|

## M

| Term | Context | Further information |
|---|---|---|
| MAX | PQL Read query | [PQL MAX Read query](/docs/pql-guide/pql-read-max) |
| MAX | SQL `int` constraint | [INT data type](/docs/sql-guide/data-types/data-type-int) |
| MAXSHARD<br/>`cluster.maxshard` parameter | FeatureBase Community Cluster flag | Zero-indexed shard allocation for current records, where `maxshard = 0` indicates 1 shard is allocated. |
| MIN | PQL Read query | [PQL MIN Read query](/docs/pql-guide/pql-read-min) |
| Min | SQL `int` constraint | [INT data type](/docs/sql-guide/data-types/data-type-int) |
| molecula-consumer-[csv | sql | kafka] | Community ingest | [Manage community ingest](/docs/community/com-ingest/com-ingest-home) |
| Mutex | String Data type | A FeatureBase field type similar to the Set type, in which only a single value can be set at any time. Conceptually similar to an enum type, but implemented on top of Set fields, with a performance cost from the single-value constraint. Not to be confused with the mutex synchronization primitive. |

## N

| Term | Context | Further information |
|---|---|---|
| Node | FeatureBase Community Cluster | An individual running instance of FeatureBase server which belongs to a cluster. |

## O

| Term | Context | Further information |
|---|---|---|
| Organization | FeatureBase Cloud | [FeatureBase Organization](/docs/cloud/cloud-org/cloud-org-manage) |

## P

| Term | Context | Further information |
|---|---|---|
| Pilosa | Former name of FeatureBase | [Pilosa + Molecula = FeatureBase blog post](https://www.featurebase.com/blog/pilosa-molecula-featurebase-a-story-of-evolution) |
| Pilosa Query Language (PQL) | Database queries | [PQL-Guide](/docs/pql-guide/pql-home) |
| Protobuf |  | Binary serialization format used for internal messages which can be used by clients as an alternative to JSON.  [Protobuf](https://developers.google.com/protocol-buffers/) |

## R

| Term | Context | Further information |
|---|---|---|
| Record<br/>Row | Database table row | Equivalent to RDBMS table row. FeatureBase uses "Record" to avoid confusion |
| Replica<br/>`cluster.replicas` parameter | FeatureBase Community Clusters | Replica of shard within a cluster. `cluster.replicas` configuration parameter determines the number of shard replicas within a cluster where `replicas=1` indicates no copies have been made. |
| Roaring Bitmap | FeatureBase database | [roaringbitmap.org](https://roaringbitmap.org/){:target="_blank"} |
| Row |  | Rows are the fundamental vertical data axis within FeatureBase. Rows are namespaced by field so the same row ID in a different field refers to a different row. |
| Row `_id` |  |  |
| Row (Ranged) | PQL ROW (Ranged) query | [PQL Row read query](/docs/pql-guide/pql-read-row) |
| Row (Timestamp) | PQL Row (Timestamp) query | [PQL Row read query](/docs/pql-guide/pql-read-row) |
| Rows | PQL ROWS query | [PQL Rows read query](/docs/pql-guide/pql-read-rows) |

## S

| Term | Context | Further information |
|---|---|---|
| Shard | FeatureBase Community Cluster | Records are sharded on a preset width. Shards are operated on in parallel and are evenly distributed across the cluster via a consistent hash. |
| ShardWidth<br/>`cluster.shardwidth` parameter | FeatureBase Community Cluster | This is the number of records in a shard. ShardWidth defaults to 2^20 or about one million. It can be modified, but only at compile time, and before ingesting any data. |
| STORE | PQL STORE query | [PQL STORE write query](/docs/pql-guide/pql-write-store) |
| SUM | PQL SUM query | [PQL SUM read query](/docs/pql-guide/pql-read-sum) |

## T

| Term | Context | Further information |
|---|---|---|
| Time Quantum | SQL IDSET and STRINGSET constraint | [IDSET data type](/docs/sql-guide/data-types/data-type-idset)  <br/>[STRINGSET data type](/docs/sql-guide/data-types/data-type-stringset) |
| Timestamp | Data type | [Timestamp data type](/docs/sql-guide/data-types/data-type-timestamp) |
| TTL (Time To Live) |  IDSET and STRINGSET constraint | [IDSET data type](/docs/sql-guide/data-types/data-type-idset)  <br/>[STRINGSET data type](/docs/sql-guide/data-types/data-type-stringset) |
| TOML | FeatureBase Community configuration files | [Tom's Obvious Minimal Language (TOML)](https://github.com/toml-lang/toml) |
| TopN | PQL TopN query | [PQL TOPN read query](/docs/pql-guide/pql-read-topn) |

## U

| Term | Context | Further information |
|---|---|---|


## V

| Term | Context | Further information |
|---|---|---|
| View | FeatureBase fields | Internally managed method to separate data layouts within a field. Not exposed by the API |
| View (Primary) | FeatureBase fields | Standard view that represents typical base data |
| View (Time-based) | FeatureBase fields | Automatically generated view for time quantum fields |

## W - X - Y - Z

| Term | Context | Further information |
|---|---|---|
