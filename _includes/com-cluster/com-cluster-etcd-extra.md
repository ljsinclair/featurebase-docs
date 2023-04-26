### ETCD additional

* `etcd` parameters must be consistent on all cluster nodes.
* The following parameters will default to supplied values if not configured:

| Not provided | Defaults to |
|---|---|
| `advertise-client-address` | `listen-client-address` |
| `advertise-peer-address` | `listen-peer-address` |

{: .note}
`listen-peer-address: localhost:10401` is unreachable by other nodes in the same subnet.

* [Learn more about etcd](https://etcd.io/docs/v3.5/faq/){:target="_blank"}
