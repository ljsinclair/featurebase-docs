---
title: Linux max_map_count too low
layout: default
parent: Community troubleshooting
grand_parent: Community
---

# Issue - vm.max_map_count is too low

{% include /com-issues/com-issue-memory-process-summary.md %}

## Causes

{% include /com-config/com-config-max-map-count-summary.md %}

## Before you begin

* [Learn about Linux max_map_count](https://access.redhat.com/solutions/99913){:target="_blank"}
* Obtain SUDO privileges on the system

## Solution

### Step 1 - query Linux max_map_count

Query the Linux `max_map_count` using one of the following commands:
* `cat /proc/sys/vm/max_map_count` OR
* `/sbin/sysctl vm.max_map_count`

## Step 2 - Alter the FeatureBase max-map-count parameter

{% include /com-config/com-config-max-map-count-alter.md %}

## Further information

* [Change max_map_count](https://thetechdarts.com/how-to-change-default-vm-max_map_count-on-linux/){:target="_blank"}
* [Change memory limits with ulimit](/docs/community/com-troubleshooting/com-issue-linux-memory-limits)
