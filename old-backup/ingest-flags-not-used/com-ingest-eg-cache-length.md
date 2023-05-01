### Example cache miss rate over different cache lengths

The graph below shows the cache miss rate over different cache lengths assuming:
* a key with an average frequency of 1 per 10000 records
* a batch size of 5000.

The default of 64 gives a miss rate of approximately 4% for this frequency. Beyond this, there are substantial declining returns.

[![Cache Miss Rate vs Cache Length](/assets/images/com-ingest/cache-miss-rate-vs-length.png "Cache Miss Rate vs Cache Length")](https://www.desmos.com/calculator/bjcjris94d){:target="_blank"}

### Example cache miss rate over different key frequencies

The graph below shows the cache miss rate over different key frequencies with
* a batch size of 5000
* a variety of cache lengths

For the default length of 64, the miss rate is negligible for keys more frequent than 1 per 10000, and extremely high for keys less frequent than 1 per million. If the cache length is doubled to 128, it spikes at a frequency a bit lower, at the expense of double the memory:

[![Cache Miss Rate vs Key Frequency](/assets/images/com-ingest/cache-miss-rate-vs-freq.png "Cache Miss Rate vs Key Frequency")](https://www.desmos.com/calculator/hdhzehaeeg){:target="_blank"}
