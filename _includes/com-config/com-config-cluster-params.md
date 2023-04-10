<!-- Experimental based on old-monitoring and com-config-flags-->

| CLI Flag | featurebase.conf parameter | Data type | Description | Metrics | Additional information |
|---|---|---|---|---|---|
| `anti-entropy.interval` | `FEATUREBASE_ANTI_ENTROPY_INTERVAL` | str   | Integer and time unit(s) to run the anti-entropy routine used to keep shard replicas synchronised. | [Anti entropy example](#anti-entropy-additional) |

## Additional information

### Anti-entropy

* [Learn about anti-entropy metrics](/docs/community/com-monitoring/com-monitoring-metrics-fb#cluster-metrics)

## Examples

### Anti-entropy example

```toml
[anti-entropy]
  interval = "10m0s"
```
