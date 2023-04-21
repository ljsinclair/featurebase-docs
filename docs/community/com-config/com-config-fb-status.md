---
title: FeatureBase status endpoint
layout: default
parent: Community configuration
grand_parent: Community
---

# FeatureBase Status endpoint reference

The Status endpoint reports information on the queried hostname.

## Before you begin
{% include /com-install/com-install-before-begin.md %}

## CURL command

```sh
curl <hostname>:10101/status
```

## Results

{"state":"NORMAL","nodes":[{"id":"32ce5e768b0d8ca5","uri":{"scheme":"http","host":"localhost","port":10101},"grpc-uri":{"scheme":"grpc","host":"localhost","port":20101},"isPrimary":true,"state":"STARTED"}],"localID":"32ce5e768b0d8ca5","clusterName":"cluster0"}

| Variable | Description | Additional information |
|---|---|
| State | The current state of FeatureBase on the host. | [Status values](#status-values) |
| nodes | Information on one or more FeatureBase nodes. |  |
| id | ID of current node |  |
| uri | URL scheme, host and port values set in `featurebase.conf` |  |
| grpc_uri | URI of GRPC host on the node set in `featurebase.conf` |  |
| isprimary | Boolean True/False value that indicates if the queried host is the primary node of a FeatureBase cluster | [cluster values](#cluster-values) |
| state |  |  |
| localid |  |  |
| clustername | Name of the FeatureBase node in the cluster | Default `cluster0` indicates a single node. |

## Additional information

### Status values

| Value | Description |
|---|---|
| NORMAL |
|

### URI values

* URI values are defined in `*/featurebase/opt/featurebase.conf`
* URI scheme can be:
  * http
  * grpc

## Cluster values



`isPrimary` defaults to `true` in the following situations:
* Single FeatureBase database (e.g., installed on a single system)
* The primary node of a FeatureBase Cluster
`clustername` defaults to `cluster0` for single-node FeatureBase installations.

## Examples

### FeatureBase running on a single node

CURL query:

```sh
curl localhost:10101/status
```

Result:

```sh
{
  "state":"NORMAL",
    "nodes":
    [
      {
        "id":"32ce5e768b0d8ca5",
        "uri":{"scheme":"http","host":"localhost","port":10101},
        "grpc-uri":{"scheme":"grpc","host":"localhost","port":20101},
        "isPrimary":true,
        "state":"STARTED"
      }
    ],
    "localID":"32ce5e768b0d8ca5",
    "clusterName":"cluster0"
}
```

## Further information

* [URI scheme](https://en.wikipedia.org/wiki/List_of_URI_schemes){:target="_blank"}
