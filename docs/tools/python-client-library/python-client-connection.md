---
title: Create client object
layout: default
parent: Python client library
grand_parent: Tools
nav_order: 2
---

# How do I create a client object for FeatureBase python client library?

## Before you begin

For FeatureBase Cloud:
* [Create a Cloud database](/docs/cloud/cloud-databases/cloud-db-manage)
* [Copy the Cloud database ID](/docs/cloud/cloud-databases/cloud-db-details)
* [Create a Cloud table](/docs/cloud/cloud-tables/cloud-table-create)
* [Create a Cloud API](/docs/cloud/cloud-authentication/cloud-auth-create-key)

For FeatureBase Community:
* [CREATE TABLE SQL]

## Syntax

```sh

# import fbpy-lib
import featurebase
# create default client
[c_]client = featurebase.client(
  hostport = "<host:port>"
  database = "<database-id>"
  apikey = "<api-key-secret>"
  cafile = "<certificate-file-path>"
  capath = "<certificate-folder>"
  origin = "<FB-instance-request-origin>"
  timeout = "<int-seconds>"
)
```

## Required keywords

| Keywords | Description | Required? | Additional information |
|---|---|---|---|
| `c_` | prefix used for FeatureBase Cloud connections | For Cloud |  |
| `client = featurebase.client` | Defines featurebase.client and optional flags | Yes | Use `featurebase.client()` to connect to Community instance on same host  |

## Optional keywords

{: .note}
Omit keywords if connecting to FeatureBase Community installed on the same host.

| Keywords | Description | Default | Required? | Additional information |
|---|---|---|---|---|
| hostport | Hostname and port for your FeatureBase instance | Cloud: `query.featurebase.com/v2`<br/>Community: `localhost:10101` (default) | For Cloud or Community on different host |  |
| database | Cloud database ID |   | For Cloud | [Cloud ID database details page](/docs/cloud/cloud-databases/cloud-db-details) |
| apikey | Cloud API key secret key |  | For Cloud or Community on different host | Use `cafile` or `capath` for Community on different host |
| cafile | Fully qualified CA certificate file path |   | For Community on different host | Use `apikey` for Cloud |
| capath | Fully qualified CA certificate folder | Use `apikey` for Cloud | Optional for Community |  |
| origin |  |
| timeout | Integer value that represents number of seconds before connection timeout |  | Optional |  |




```sh
# intialize featurebase client for community or cloud featurebase server
client = featurebase.client(hostport="localhost:10101") #community
#client = client(hostport="query.featurebase.com/v2", database="", apikey="") #cloud
```


### Create client object

Import the FeatureBase library and instantiate a client object by calling the client's constructor method.

```python
# import the library
import featurebase

# create a default client that connects to localhost:10101
client = featurebase.client()

# create a client that connects to FeatureBase Cloud
c_client = featurebase.client(
  hostport="query.featurebase.com/v2",
  database="<database_id>",
  apikey="<APIKey_secret>"
  )
```
