## Metrics parameters


## Metric parameters

The following parameters are found in the `[metric]` group

| Flag | Data type | Description | Default | Additional information |
|---|---|---|---|---|---|
| `diagnostics` | Boolean | Enable diagnostics reporting | `0` |  |
| `host` | String |  |  |  |
| `poll-interval` | String |  |  |  |
| `service` | String | Stats service for collecting metrics | `none` | Choose `statsd`, `expvar`, `prometheus`, `none` |  |  |

| [metric.diagnostics](#metric-diagnostics)| FEATUREBASE_METRIC_DIAGNOSTICS  | bool  | Enables diagnostics reporting. |
| [metric.host](#metric-host)  | FEATUREBASE_METRIC_HOST| str   | URI to send metrics when metric.service is statsd. |
| [metric.poll-interval](#metric-poll-interval)  | FEATUREBASE_METRIC_POLL_INTERVAL| str   | Polling interval for metrics.diagnositcs. |
| [metric.service](#metric-service)| FEATUREBASE_METRIC_SERVICE  | str   | Where to send stats: can be expvar (in-memory served at /debug/vars), prometheus, statsd or none. |
