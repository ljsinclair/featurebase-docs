---
title: Create a cluster
layout: default
parent: Community cluster
grand_parent: Community
---

# How do I create a FeatureBase cluster?

FeatureBase Clusters are setup using the `featurebase.conf` TOML configuration file on multiple systems.

A FeatureBase Cluster is a distributed system that is maintained by `etcd` which runs on each node. The system requires at least three nodes to maintain data consistency and fault tolerances. <!--from https://stackoverflowteams.com/c/molecula/questions/179-->

## Before you begin

* [Install FeatureBase on multiple systems](/docs/community/com-home)
* [Learn about etcd cluster members](https://etcd.io/docs/v3.3/faq/#why-an-odd-number-of-cluster-members){:target="_blank"}
* Cluster parameters are set in `*/featurebase/opt/featurebase.conf`

## Cluster parameters

```toml

advertise = <IP Address>:10101
advertise-grpc = <IP Address>:20101

name = "<node-name>"
#bind-parameters
bind = "<cluster-ip>:10101"
bind-grpc = "<cluster-ip>:20101"

data-dir = "<data-directory>/var/lib/molecula"
log-path = "<log-directory>/var/log/molecula/featurebase.log"

[cluster]
  name = "<cluster-name>"
  replicas = <int-val>
  long-query-time = <int><time-unit>
  partition-to-node-assignment =
  anti-entropy-interval =
[etcd]
  cluster-url =
  listen-client-address =
  listen-peer-address =
  advertise-peer-address = ""
  initial cluster = "<cluster-name>:<port>,..."
```

{% include /com-config/com-config-param-advertise.md %}

## Node parameters

| Flag | Data type | Description | Default |
|---|---|---|---|---|
| <node-name> | String | Unique name for the node | `featurebase1` |

{% include /com-config/com-config-param-bind.md %}

## Cluster parameters

The following flags are found under [Cluster]:

| Flag | Data type | Description | Default | Additional information |
|---|---|---|---|---|---|
| `name` | String | Human readable name for the cluster which must be identical on all nodes | `featurebase1` |  |
| `long-query-time` | String | Duration before log and stat messages are generated represented by <integer-value><time-unit>, e.g., 10s (10 seconds) |  | [Time units values](#timeunit-values) |
| `replicas` | Integer | Number of hosts in the cluster. | 1 | [Replicas additional](#cluster-replicas) |
| `partition-to-node-assignment` | String | Controls how partitions are assigned to cluster nodes. | `jmp-hash` | [Partition-to-node-assignment additional](#cluster-partition-to-node-assignment) |

## `[ETCD]` parameters

| Flag | Data type | Description | Default | Additional information |
|---|---|---|---|---|---|
| `cluster-url` | String | URL of an existing cluster that new nodes can join | `featurebase1=http://localhost:10401` |  |
| `listen-client-address` | String | Address and port to bind to for client communication | `http://localhost:10401` | FeatureBase will use `listen-client-address` values if `advertise-client-address` is not defined. |
| `listen-peer-address` | String | Address and port to bind to for peer communication | `http://localhost:10301` | `listen-peer-address: localhost:10401` will be unreachable by other nodes on the same subnet. |
| `advertise-peer-address` | String | Address other nodes in cluster use to connect to this node. |  | FeatureBase will use `listen-peer-address` values if `advertise-peer-address` is not defined. |
| `initial-cluster` | String | Comma-separated list of nodes in the cluster represented by `<cluster.name>=IP:port` pairs | `featurebase1=http://localhost:10301` | [ETCD additional](#etcd-additional) |

## Additional information

{% include /com-config/com-config-advertise-extra.md %}

{% include /com-config/com-config-bind-extra.md %}

### [Cluster] `replicas`

`replicas` values:
* default of `1` indicates a single FeatureBase installation or node
* `n-1` replicas are then available for additional nodes

### [Cluster] `partition-to-node-assignment`

{% include /com-cluster/com-cluster-partition-node-extra.md %}

{% include /sql-guide/timestamp-timeunit-table.md %}

### `[etcd]` additional

ETCD runs on each node in a FeatureBase cluster rather than as a separate instance.

`[etcd]` parameters must be consistent on each node in the cluster because they govern:
* node-to-node and intra-cluster communication
* maintain data integrity and fault tolerances across the cluster

## Examples

#### All nodes on the same subnet

```toml
listen-peer-address = "<advertise-peer-address>"
advertise-peer-address =""
initial-cluster = "<listen-peer-address>..."
```

#### Nodes on different proxy, URL, DNS

``` toml
listen-peer-address = "<local/specific IP>:NNNNN"
advertise-peer-address = "<connection-ip-for-this-node>:NNNNN"
initial-cluster = "<local/specific IP>:NNNNN, <IP-nodes-connnect>:NNNNN..."
```

## Further information

* [FeatureBase configuration parameters](/docs/community/com-config/com-config-flags)
* [Learn more about etcd](https://etcd.io/docs/v3.5/faq/){:target="_blank"}
