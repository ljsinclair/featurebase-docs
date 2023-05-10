---
title: Community cluster configuration
layout: default
parent: Community
has_children: true
nav_order: 12
---
# How do I manage a FeatureBase Community cluster?

A FeatureBase Cluster is a distributed system that is maintained by `etcd` which runs on each node.

The system requires at least three nodes to maintain data consistency and fault tolerances. <!--from https://stackoverflowteams.com/c/molecula/questions/179-->

{% include page-toc.md %}

## Before you begin
{% include /com-install/com-install-before-begin.md %}

## How do I determine resources for my cluster?

You can use the following formula to estimate total cluster data storage required on combined nodes:

```math
(num_records/shard_width)*size_per_shard*2
```

### Example calculation

In this example, you have:

* 100,000,000 records
* data is broken down as follows:

| Field Type | Cardinality | Size (per shard) |
|---|---|---|
| Int |  20 Million | 3.1 MB |
| Int |  10 Billion | 4.3 MB |
| Int | 256 | 1 MB |
| Set/Bool/Mutex | 2 | 0.3 MB |
| Set/Bool/Mutex (sparse) | 500 | 2.1 MB |
| Set/Bool/Mutex (sparse) | 1000 | 2.2 MB |
| Set (dense) | 10 | 1.3 MB |
| Set (dense) | 100 | 13 MB |

Based on the following calculation, the combined data storage for the cluster would be approximately 5GB:

```math
(100,000,000/1,048,576)*(3.1+4.3+1+0.3+2.1+2.2+1.3+13)*2 = 5207MB
```



{: .note}
There is some additional overhead required for FeatureBase to operate properly so these figures are

{: .note}
The same data stored on a single node would require approximately 10GB of data due to duplicated overhead


When you split a cluster into multiple nodes, each node will have some duplication and overhead. So, if you were using 5GB on a single node, and switched to 5 nodes, you should budget for at least 2GB of storage on each node.

## How do I setup a cluster?

* [Learn how to setup a FeatureBase cluster](/docs/community/com-cluster/com-cluster-setup)

## How do I resize a cluster?

{% include /com-cluster/com-cluster-resize-summary.md %}

* [Learn about the process of resizing a FeatureBase cluster](/docs/community/com-cluster/com-cluster-resize)

## How do I safely change the `partition-to-node-assignment` parameter?

* [Safely change cluster partition-to-node-assignment](/docs/community/com-cluster/com-cluster-change-partition-node)

## How do I setup cluster metrics?

Cluster metrics are a subset of FeatureBase metrics.

* [Learn about FeatureBase metrics](/docs/community/com-monitoring/com-monitoring-metrics-fb#cluster-metrics)
* [Learn how to setup FeatureBase metrics](/docs/community/com-monitoring/com-monitoring-metrics-runtime-enable)
