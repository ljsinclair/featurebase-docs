---
title: Import data
layout: default
parent: Community
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

## Import process

The import process is performed in four parts:

* [Data modeling](#data-modeling)
* [Create source files](#create-source-files)
* [Run command-line ingest tools](#run-ingest-tools)
* [Query data to test results](#query-data-to-test-results)

You may need to repeat these steps to get the best results.

## Step one: data modeling

Data modeling involves analysing your requirements to determine the most efficient table structure for your needs.

* Narrow down the data you need to query
* Map data to data types

* [Learn about data modeling and bitmap indexes](/docs/concepts/data-modeling-overview)

{: .note}
You will need to experiment to get the data modeling correct for your use case.

## Step two: create source files

As a security feature, FeatureBase never connects to your source databases. The system relies on data files that contain column names, data types and data that are then imported.

Refer to the following reference files for advice on how to build source files in your chosen format.

* [CSV format reference]
* [SQL format reference]
* [Apache Kafka format reference]

## Step 3: run ingest tools

The **Ingest** process has two stages:
1. Process source data into Roaring Bitmap Format
2. Copy processed data to FeatureBase Community in batches

Refer to the following reference files for advice on how to configure command-line ingest tools.

* [CSV ingester reference]
* [SQL ingester reference]
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
