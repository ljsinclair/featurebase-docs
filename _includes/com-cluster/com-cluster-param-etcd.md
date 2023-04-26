## ETCD parameters

[ETCD] parameters define node-to-node, intra-cluster communication and run within a FeatureBase Cluster rather than as a separate instance.

| Flag | Data type | Description | Default | Additional information |
|---|---|---|---|---|---|
| `cluster-url` | String | URL of an existing cluster that new nodes can join | `featurebase1=http://localhost:10401` |  |
| `listen-client-address` | String | Address and port to bind to for client communication | `http://localhost:10401` |  |
| `listen-peer-address` | String | Address and port to bind to for peer communication | `http://localhost:10301` | [ETCD additional](#etcd-additional) |
| `advertise-peer-address` | String | Address other nodes in cluster use to connect to this node. |  | [ETCD additional](#etcd-additional) |
| `initial-cluster` | String | Comma-separated list of nodes in the cluster represented by `<cluster.name>=IP:port` pairs | `featurebase1=http://localhost:10301` | [ETCD additional](#etcd-additional) |
