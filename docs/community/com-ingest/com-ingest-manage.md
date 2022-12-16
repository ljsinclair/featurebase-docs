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
* Apache Kafka.

{% include page-toc.md %}

## Before you begin

{% include /community/com-before-begin-source.md %}

## Step one: data modeling

Data modeling involves analysing your requirements to determine the most efficient table structure for your needs.

* Narrow down the data you need to query
* Map data to data types

* [Learn about data modeling and bitmap indexes](/docs/concepts/overview-data-modeling)

{: .note}
You will need to experiment to get the data modeling correct for your use case.

## Step two: create source files

Refer to the following reference files for advice on how to build source files in your chosen format.

* [CSV format reference](/docs/community/com-ingest/com-datafile-ref-csv)
* [SQL format reference](/docs/community/com-ingest/com-datafile-ref-sql)
* [Apache Kafka format reference]

## Step 3: run ingest tools

Refer to the following reference files for advice on how to configure command-line ingest tools.

* [CSV ingester reference](/docs/community/com-ingest/com-ingest-ref-csv)
* [SQL ingester reference](/docs/community/com-ingest/com-ingest-ref-sql)
* [Apache Kafka ingester reference]

## Step 4: query data

FeatureBase Community provides tools to query your data to determine if the results are as expected.

* [Query data](#)
* [Query builder](#)
* [API queries](#)

## Step 5: troubleshooting

You may experience unexpected consequences when importing data to FeatureBase.

Perform troubleshooting steps to resolve issues

* [Discrepancy between source and data records] -- ADAPT crime story
* [Reduce number of rows for time-stamped data] -- ADAPT crime story
*
