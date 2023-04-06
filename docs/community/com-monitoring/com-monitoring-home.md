---
title: Community monitoring
layout: default
parent: Community
has_children: true
nav_order: 11
has_toc: true
---

# How do I setup metrics and monitoring for FeatureBase Community?
{: .no_toc }

{% include /com-monitoring/com-monitoring-summary.md %}

{% include page-toc.md %}

## Before you begin

* {% include /com-install/com-install-before-begin.md %}

## Naming conventions for metrics

| Convention | Description | Additional information | Example |
|---|---|---|---|
| Colon character `:` | Reserved for Prometheus recording rules | [Learn about Prometheus recording rules](https://prometheus.io/docs/practices/rules/){:target="_blank"} |  |
| Format | `[namespaceprefix]_[metric_description]_[units]` | [Naming format example](#naming-format) |  |
| Namespace |

FeatureBase uses a different namespace for each component | , for example `featurebase` and something starting with `ingester` for various Ingester binaries. |
| Text case | `snake_case` is used | |
| Valid metric names | Regular expressions `[a-zA-Z_:][a-zA-Z0-9_:]*` |  |

- As a rule of thumb, either the sum() or the avg() over all dimensions of a given metric should be meaningful (though not necessarily useful).

## FeatureBase metrics

* [FeatureBase metrics reference](/docs/community/com-monitoring/com-monitoring-metrics-fb)

## Ingester metrics

* [Ingest metrics](/docs/community/com-monitoring/com-monitoring-metrics-ingest)

## Runtime metrics

* [Runtime metrics reference](/docs/community/com-monitoring/com-monitoring-metrics-runtime)

## Transaction metrics

* [Transaction metrics reference](/docs/community/com-monitoring/com-monitoring-transaction-metrics)

## Tracing

FeatureBase supports the [OpenTracing](https://opentracing.io/) standard.

Any system that supports this standard can be setup to store and visualise trace data.

## Enable metrics

* [Enable runtime metrics for external monitoring](/docs/community/com-monitoring/com-monitoring-metrics-runtime-enable)

* [Setup Datadog monitoring](/docs/community/com-monitoring/old-datadog)

## Setup error logging

* [Setup error logging](/docs/community/com-monitoring/com-monitoring-log-setup)

## Examples

## Naming format

A metric name `ingester_csv_deleter_rows_added_total` is derived from the following information:

* Namespace `ingester_csv`
* metric name `deleter_rows_added`
* "unit" `total`, indicating a counter.

## Further information

* [Prometheus best practices on naming conventions](https://prometheus.io/docs/practices/naming/)
* [Robust Perception blog post on naming conventions](https://www.robustperception.io/on-the-naming-of-things)
