---
title: Restore FeatureBase
layout: default
parent: Community configuration
grand_parent: Community
---

# How do I restore from a backup?

The `featurebase-restore` command is used to restore a backup to a new FeatureBase cluster of any size.

{: .warning}
`featurebase-restore` should **only** be executed against an empty cluster. Data loss and/or instability **will** occur if this is attempted on a live cluster with data.

## Before you begin

* {% include /com-install/com-install-before-begin.md %}
* [Backup FeatureBase Community](/docs/community/com-config/com-config-backup)
* Obtain Administrator permissions to the destination FeatureBase cluster

## Syntax

```
featurebase restore
  [--concurrency <int_val>]
  --host [https://]featurebase:10101
  -source /directory/path/
  [--auth-token <token>]
  [<TLS_flags>]
```

## Arguments

| Argument | Description | Required? | Further information |
|---|---|---|---|
{% include /com-config/com-config-flags-backup-restore-common.md %}
| -source | Source directory and backup file. Can be abbreviated to `-s` | Yes |  |
| /directory/path/ | Path to backups | Yes |  |
{% include /com-config/com-config-flags-backup-restore-auth.md %}

## TLS authentication flags

| Argument | Data type Description | Required? | Further information |
|---|---|---|---|---|
{% include /com-config/com-config-tls-auth.md %}

## Examples

## Increase restore speed

Use the `concurrency` flag to restore files at a higher speed

```
featurebase restore --host newfeaturebase:10101 -s /path/to/backup/ --concurrency 4
```


## Further information
