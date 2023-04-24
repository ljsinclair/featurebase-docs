---
title: Create a cluster
layout: default
parent: Community configuration
grand_parent: Community
---

# How do I create a FeatureBase cluster?

FeatureBase Clusters are setup using the `featurebase.conf` TOML configuration file on multiple systems.

{: .important}
Install and setup FeatureBase Clusters on the same subnet for best performance.

## Before you begin

* [Install FeatureBase on multiple systems](/docs/community/com-home)
* Cluster parameters can be set in `*/featurebase/opt/featurebase.conf`

## Cluster parameters

```toml

<advertise-parameters>
<cluster-parameters>
```

{% include /com-config/com-config-param-advertise.md %}

{% include /com-cluster/com-cluster-params.md %}

## Additional information

{% include /com-config/com-config-advertise-extra.md %}


## Examples
