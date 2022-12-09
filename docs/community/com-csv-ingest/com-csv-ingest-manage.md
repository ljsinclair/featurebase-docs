---
title: Import data using CSV
layout: default
parent: Community
nav_order: 6
has_toc: false
---

# How do I use a CSV file to import data to FeatureBase Community?
{: .no_toc }

This overview explains the process of importing data to FeatureBase Community using a CSV file

{% include page-toc.md %}

## Before you begin

* Install FeatureBase Community (links to install pages)
* Learn about [RFC-4180 standard for CSV files](https://datatracker.ietf.org/doc/html/rfc4180#section-2) which is required for CSV ingestion.

## Step one: Data Mapping

Your first step in any import is to determine:
* Which tables are required to import
* What the columns will map to in FeatureBase.

[DATA TYPES LIST]

## Step two: create CSV file


- Fields containing line breaks (CRLF), double quotes, and commas should be enclosed in double-quotes.
- If double-quotes are used to enclose fields, then a double-quote appearing inside a field must be escaped by preceding it with another double quote.




```



```
