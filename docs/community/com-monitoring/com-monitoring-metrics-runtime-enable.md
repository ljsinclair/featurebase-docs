---
title: Enable Runtime Metrics
layout: default
parent: Community monitoring
grand_parent: Community
---

# How do I enable runtime metrics?

Runtime metrics are enabled using the `featurebase.conf` configuration file.

## Before you begin

* {% include /com-install/com-install-before-begin.md %}
* [Manage monitoring](/docs/community/com-monitoring/com-monitoring-home)

## Enable runtime metrics

* Open a terminal then `cd` to the `/featurebase` directory.
* Edit `featurebase.conf`.
* Add or edit the following flag and set it to a value > 0.

```
metric.poll-interval= <nonzero value>
```

* Save the changes.
