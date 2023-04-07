---
title: Scaling FeatureBase
layout: default
parent: Community configuration
grand_parent: Community
---

## How do I scale FeatureBase Community?

This page explains the process to scale a FeatureBase cluster.

{: .note}
>You can also scale FeatureBase by starting or stopping Ingester instances.
>* [Learn about FeatureBase ingest](/docs/community/com-ingest/com-ingest-manage)

## Before you begin

{% include /com-install/com-install-before-begin.md %}
* [Learn about FeatureBase Clusters](/docs/community/com-config/old-resize-cluster)

{: .important}
FeatureBase will deny any request to access index data while it is in the `resize` state. `/status` and `/version` requests will still work.

## How do I scale FeatureBase up?

This process results in FeatureBase initiating a `resize` operation to balance the data in the cluster

1. Add a node to the cluster
2. Provision the node so it is similar to the others but with its own `bind` value
3. Make sure `gossip seeds` which are already setup in the cluster.

## How do I scale FeatureBase down?

This process results in FeatureBase:
* putting the cluster into the `resize` state
* moving data to make all nodes contain the correct shards given the cluster replication factor

1. decide which node you want to remove.
2. Get the node's ID by querying FeatureBase's `/status` endpoint.
3. Shut the node down.
4. Issue a POST request to the cluster coordinator node with a JSON document specifying the node's ID as the payload.

```shell
curl -XPOST https://coordinator:10101/cluster/resize/remove-node -d'{"id": "d39851e7-9444-4033-a534-c92c1b470a8e"}'
```
