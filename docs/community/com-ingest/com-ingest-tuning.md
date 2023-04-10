---
title: Ingest tuning
layout: default
parent: Import data
grand_parent: Community
nav_order: 20
---

# Optimizing the ingest process

There are a few options to tune the ingest process for a specific workload:
1. Batch size
2. Cache length
3. Number of ingesters

## 1. Batch size

There is a fixed overhead from setting up a transaction, as well as a fixed overhead for each row.
Ingesting larger batches will cause these to average out more.
In general, larger batches will improve performance and proportionally raise memory usage.
There is no default batch size because the memory usage per record varies greatly between workloads.
For workloads with a large number of sparse keys, batch sizes of around 20,000 will typically use a few hundred megabytes of memory.
For workloads mostly consisting of high-frequency keys, it may be practical to use batch sizes of a million or more.

## 2. Cache length

Under most workloads, the key translation process is the most expensive part of the ingest process.
In order to make this more efficient, the ingester keeps a cache of recently used keys in order to avoid re-requesting them from FeatureBase.
Using a longer cache will use more memory but potentially improve performance.
Using a shorter cache will potentially reduce performance but will also reduce memory requirements.

Every ingester stores all keys used in the past 64 batches (keys used in multiple batches are only stored once). This cache length value can be changed with the `--cache-length` CLI flag.

The steady-state cache miss rate can be approximated as:

```math
p = (1-q)^(l*s)
```

Where:
- `p` = probability of a cache miss on a key
- `q` = frequency of usage of the key
- `l` = cache length
- `s` = batch size

The graph below shows the cache miss rate over different cache lengths assuming a key with an average frequency of 1 per 10000 records and a batch size of 5000. The default of 64 gives a miss rate of approximately 4% for this frequency. Beyond this, there are substantial declining returns.

[![Cache Miss Rate vs Cache Length](/assets/images/cache-miss-rate-vs-length.png "Cache Miss Rate vs Cache Length")](https://www.desmos.com/calculator/bjcjris94d)

The graph below shows the cache miss rate over different key frequencies with a batch size of 5000 and a variety of cache lengths. For the default length of 64, the miss rate is negligible for keys more frequent than 1 per 10000, and extremely high for keys less frequent than 1 per million. If the cache length is doubled to 128, it spikes at a frequency a bit lower, at the expense of double the memory:

[![Cache Miss Rate vs Key Frequency](/assets/images/cache-miss-rate-vs-freq.png "Cache Miss Rate vs Key Frequency")](https://www.desmos.com/calculator/hdhzehaeeg)


#### 3. Number of ingesters

It may sometimes be desirable to run multiple ingesters in parallel.
This may improve utilization on multi-core systems, or allow for redundancy.

It is possible to run multiple identical ingesters in the same process with the `--concurrency` CLI flag.
These ingesters are mostly independent, and roughly behave the same as two independent ingester processes would.
`--concurrency` CLI flag is not supported for `molecula-consumer-csv` and `molecula-consumer-sql`.

Alternatively, it is possible to launch multiple ingester processes, possibly on multiple machines.

### Common performance problems

#### Large mutex fields

Ingest of a mutex field with many possible values can be extremely slow.
The FeatureBase cluster has to compare every ingested row with every row in the field to detect if a pre-existing value needs to be cleared.
When operating with many unique mutex values, this results in `O(n^2)` ingest complexity.
