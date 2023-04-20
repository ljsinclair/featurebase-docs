---
title: Linux memory limits
layout: default
parent: Community troubleshooting
grand_parent: Community
---

# Issue - Linux memory limits

{% include /com-issues/com-issue-memory-process-summary.md %}

## Troubleshooting

One or more of the following solutions should be pursued:

* [Distribute the database across systems with a FeatureBase Cluster](/docs/community/com-config/old-resize-cluster)
* [Learn how change max threads per process](https://www.baeldung.com/linux/max-threads-per-process){:target="_blank"}
* [Change max threads per process](https://www.baeldung.com/linux/max-threads-per-process){:target="_blank"}
* [Reclaim space on SSDs](/docs/community/com-troubleshooting/com-issue-linux-ssd)

## Temporarily increase memory limits

Open a new CLI then run one of the following commands as appropriate to your system:

* `echo N > /proc/sys/vm/max_map_count`
* `sysctl -w vm.max_map_count=N`

Where N is the increased memory limit.
