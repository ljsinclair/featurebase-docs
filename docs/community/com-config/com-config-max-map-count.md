---
title: Max-map-count
layout: default
parent: Community configuration
grand_parent: Community
---

## max-map-count reference

{% include /com-config/com-config-max-map-count-summary.md %}

## Before you begin

{% include page-toc.md %}

## Step 1 - Query memory limits

| Operating System | Query memory limit |
|---|---|
| Linux | * `cat /proc/sys/vm/max_map_count`, OR<br/>* `/sbin/sysctl vm.max_map_count` |
| MacOS | [Open MacOS Activity Monitor](https://support.apple.com/en-au/guide/activity-monitor/actmntr1001/mac){:target="_blank"} |

## Step 2 - Alter the FeatureBase max-map-count parameter

Set the `max-map-count` parameter to a minimum 10% less than the max-

* Open a CLI then CD to `*/featurebase/opt`
* Edit `featurebase.conf`.
* Alter the `max-map-count` parameter as required
* Save `featurebase.conf`
* Restart FeatureBase.
