---
title: Python client library
layout: default
parent: Tools
has_children: true
nav_order: 3
has_toc: false
---

# How do I access FeatureBase from a Python application?

The FeatureBase Python package provides a client class that:
* represents a connection to a FeatureBase Cloud or Community database
* exposes public methods that allow a Python application to submit queries

## Before you begin

{% include /cloud/cloud-before-begin.md %}, Or
{% include /com-install/com-install-before-begin.md %}

## How do I install FeatureBase Python client library?

* [Learn how to Install python client library](/docs/tools/python-client-library/python-client-install)

## How do I run queries on my database?

* [Learn how to connect and run queries on your database](/docs/tools/python-client-library/python-client-connect-query)


OLD BELOW


## Client object parameters

The following parameters can be used with the client constructor method. All parameters are optional.

| Parameter | Description | Default |
|---|---|---|
| `hostport` | Hostname and port number of your FeatureBase instance, it should be passed in `host:port` | `localhost:10101` |
| `database` | Database id of your FeatureBase cloud instance |  |
| `apikey` | [Cloud API key](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/postKey) that can be used for authn/authz for cloud |  |
| `cafile` | Fully qualified certificate file path |  |
| `capath` | Fully qualified certificate folder |  |
| `origin` | Request origin, should be one of the allowed origins defined for your FeatureBase instance |  |
| `timeout` | Number of seconds to wait before timing out on server connection attempts |  |

## Usage




## Further information

* [SQL guide](/docs/sql-guide/sql-guide-home)
