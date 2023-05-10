---
title: Add/remove cluster nodes
layout: default
parent: Community configuration
grand_parent: Community
nav_order: 2
---

## How do I add or remove cluster nodes?

When you make alterations to a FeatureBase cluster, the system:
* initiates a `resize` operation to balance data in the cluster
* moves data to make all nodes contain the correct shards given the cluster replication factor
* restores the former state when the process is completed

{: .important}
FeatureBase will deny any request to access index data while it is in the `resize` state. `/status` and `/version` requests will still work.

{: .note}
>You can also scale FeatureBase by starting or stopping Ingester instances.
>* [Learn about FeatureBase ingest](/docs/community/com-ingest/com-ingest-manage)

## Before you begin

{% include /com-install/com-install-before-begin.md %}
* [Create a FeatureBase Cluster](/docs/community/com-cluster/com-cluster-setup)

## How do I add nodes to a FeatureBase cluster?

1. Add a node to the cluster
2. Provision the node so it is similar to the others but with its own `bind` value
3. Make sure `gossip seeds` which are already setup in the cluster.

## How do I remove nodes from a FeatureBase cluster?

1. Decide which node you want to remove.
2. Get the node's ID by running `curl <featurebase-cluster-hostname>:10101/status`.
3. Shut the node down.
4. Issue a POST request to the cluster coordinator node with a JSON document specifying the node's ID as the payload. For example:

```shell
curl -XPOST https://coordinator:10101/cluster/resize/remove-node -d'{"id": "d39851e7-9444-4033-a534-c92c1b470a8e"}'
```

## Further information

* [Learn about FeatureBase HTTP endpoints](/docs/community/com-monitoring/com-monitoring-endpoints)
