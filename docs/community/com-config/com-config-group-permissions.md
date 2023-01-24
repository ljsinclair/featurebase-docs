



# How do I setup authentication groups?



## Before you begin

* [Perform part 1 - ](/docs/community/com-config/com-config-authentication)

## Step one:

{: .important}
The `admin` group can access all FeatureBase indexes.

* Create a permissions file in the featurebase installation folder.

```
touch permissions.yaml
```

* Add the following to the file

```
user-groups:
"<group-id1>":
    "<index1>": "<write>"
    "<index2>": "<read>"
"<group-id2>":
    "<index1>": "<read>"
admin: "<groupd-id3>
```

## Flags

{% include /com-config/com-config-flags-auth.md %}
