---
title: Kafka consumer ingest
layout: default
parent: Import data
grand_parent: Community
nav_order: 7
---

# How do I ingest data from Kafka Consumer with Confluent Schema Management?
{: .no_toc}

The Kafka consumer requires:
- A list of Kafka hosts
- A FeatureBase index name (`--index <indexname>`),
- Exactly one primary key method (`--primary-key-field <fieldnames>`, `--id-field <fieldname>` or `--auto-generate`),

This ingestion method relies on:

* Python
* Kafka Consumer
* Confluent Schema Management

{: .note}
Use the [Kafka static ingest method]() for self-managed schemas.

## Before you begin

{: .note}
FeatureBase recommends you [run Python in a virtual environment](https://docs.python.org/3/library/venv.html){:target="_blank"}

* [Install the Confluent Kafka Python Client](https://docs.confluent.io/kafka-clients/python/current/overview.html#ak-python){:target="_blank"}

##

```
syntax goes here
```

##

| Parameter | Description | Required | Further information |
|---|---|---|---|


## Additional information

## Examples

### Example 1: minimal


Command:
`molecula-consumer-kafka `

Data:
```json

```



## Next step
