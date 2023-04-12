---
title: Setup Datadog monitoring
layout: default
parent: Community monitoring
grand_parent: Community
nav_order: 1
---

# How do I setup Datadog monitorning?



## Before you begin

* [Learn about FeatureBase monitoring](/docs/community/com-monitoring/com-monitoring-home)

## Step 1 - enable FeatureBase Prometheus metrics

* Open a CLI then CD to `*/featurebase/opt`
* Add the following parameters to the `featurebase.conf` TOML configuration file:

```
[metric]
    service = "prometheus"
    poll-interval = "<int><time-"
```



## Further information

* [Learn which system level metrics will be exposed](https://docs.datadoghq.com/integrations/system/){:target="_blank"}
* [Learn how to setup Datadog to setup EC2 Cloudwatch metrics](https://docs.datadoghq.com/integrations/amazon_web_services/?tab=roledelegation#installation){:target="\_blank"} for systems running on AWS EC2.
