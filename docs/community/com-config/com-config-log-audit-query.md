---
title: Setup query audit log
layout: default
parent: Community configuration
grand_parent: Community
---

# How do I setup a query audit log?

The FeatureBase audit log begins recording information when the server is started. It records:

* permissions information from `permissions.yaml`
* user ID, user name, query string and IP for every request

## Before you begin

* [Add authentication](/docs/community/com-config/com-config-authentication)
* [Add group permissions](/docs/community/com-config/com-config-group-permissions)

## Step 1 - create a log file

Create a log file:
    ```
    sudo mkdir -p /var/log/molecula/ && touch /var/log/molecula/query.log
    ```

## Step 2 - add audit log path to `featurebse.conf`

* Edit `featurebase.conf` and add the path under the `[auth]` key:

```
[auth]
...
query-log-path = "/log/path/directory"
```

* Save your changes
