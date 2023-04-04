---
title: Scaling FeatureBase
layout: default
parent: Community configuration
grand_parent: Community
---

## How do I scale FeatureBase Community?

{: .note}
You can also [Resize a FeatureBase Cluster](/docs/community/com-config/old-resize-cluster)

Generally, scaling is handled by starting or stopping Ingester instances.

## Scale FeatureBase up

To scale FeatureBase up, add a node to the cluster and provision it similarly to the others (with its own bind), and make sure it has gossip seeds which are already in the cluster. It will automatically join the cluster and FeatureBase will initiate a resize operation to balance the data in the cluster.

## Scale FeatureBase down

When these steps are complete, FeatureBase will:
* put the cluster into the `resizing` state
* move data to make all nodes contain the correct shards given the cluster replication factor

{: .important}
FeatureBase will deny any request to access index data while in the `resize` state. `/status` and `/version` requests will still work.

1. decide which node you want to remove.
2. Get the node's ID by querying FeatureBase's `/status` endpoint.
3. Shut the node down.
4. Issue a POST request to the cluster coordinator node with a JSON document specifying the node's ID as the payload. E.g.

```shell
curl -XPOST https://coordinator:10101/cluster/resize/remove-node -d'{"id": "d39851e7-9444-4033-a534-c92c1b470a8e"}'
```
