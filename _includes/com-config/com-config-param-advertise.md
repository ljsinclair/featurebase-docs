### Advertise flags

| Flag | Data type | Description | Default | Additional information |
|---|---|---|---|---|---|
| `advertise` | String | FeatureBase host/IP and port to advertise to:<br/>* other nodes in a cluster<br/>* clients via `/staus` endpoint | `localhost:10101` | Host defaults to the network `bind` IP address |
| `advertise-grpc` | String | GRPC equivalent of `advertise` | `localhost:20101` |  |
