---
title: Create a cluster
layout: default
parent: Community configuration
grand_parent: Community
---

# How do I create a FeatureBase cluster?

FeatureBase Clusters are setup using the `featurebase.conf` TOML configuration file on multiple systems.

## Before you begin

* [Install FeatureBase on multiple systems](/docs/community/com-home)
* Cluster parameters can be set in `*/featurebase/opt/featurebase.conf`

## Cluster parameters


```toml

<advertise-parameters>
<bind-parameters>
<cluster-parameters>
<cluster-etcd-parameters>
```

{% include /com-config/com-config-param-advertise.md %}

{% include /com-config/com-config-param-bind.md %}

{% include /com-cluster/com-cluster-params.md %}

{% include /com-cluster/com-cluster-param-etcd.md %}

## Additional information

{% include /com-config/com-config-extra-advertise.md %}

{% include /com-config/com-config-bind-extra.md %}

{% include /com-config/com-config-etcd-extra.md %}

{% include /sql-guide/timestamp-timeunit-table.md %}

## Examples

#### All nodes on the same subnet

```toml
listen-peer-address = "<advertise-peer-address>"
advertise-peer-address =""
initial-cluster = "<listen-peer-address>..."
```

#### Nodes on different proxy, URL, DNS

``` toml
<
listen-peer-address = "<local/specific IP>:NNNNN"
advertise-peer-address = "<connection-ip-for-this-node>:NNNNN"
initial-cluster = "<local/specific IP>:NNNNN, <IP-nodes-connnect>:NNNNN..."
```


## Further information

* [FeatureBase configuration parameters](/docs/community/com-config/com-config-flags.md)
