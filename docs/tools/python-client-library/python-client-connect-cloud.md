---
title: Connect to Cloud
layout: default
parent: Python client library
grand_parent: Tools
nav_order: 2
---

# How do I connect to FeatureBase Cloud?


## Before you begin

* [Install FeatureBase Python client library](/docs/tools/python-client-library/python-client-install)
* [Create a Cloud database](/docs/cloud/cloud-databases/cloud-db-manage) if required
* [Start FeatureBase Community](/docs/community/com-startup-connect) if required


## Syntax

```py
# Import required libraries
import featurebase

# Connect to FeatureBase cloud
c_client = featurebase.client(
  hostport = "query.featurebase.com/v2",
  database = "<database-id>",
  apikey = "<api-key-secret>",
  timeout = "<int-value>")
```

## Required libraries

{: .important}
`import featurebase` is required. Add other libraries as necessary.

## Connect to FeatureBase Cloud

| Keywords | Description | Required | Additional information |
|---|---|---|---|
| `c_client = featurebase.client` | Indicates the connection is to FeatureBase Cloud | Yes |  |
| hostport | `query.featurebase.com/v2` is the default value for Cloud databases | Optional |  |
| database | ID for database in Cloud | Yes | [Obtain database ID from Database details](/docs/cloud/cloud-databases/cloud-db-details) |
| apikey | Cloud API key secret key | Yes | [Create a Cloud API key](/docs/cloud/cloud-authentication/cloud-auth-create-key) |
| timeout | Integer value that represents number of seconds before connection timeout | Optional |  |

## Next step

* [Learn how to query the connected database](/docs/tools/python-client-library/python-client-query-connection)

## Further information

* [Learn how to connect to FeatureBase Community with the Python client](/docs/tools/python-client-library/python-client-connect-community)
