## Cluster flags

The following flags are found under [Cluster]:

| Flag | Data type | Description | Default | Additional information |
|---|---|---|---|---|---|
| `name` | String | Human readable name for the cluster |  |  |
| `long-query-time` | String | Duration before log and stat messages are generated |  |  |
| `replicas` | Integer | Number of hosts in the cluster. | 0 | value 0 indicates a single FeatureBase database. |
| `partition-to-node-assignment` | String |  |  |  |
