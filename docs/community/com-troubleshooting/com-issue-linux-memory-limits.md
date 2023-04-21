---
title: Linux memory limits
layout: default
parent: Community troubleshooting
grand_parent: Community
---

# Issue - Linux memory limits

{% include /com-issues/com-issue-memory-process-summary.md %}

## Before you begin

* [Learn how to use `ulimit` to change the open file limit](https://linuxconfig.org/limit-user-environment-with-ulimit-linux-command){:target="_blank"}

## Solutions

### Alter the FeatureBase max-map-count


#### Step 1 - query Linux max_map_count

Query the Linux `max_map_count` using one of the following commands:
* `cat /proc/sys/vm/max_map_count` OR
* `/sbin/sysctl vm.max_map_count`

#### Step 2 - Alter the FeatureBase max-map-count parameter

{% include /com-config/com-config-max-map-count-alter.md %}

### Alter memory limits for current session

{% include /com-issues/com-issue-ulimit-summary.md%}

* Open a CLI then run the following command with an appropriate value:

```
ulimit -n <value>
```

* Verify the change:

```
ulimit -n
```

## Alter memory limits for persistent sessions

* [Learn how change max threads per process](https://www.baeldung.com/linux/max-threads-per-process){:target="_blank"}

## Further information

* [Learn about Linux max_map_count](https://access.redhat.com/solutions/99913){:target="_blank"}
