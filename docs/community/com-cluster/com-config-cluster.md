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

{: .note}
FeatureBase clusters cannot be resized. However, they can be scaled by backing-up then restoring to a newer, larger cluster.

## Before you begin

* {% include /com-install/com-install-before-begin.md %}

## Syntax

```

SOME COMMAND HERE
  [--client-address | etcd-listen-client-address] hostname:port
  --etcd.listen.peer-address <network-address>
  --etcd.initial-cluster <network-address>
  --cluster.replicas <int-val>
  <tls-flags>
```

## Arguments

| Key | Description | Required | Further information |
|---|---|---|---|
| `client-address` / etcd-listen-client-address | New node network address | Yes |  |
| `etcd.listen-peer-address` | New node network address | Yes |  |
| `etcd.initial-cluster` | New node network address with additional nodes as requred | Yes |  |
| `cluster.replicas` | Define number of replicas in the cluster | Optional |  |

## TLS authentication flags

{% include /com-config/com-config-flags-backup-restore-tls.md %}

## Examples



## Further information

* [Restore a FeatureBase backup to a new cluster](/docs/community/com-config/com-config-restore)
