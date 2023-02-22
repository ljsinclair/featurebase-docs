---
title: Backup FeatureBase
layout: default
parent: Community configuration
grand_parent: Community

---

# How do I backup my FeatureBase Community installation?

You can create FeatureBase backups on the CLI using the `featurebase-backup` command and suitable flags.

## What's included in the backup?

A `featurebase backup` includes:
* schema
* key translation data
* indexes
* Allocated IDs
* Unaltered records

## What's excluded from the backups

* External lookup database (backup separately)
* IDs committed by the auto ID feature before the backup starts
* Node configurations
* Other FeatureBase components

{: .important}
Stop any jobs that create, alter or delete records before running a backup. Only existing, unaltered records are guaranteed to be backed-up.

## Before you begin

* {% include /com-install/com-install-before-begin.md %}
* [Learn how to setup authentication for FeatureBase Community](/docs/community/com-config/com-config-authentication)
* Obtain Administrator permissions to the FeatureBase cluster

## Syntax

```sh
featurebase backup
  {--host
    [ {https://hostname:port --auth-token <token> <tls_flags>}
      | hostname:port
    ]
  [--concurrency <int_val>]
  [--no-sync]
  {[-o|-output] /backup-directory/path/}
```

## Arguments

### Backup flags

| Argument | Description | Required? | Further information |
|---|---|---|---|
| `-no-sync` | Backup runs without the operating system moving data to persistent storage. | Optional | [Override storage synchronization](#override-storage-synchronization) |
| `-o` or `-output` | Backup output directory | Yes |  |
| `/backup-directory/path/` | Backup directory which will be created if it does not exist | Yes | Backup process will fail if directory not empty |

### Common Backup/Restore flags

{% include /com-config/com-config-flags-backup-restore-common.md %}

### TLS authentication flags

{% include /com-config/com-config-flags-backup-restore-tls.md %}

## Additional information

{% include /com-config/com-config-primary-host-extra.md %}

### Override storage synchronization

* By default, `featurebase backup` will wait for all backup files to be committed to persistent storage before terminating.
* `no-sync` overrides this setting

{: .warning}
Use of `no-sync` risks loss of backup date should the backup system lose power.

## Examples

{: .warning}
`featurebase backup` overwrites any files in the destination folder. To retain earlier backups, `tar` the backup folder then move the file to a new location.

### Increased backup speed

Increase backup speed by setting the concurrency value and turning off sync.

```
featurebase backup
  --concurrency 2
  --host featurebase-hostname-or-ip:10101
  -o /path/to/backup/
  --no-sync
```

### Host backup

```
featurebase backup
  --host featurebase-hostname-or-ip:10101
  -output /backups/featurebase-backups
```

### Authenticated backup

```
featurebase backup
  --host https://featurebase-hostname-or-ip:10101
  -o /backups/featurebase-backups
  --auth-token <token>
```

### Backup with TLS

```
featurebase backup
  --host featurebase-hostname-or-ip:10101
  -o /path/to/backup/
  --tls.ca-certificate ca.crt
  --tls.certificate client.crt
  --tls.key client.key
```

### No sync backup with manual backup to remote folder

```sh
featurebase backup --host featurebase-hostname-or-ip:10101 -o /path/to/backup/ --no-sync
```
