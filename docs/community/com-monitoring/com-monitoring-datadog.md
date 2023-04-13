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
* [Create a Datadog account](https://www.datadoghq.com/product/){:target="_blank"}
* [Install Datadog agent](https://docs.datadoghq.com/agent/versions/upgrade_to_agent_v7/?tab=linux){:target="_blank"}

## Step 1 - enable FeatureBase Prometheus metrics

* Open a CLI then CD to `*/featurebase/opt`.
* Edit `/featurebase.conf` and add the following details:

{% include /com-monitoring/com-monitoring-metrics-prometheus.md %}

## Step 2 - Add prometheus metrics to the agent config files





## Further information

* [Learn which system level metrics will be exposed](https://docs.datadoghq.com/integrations/system/){:target="_blank"}
* [Learn how to setup Datadog to setup EC2 Cloudwatch metrics](https://docs.datadoghq.com/integrations/amazon_web_services/?tab=roledelegation#installation){:target="\_blank"} for systems running on AWS EC2.
