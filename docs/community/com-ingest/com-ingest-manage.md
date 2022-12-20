---
title: Import data
layout: default
parent: Community
has_children: true
nav_order: 6
has_toc: false
---

# How do I import data to FeatureBase Community?
{: .no_toc}

This overview explains the process of importing data to FeatureBase using three methods:
* CSV
* SQL
* Apache Kafka

{% include page-toc.md %}

## Before you begin

{% include /community/com-before-begin-source.md %}

## Perform data modeling

{% include /concepts/summary-data-modeling.md %}

* [Learn about data modeling](/docs/concepts/overview-data-modeling/)

## CSV import method

Refer to these reference files for information on how to setup and import data using a CSV file.

* [CSV format reference](/docs/community/com-ingest/com-datafile-ref-csv)
* [CSV ingester reference](/docs/community/com-ingest/com-ingest-ref-csv)
* [CSV file and ingest examples](/docs/community/com-ingest/com-ingest-example-csv)

<!-- Coming in next PR
## SQL import method

-->

<!-- Coming after SQL PR
## Kafka import method

-->

## Troubleshooting

You may experience unexpected consequences when importing data to FeatureBase.

Perform troubleshooting steps to resolve issues

{% include /community/com-ingest-extra-missing-val.md %}

## Next step
<!-- Coming in future PR where I document these
* [Query data using SQL]
* [Query data using the Query builder]
-->
