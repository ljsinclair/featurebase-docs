## Cluster flags

| Flag | Data type |Description | Default | Additional information |
|---|---|---|---|---|---|
| `cluster_name` | 


| [cluster.name](#cluster-name) | FEATUREBASE_CLUSTER_NAME| str   | Human-readable name for the cluster. |
| [cluster.long-query-time](#cluster-long-query-time)| FEATUREBASE_CLUSTER_LONG_QUERY_TIME  | str   | Duration that will trigger log and stat messages for slow queries. |
| [cluster.replicas](#cluster-replicas)  | FEATUREBASE_CLUSTER_REPLICAS| int   | Number of hosts each piece of data should be stored on. |
| [cluster.partition-to-node-assignment](#cluster-partition-to-node-assignment) | CLUSTER_PARTITION_TO_NODE_ASSIGNMENT| str   | How to assign partitions to nodes. jmp-hash or modulus |
