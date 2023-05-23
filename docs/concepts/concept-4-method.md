---
title: Data Modeling - Method
layout: default
parent: Concepts
nav_order: 4
---

# Data Modeling - Part 4 - Method

The method you choose to import data to FeatureBase will differ based on your use case and the way your data is supplied.

Each of the following import methods has pros and cons.

| Data source | [REST API](https://api-docs-featurebase-cloud.redoc.ly/){:target="_blank"} | [SQL `Bulk Insert`](/docs/sql-guide/statements/statement-bulk-insert) | [Community CLI ingest](/docs/community/com-ingest/com-ingest-manage) |
|---|---|---|---|
| CSV |  | Yes | Yes |
| JSON | SQL in application/JSON | Yes (ndJSON) |  |
| Kafka avro |  |  | Yes |
| Kafka static |  |  | Yes |
| Parquet |  | Yes |  |
| SQL | Yes (text/plain payload or curl) | Yes | Yes |




## Next step

* [Part 5 - Testing](/docs/concepts/concept-5-testing)
