---
title: Backup FeatureBase
layout: default
parent: Community configuration
grand_parent: Community

---

# How do I backup my FeatureBase Community installation?

You can create FeatureBase backups on the CLI using the `featurebase-backup` command and suitable flags.

A `featurebase backup` includes:
* schema
* key translation data
* indexes
* ID allocation state
* Unaltered records

{: .important}
It's important to stop any jobs that create, alter or delete records before running a backup. Only existing unaltered records are guaranteed to be backed-up.

## Not included in backups

* External lookup database (backup separately)
* Node configurations
* Other FeatureBase components

## Before you begin

* {% include /com-install/com-install-before-begin.md %}
* [Learn how to setup authentication for FeatureBase Community](/docs/community/com-config/com-config-authentication)
* Obtain Administrator permissions to the FeatureBase cluster

## Syntax

```sh
featurebase backup --host [https://]hostname:port
-output /directory/path/
[--auth-token <token>]
```

## Arguments

| Argument | Description | Required? | Further information |
|---|---|---|---|
{% include /com-config/com-config-flags-backup-restore-common.md %}
| -output | Specify the output directory for the backup file. Can be abbreviated to `-o` | Yes |
| /directory/path/ | Empty destination directory. It will be created if it does not exist. If not empty, the process will fail with an error. | Yes |
{% include /com-config/com-config-backup-restore-flags-auth.md %}

## Additional information

{% include /com-config/com-config-primary-host-extra.md }

## Examples

### host backup

```
featurebase backup --host featurebase:10101 -output /backups/featurebase-backups
```


### Authenticated backup

```
featurebase backup --host https://featurebase:10101 -o /backups/featurebase-backups --auth-token <token>
```
