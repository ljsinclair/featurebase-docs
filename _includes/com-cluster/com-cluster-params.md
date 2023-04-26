## Cluster flags

The following flags are found under [Cluster]:

| Flag | Data type | Description | Default | Additional information |
|---|---|---|---|---|---|
| `name` | String | Human readable name for the cluster which must be identical on all nodes | `featurebase1` |  |
| `long-query-time` | String | Duration before log and stat messages are generated represented by <integer-value><time-unit>, e.g., 10s (10 seconds) |  | [Time units values](#timeunit-values) |
| `replicas` | Integer | Number of hosts in the cluster. | 1 | [Cluster additional](#cluster-additional) |
| `partition-to-node-assignment` | String |  |  |  |
| `anti-entropy.interval` | String | Regular interval to run routine used to keep shard replicas synchronised |  | [Time intervals](#) |

Long-Query Time represents duration of time that will trigger log and stat message for queries longer than X time. Ex. "1m30s" 1 minute 30 seconds

```toml
[cluster]
  long-query-time = "10s"
```
