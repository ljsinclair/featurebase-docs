## Experimental flags

| Flag | Description |
|---|---|
| `--exp-split-batch-mode` | Tell FeatureBase client to build bitmaps locally over many batches and import them at the end. Does not support `int` or `mutex` fields. |
| `--use-shard-transactional-endpoint` | Use alternate import endpoint. Currently unstable/testing |
