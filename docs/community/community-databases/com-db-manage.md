---
title: Manage databases
layout: default
parent: Community
has_children: true
nav_order: 6
has_toc: false
---

# How do I manage FeatureBase Community databases?
{: .no_toc }


{% include page-toc.md %}


## How do I create FeatureBase tables?

Tables are defined during the data ingestion process

## CSV

A `.csv` (or optionally `.csv.gz`) file that contains:
* a header using a naming convention to specify

naming convention in the header of the CSV file to [specify how each field](/community/community-data-ingestion/ingester-configuration#header-descriptions) should be ingested

| Method | Requires | Method of ingestion |
|---|---|---|
| CSV | CSV file (optionally gzipped) |  |
| SQL |  |  |
| Apache Kafka | Apache Kafka topic with Avro-encoded records | Confluent schema registry to decode the Avro-encoded records before the data is ingested into FeatureBase tables. |
