### `cache-length` additional

Under most workloads, the key translation process is the most expensive part of the ingest process.

By default, the `molecula-consumer` process stores keys used in the past 64 batches to avoid requesting them again from FeatureBase

{:note}
keys used in multiple batches are only stored once

The ingest `cache-length` flag can be used to improve performance.

In general:
* Using a longer cache will use more memory but potentially improve performance
* Using a shorter cache will potentially reduce performance but will also reduce memory requirements

#### Estimating appropriate `cache-length`

The steady-state cache miss rate can be approximated as:

```math
p = (1-q)^(l*s)
```

| Parameter | Description |
|---|---|
| `p` | Probability of a cache miss on a key |
| `q` | Frequency of usage of the key |
| `l` | Cache length |
| `s` | Batch size |
