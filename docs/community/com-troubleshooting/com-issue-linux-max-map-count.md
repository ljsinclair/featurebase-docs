---
title: Linux max_map_count too low
layout: default
parent: Community troubleshooting
grand_parent: Community
---

# Issue - max virtual memory areas vm.max_map_count is too low

Error occurs for virtual memory used by various systems.

## Cause

The `max-map-count` parameter in the `/featurebase.conf` TOML configuration file allows you to set a maximum limit on active memory maps.

This parameter is disabled by default.

This should be set to 10% lower than the Linux `vm.max_map_count` value which defaults to 65530.

{: .note}
The actual number of active memory maps can be slightly higher than defined.

## Before you begin

* [Learn about max_map_count](https://access.redhat.com/solutions/99913){:target="_blank"}
* Obtain SUDO privileges on the system
*

## Alter the max-map-count parameter

* Open a CLI then CD to `*/featurebase/opt`
* Query the Linux `max_map_count` using one of the following commands:
  * `cat /proc/sys/vm/max_map_count` OR
  * `/sbin/sysctl vm.max_map_count`
* Edit `featurebase.conf`.
* Alter the `max-map-count` parameter to a minimum 10% less than `vm.max_map_count`
* Save `featurebase.conf`
* Restart FeatureBase.

## Further information

* [Change max_map_count](https://thetechdarts.com/how-to-change-default-vm-max_map_count-on-linux/){:target="_blank"}
