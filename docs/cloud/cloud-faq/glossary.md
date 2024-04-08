---
title: Glossary
layout: default
parent: Frequently Asked Questions
has_children: false
nav_order: 1
---

# FeatureBase Glossary of terms
{: .no_toc }

{% include /page-toc.md %}

## A

| Term | Context | Additional information |
|---|---|---|---|
| Authentication | FeatureBase Cloud | [Manage cloud users](/docs/cloud/cloud-users/cloud-users-manage) |
| Authentication | FeatureBase Cloud | [Cloud authentication](/docs/cloud/cloud-authentication/cloud-auth-manage) |

## B

| Term | Context | Additional information |
|---|---|---|
| Batch (ingest) | Data import to FeatureBase | [BULK INSERT statement](/docs/sql-guide/statements/statement-insert-bulk) |
| Bitmap<br/>Bitmap Index (BMI)<br/>Roaring B-Tree format (RBT) | FeatureBase database table rows | [Learn about FeatureBase Bitmaps](/docs/cloud/cloud-faq/cloud-faq-bitmaps) |

## C

| Term | Context | Additional information |
|---|---|---|
| Concurrency | SQL/PQL Queries | Number of concurrent users running queries on data and how this may affect query latency |

## D

| Term | Context | Additional information |
|---|---|---|
| Database | FeatureBase database | Dedicated resources which contain tables and data. [Manage Cloud databases](/docs/cloud/cloud-databases/cloud-db-manage) |
| Data modeling | Data curation prior to ingestion | [Learn about Data modeling in FeatureBase](/docs/cloud/cloud-faq/cloud-faq-data-modeling) |
| Data source | External source of data which inclues CSV files, inline and other sources | [BULK INSERT](/docs/sql-guide/statements/statement-insert-bulk) |
| Data type | Table columns | [Data types and constraints](/docs/sql-guide/data-types/data-types-home) |

## F

| Term | Context | Additional information |
|---|---|---|
| Field | Table rows | Field data types to group rows into different categories:<br/>* [`bool`](/docs/sql-guide/data-types/data-type-bool)<br/>* [`int`](/docs/sql-guide/data-types/data-type-int)<br/>* [`timestamp`](/docs/sql-guide/data-types/data-type-timestamp)|
| Fields, ranked | Table rows | Rows kept in sorted order within the field. |
| Freshness | Data import/ingest | How much time elapses from when a data point is "sensed" by the system, until that data point will affect the results of a query. |

## G

| Term | Context | Additional information |
|---|---|---|
| Group By | SELECT statement | [SELECT statement](/docs/sql-guide/statements/statement-select) |

## I

| Term | Context | Additional information |
|---|---|---|
| `_id` | FeatureBase tables | [CREATE TABLE statement](/docs/sql-guide/statements/statement-table-create) |
| Index | FeatureBase tables | [Learn about FeatureBase bitmap indexes](/docs/cloud/cloud-faq/cloud-faq-bitmaps) |

## L

| Term | Context | Additional information |
|---|---|---|
| Latency | SQL/PQL Queries | How much time elapses between when a query is sent to a system and when the results return to the client. |

## M

| Term | Context | Additional information |
|---|---|---|
| MAX | SQL `INT` constraint | [INT data type](/docs/sql-guide/data-types/data-type-int) |
| Min | SQL `INT` constraint | [INT data type](/docs/sql-guide/data-types/data-type-int) |
| Mutex | String Data type | A FeatureBase field type similar to the Set type, in which only a single value can be set at any time. Conceptually similar to an enum type, but implemented on top of Set fields, with a performance cost from the single-value constraint. Not to be confused with the mutex synchronization primitive. |

## N

| Term | Context | Additional information |
|---|---|---|
| Normalizing | Data relationships | [Learn about data cardinality](/docs/cloud/cloud-faq/cloud-faq-data-cardinality) |

## O

| Term | Context | Additional information |
|---|---|---|
| Organization | FeatureBase Cloud account| [FeatureBase Organization](/docs/cloud/cloud-org/cloud-org-manage) |

## P

| Term | Context | Additional information |
|---|---|---|
| Protobuf |  | Binary serialization format used for internal messages which can be used by clients as an alternative to JSON.  [Protobuf](https://developers.google.com/protocol-buffers/) |

## Q

| Term | Context | Additional information |
|---|---|---|
| Query (SQL) | Structured Query Language | [SQL Guide](/docs/sql-guide/sql-guide-home) |

## R

| Term | Context | Additional information |
|---|---|---|
| Record<br/>Row | Database table row | Equivalent to RDBMS table row. FeatureBase uses "Record" to avoid confusion |
| Roaring Bitmap | FeatureBase database | [roaringbitmap.org](https://roaringbitmap.org/){:target="_blank"} |

## S

| Term | Context | Additional information |
|---|---|---|
| `SET` and `SETQ` | SQL data types | [Low cardinality data types](/docs/sql-guide/data-types/data-types-home/#low-cardinality-data-types) |
| Shard | Roaring Bitmap format | [Roaring Bitmap Format](/docs/cloud/cloud-faq/cloud-faq-roaring-bitmap-format) |

## T

| Term | Context | Additional information |
|---|---|---|
| Throughput | Data import/ingestion | Quantity of data that can be imported/ingested in a given time. May involve trade-off between Latency and Freshness |
| Time Quantum | `SETQ` constraints  | [IDSETQ data type](/docs/sql-guide/data-types/data-type-set-setq)  <br/>[STRINGSETQ data type](/docs/sql-guide/data-types/data-type-set-setq) |
| Timestamp | Data type | [Timestamp data type](/docs/sql-guide/data-types/data-type-timestamp) |
| TTL (Time To Live) | `SETQ` constraints  | [IDSETQ data type](/docs/sql-guide/data-types/data-type-set-setq)  <br/>[STRINGSETQ data type](/docs/sql-guide/data-types/data-type-set-setq) |

## V

| Term | Context | Additional information |
|---|---|---|
| View | FeatureBase fields | [CREATE VIEW statement](/docs/sql-guide/statements/statement-view-create) |
| View (Primary) | FeatureBase fields | Standard view that represents typical base data |
| View (Time-based) | FeatureBase fields | Automatically generated view for time quantum fields |
