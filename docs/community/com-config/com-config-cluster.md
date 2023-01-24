---
title: Setup cluster
layout: default
parent: Community configuration
grand_parent: Community
---

# How do I setup a new FeatureBase cluster

WHAT IS A FB CLUSTER?
WHY IS IT USEFUL?
USE CASES?

## Before you begin

* {% include /com-install/com-install-before-begin.md %}

## Syntax

```


```

## Arguments

| Key | Description | Required | Further information |
|---|---|---|---|
| `client-address` / etcd-listen-client-address | Set to the node's new network address | Yes |  |
| `etcd.listen-peer-address` |  | The node's new network address. | Yes |
| `etcd.initial-cluster` |  | Set to the new network addresses and add additional nodes as required | Yes |  |
| `cluster.replicas` | Update replication factor if required | Optional |  |


## Additional information


## Examples

## Further information

* [Restore a FeatureBase backup to a new cluster](/docs/community/com-config/com-config-restore)
