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
| 1,048,576 | FeatureBase Community CSV ingest flag | [CSV ingest flags](/docs/community/com-ingest/com-ref-ingest-csv) |
| 

## A

| Term | Context | Further information |
|---|---|---|---|
| Anti-entropy |   |  |
| Authentication | FeatureBase Cloud |  |
| Authentication | FeatureBase Community | [Community authentication](/docs/community/com-config-auth/com-config-auth-home) |

## B

| Term | Context | Further information |
|---|---|---|
| Batch (ingest) | import data in bulk | [BULK INSERT statement](/docs/sql-guide/statements/statement-insert-bulk)
| Bitmap<br/>Bitmap Index (BMI)<br/>Bit Sliced Indexing (BSI) | FeatureBase database table rows | [Roaring Bitmap](https://roaringbitmap.org/){:target="_blank"} |

## C

| Term | Context | Further information |
|---|---|---|
| Cluster | FeatureBase Community |   |

## D

| Term | Context | Further information |
|---|---|---|
| Database | FeatureBase database | [Manage Cloud databases](/docs/cloud/cloud-databases/cloud-db-manage)<br/> COMMUNITY DB TO COME |
| Data types | Table columns | [Data types](/docs/sql-guide/data-types/data-types-home) |

XX RESEARCH
| Data source | A data source is the source of data imported (ingested) into FeatureBase via different methods including CSV, HTTP and Kafka. |

## F

| Term | Context | Further information |
|---|---|---|
| Field |  |  |
| Fragment |  |  |
| Fact (table) |  |  |

## G

| Term | Context | Further information |
|---|---|---|

## H

| Term | Context | Further information |
|---|---|---|

## I

| Term | Context | Further information |
|---|---|---|
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
| Min<br/>Max | `int` constraints | [INT data type](/docs/sql-guide/data-types/data-type-int) |
| molecula-consumer-[csv | sql | kafka] | Community ingest | [Manage community ingest](/docs/community/com-ingest/com-ingest-home) |
| Mutex | String Data type | [String data types](/docs/sql-guide/data-types/data-types-home) |

CHECK IF STILL EXISTS
| MaxShard | See [Shard MaxShard reference](/fb-db-ref/shard-maxshard-ref.md) |

## N

| Term | Context | Further information |
|---|---|---|

| Node | FeatureBase Community Cluster | [FeatureBase Community Cluster]() |

## O

| Term | Context | Further information |
|---|---|---|
| Organization | FeatureBase Cloud | [FeatureBase Organization](/docs/cloud/cloud-org/cloud-org-manage) |

## P

| Term | Context | Further information |
|---|---|---|
| Pilosa | Former name of FeatureBase | [Pilosa + Molecula = FeatureBase blog post](https://www.featurebase.com/blog/pilosa-molecula-featurebase-a-story-of-evolution) |


DOES THIS STILL EXIST?

| [Protobuf](https://developers.google.com/protocol-buffers/) | Protocol Buffers is a binary serialization format which FeatureBase uses for internal messages, and can be used by clients as an alternative to JSON. |

## R

| Term | Context | Further information |
|---|---|---|
| Record<br/>Row | Database table row | [Manage cloud tables](/docs/cloud/cloud-tables/cloud-table-manage)<br/>[Manage community tables]() |
| Replica | FeatureBase Community `cluster.replicas` | [FeatureBase Cluster]() |
| Roaring Bitmap | FeatureBase database | [roaringbitmap.org](https://roaringbitmap.org/){:target="_blank"} |


| Record | FeatureBase uses "Record" to represent the traditional concept of a database row. |
| Replica | See [Shard Replica reference](/fb-db/shard-replica-ref.md)
| Roaring Bitmap | See See [FeatureBase bitmap/row reference](/fb-db-ref/fb-bitmap-row-ref.md) |
| Row | See [FeatureBase bitmap/row reference](/fb-db-ref/fb-bitmap-row-ref.md) |
| Row (BSI) | See [PQL Row bsi](/pql/pql-row-bsi-ref.md) |
| Row (Ranged) | See [PQL Row ranged](/pql/pql-row-ranged-ref.md) |
| Row (Timestamp) | See [PQL Row bsi](/pql/pql-row-bsi-ref.md) |
| Rows | See [PQL Row bsi](/pql/pql-rows-ref.md) |

## S

| Term | Context | Further information |
|---|---|---|

| Shard | Records are sharded on a preset width. Shards are operated on in parallel and are evenly distributed across the cluster via a consistent hash. |
| ShardWidth | This is the number of records in a shard. ShardWidth defaults to 2^20 or about one million. It can be modified, but only at compile time, and before ingesting any data. |
| Store | A PQL query that saves the bitmap result of a query to the given row in the given field. |
| Sum | A PQL query that returns the sum of integers stored in an integer field. |

## T

| Term | Context | Further information |
|---|---|---|
| Time Quantum | IDSET and STRINGSET constraint | [IDSET data type](/docs/sql-guide/data-types/data-type-idset)  <br/>[STRINGSET data type](/docs/sql-guide/data-types/data-type-stringset) |
| Timestamp | Data type | [Timestamp data type](/docs/sql-guide/data-types/data-type-timestamp) |
| TTL (Time To Live) |  IDSET and STRINGSET constraint | [IDSET data type](/docs/sql-guide/data-types/data-type-idset)  <br/>[STRINGSET data type](/docs/sql-guide/data-types/data-type-stringset) |
| TOML | FeatureBase Community configuration file |  |
| TopN |  |  |

## U

| Term | Context | Further information |
|---|---|---|


## V

| Term | Context | Further information |
|---|---|---|

| View | See [FeatureBase Field Views reference](/fb-db-ref/fb-field-views-ref.md) |

## W - X - Y - Z

| Term | Context | Further information |
|---|---|---|
