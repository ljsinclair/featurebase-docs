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

* Install FeatureBase Community (links to install pages)

## Import process

The import process involves N steps, some of which are performed by the user, some by the application.

| Step | Description | Further information |
|---|---|---|
| Data modeling | Determine the data to import, and map source and destination datatypes |  |
| Create the source file | As a security feature, FeatureBase never connects to your source databases. The system relies on data files that contain column names, data types and data that are then imported. |  |
| Run ingestion | FeatureBase community provides command-line applications to import and process source files. |  |
| Ingestion process | Ingestion processes source data into Roaring Bitmap Format then copies it to the database in batches. |  |

## Data modeling

INFO ON WHAT'S INVOLVED
CASE STUDIES COULD BE USEFUL HERE

{: .note}
You will need to experiment to get the data modeling correct for your use case.

## Create source file

Refer to the following reference files for advice on how to build source files in your chosen format.

* [CSV format reference]
* [SQL format reference]
* [Apache Kafka format reference]

## Run ingestion

Refer to the following reference files for advice on how to setup a matching ingestion application at the command line.

* [CSV ingester reference]
* [SQL ingester reference]
* [Apache Kafka ingester reference]
