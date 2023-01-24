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
featurebase backup
  [-- concurrency <int_val>]
  --host [https://]hostname:port
  -output /directory/path/
  [--auth-token <token>]
  [ --no-sync]
  <TLS_flags>
```

## Arguments

| Argument | Data type | Description | Required? | Further information |
|---|---|---|---|
{% include /com-config/com-config-flags-backup-restore-common.md %}
| -output |  | Specify the output directory for the backup file. Can be abbreviated to `-o` | Yes |
| /directory/path/ | String | Empty destination directory. It will be created if it does not exist. If not empty, the process will fail with an error. | Yes |
{% include /com-config/com-config-flags-backup-restore-auth.md %}
| `-no-sync` |  | Backup runs without the operating system moving data to persistent storage. | Optional | Use of `no-sync` risks loss of backup date should the backup system lose power. |

## TLS authentication flags

| Argument | Data type Description | Required? | Further information |
|---|---|---|---|---|
{% include /com-config/com-config-tls-auth.md %}

## Obtain primary host values

{% include /com-config/com-config-primary-host-extra.md }

## Examples

### Increased backup speed

Increase backup speed by setting the concurrency value and turning off sync.

```
featurebase backup --concurrency 2 --host featurebase:10101 -o /path/to/backup/ --no-sync
```

### Host backup

```
featurebase backup --host featurebase:10101 -output /backups/featurebase-backups
```


### Authenticated backup

```
featurebase backup --host https://featurebase:10101 -o /backups/featurebase-backups --auth-token <token>
```
