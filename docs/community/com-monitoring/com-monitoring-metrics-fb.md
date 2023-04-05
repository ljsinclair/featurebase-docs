---
title: FeatureBase Metrics
layout: default
parent: Community monitoring
grand_parent: Community
---

# FeatureBase Metrics reference

FeatureBase metrics are labelled according to a key-value format which are used with multiple metrics including:

| FeatureBase metric | Naming convention |
|---|---|
| FeatureBase index | `index:<indexname>` |
| FeatureBase field | `field:<fieldname>` |
| FeatureBase node ID | `node_id:<nodeID>` |

## Before you begin

* {% include /com-install/com-install-before-begin.md %}
* [Manage monitoring](/docs/community/com-monitoring/com-monitoring-home)

## Cache metrics

| Metric name | Description |
|---|---|
| `featurebase_recalculate_cache_total` | Count of cache recalculations |
| `featurebase_invalidate_cache_total`| Count of cache invalidations|
| `featurebase_invalidate_cache_skipped_total`| Count of skipped cache invalidations |
| `featurebase_dirty_cache_total` | Count of dirty cache |
| `featurebase_rank_cache_length` | Gauge of cache length |
| `featurebase_cache_threshold_reached_total` | Count of times cache reaches threshold and trimming is required |

## Cluster metrics

{: .note}
{% include /concepts/concept-anti-entropy.md %}

| Metric name | Description |
|---|---|
| `[featurebase]_antientropy_total` | Count of times the anti-entropy process runs |
| `[featurebase]_antientropy_duration_seconds`| Histogram of duration of the anti-entropy process |

* [Learn how to setup a FeatureBase Community cluster](/docs/community/com-config/old-resize-cluster)

## Field metrics

| Metric name | Description |
|---|---|
| `[featurebase]_create_field_total`| count of successful field creations |
| `[featurebase]_delete_field_total`| count of successful field deletions |
| `[featurebase]_sync_field_duration_seconds` | timing histogram of the field sync process |

## Import/Ingest metrics

| `[featurebase]_importing_total` | count of imported set bits, before importing |
| `[featurebase]_imported_total`| count of imported set bits, after successfully importing (number that actually changed) |
| `[featurebase]_clearing_total`| count of imported clear bits, before importing |
| `[featurebase]_cleared_total` | count of imported clear bits, after successfully importing (number that actually changed) |

## Index metrics

| Metric Name | Description |
| - | - |
| `[featurebase]_create_index_total`| count of successful index creations |
| `[featurebase]_delete_index_total`| count of successful index deletions |
| `[featurebase]_sync_index_duration_seconds` | timing histogram of the index sync process |

## Query metrics

metrics are generated for counts of individual query calls. These are identified by the `query` prefix, for example `query_topn_total`. For PQL calls, these include the following queries: `Sum`, `Min`, `Max`, `MinRow`, `MaxRow`, `Count`, `TopN`, `Rows`, `GroupBy`. Note that the query name is represented as lower-case in the metric name. SQL calls may also affect these metrics, depending on SQL->PQL mapping of the particular query.


| Metric name | Description |
|---|---|
| `[featurebase]_query_row_total` | count of row queries |
| `[featurebase]_query_row_bsi_total` | count of row queries that operate on a BSI (integer) field |
| `[featurebase]_set_bit_total` | count of set bits, set by a query (as opposed to an import) |
| `[featurebase]_clear_bit_total` | count of clear bits, set by a query (as opposed to an import) |


## Request metrics

| Metric name | Description |
|---|---|
| `[featurebase]_http_request_duration_seconds` | timing histogram of all http requests. Labels: where, <br/>- `where` - a value of `internal` indicates an in-cluster request, `external` indicates a request from outside the cluster<br/> - `path` - the path used to make a request. For example, `/index/<index>/query` for an HTTP PQL query request.<br/> - `useragent` - the user agent string used to make a request. For example, `curl/7.54.0`.<br/> - `method` - the method used to make a request. For example, `POST`.<br/> - `slow` - `true` or `false` indicates a "slow query" based on the `long-query-time` configuration option for FeatureBase |
| `[featurebase]_grpc_request_pql_unary_query_duration_seconds` | timing histogram of the query processing part of unary GRPC requests |
| `[featurebase]_grpc_request_pql_unary_format_duration_seconds`| timing histogram of the result formatting part of unary GRPC requests |
| `[featurebase]_grpc_request_pql_stream_query_duration_seconds`| timing histogram of the query processing part of streaming GRPC requests |
| `[featurebase]_grpc_request_pql_stream_format_duration_seconds` | timing histogram of the result formatting part of streaming GRPC requests |

## Shard metrics

| Metric name | Description |
|---|---|
| `[featurebase]_delete_available_shard_total`| count of successful shard deletions |
| `[featurebase]_maximum_shard` | Gauge of the maximum shard in the index. | For indexes which use `keys: true`, expect to see this around a multiple of 256<br/>due to how keys are partitioned around shards. |

## Other metrics

| Metric name | Description | Additional information |
|---|---|---|
| `[featurebase]_snapshot_duration_seconds` | timing histogram of the snapshot process |  |
| `[featurebase]_block_repair_total`| count | (labels: primary={true,false}) |



<!-- OLD as future.rename has been depreciated
where `[featurebase]` is either `featurebase` if the [`--future.rename` configuration flag](/docs/community/old-versions/old-featurebase-rename) is set, or `pilosa`.-->
