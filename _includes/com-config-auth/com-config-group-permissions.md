---
title: Authentication groups
layout: default
parent: Community configuration
grand_parent: Community
---

# How do I setup authentication groups?



## Before you begin

* {% include /com-install/com-install-before-begin.md %}
* [Configure authentication](/docs/community/com-config-auth/com-config-tls-auth)

## Step one:

{: .important}
The `admin` group can access all FeatureBase indexes.

* Create a permissions file in the featureBase installation folder.

```
touch permissions.yaml
```

* Edit the file and add the following settings:

```
user-groups:
"<group-id1>":
    "<index1>": "<write>"
    "<index2>": "<read>"
"<group-id2>":
    "<index1>": "<read>"
admin: "<groupd-id3>
```
