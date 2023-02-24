| Argument | Data type | Description | Required? | Further information |
|---|---|---|---|
| `--host` |  | Specify a FeatureBase node | Yes |  |
| `https://featurebase-hostname-or-ip:port` | string | `https` is required for authenticated FeatureBase clusters. Requires `auth-token` | For authenticated clusters | <!--[FeatureBase authentication](/docs/community/com-config/com-config-authentication)--> |
| `featurebase-hostname-or-ip:port` | string | Primary hostname of the FeatureBase cluster to be backed up. | Yes | [Determine primary host settings](#determine-primary-host) |
| `--auth-token <token>` |   | Authorization token required for authentication | For authenticated clusters | [Generate an authentication token](/docs/community/com-config/com-config-auth-key) |
| `--concurrency <int_val>` | Integer | Define a concurrency value to increase the number of files backed up. Defaults to `1`. | Optional | Not applicable when restoring to new clusters. |
