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
  {--host
    [ {https://hostname:port --auth-token <token> <tls_flags>}
      | hostname:port
    ]
  [--concurrency <int_val>]
  {[-s|-source]/directory/path/}
```

## Restore flags

| Argument | Description | Required? |
|---|---|---|
| `-s` or `-source` | Source directory and backup file. | Yes |
| `/backup-directory/path/` | Directory containing backups | Yes |

## Common Backup/Restore flags

{% include /com-config/com-config-flags-backup-restore-common.md %}

## TLS authentication flags

{% include /com-config/com-config-flags-backup-restore-tls.md %}

## Additional information

{% include /com-config/com-config-primary-host-extra.md %}

### Concurrency

The exact number of optimal restore operations varies depending on network/disk speeds, and should be determined experimentally when doing a test-restore.

{: .warning}
High `concurrency` values may exhaust system resources and impact applications using the cluster.

| Use case | Set concurrency |
|---|---|
| N destination nodes | `concurrency = N` | <!--In most scenarios, one per node is a reasonable conservative selection.-->
| Production cluster | Low or default of 1 |
| New cluster with no data | Not applicable |

## Examples

### Use concurrency to increase restoration speed

```
featurebase restore
  --concurrency 8
  --host featurebase-hostname-or-ip:10101
  -s /path/to/backup/
```

### Restore with TLS flags

```
featurebase restore
  --host featurebase-hostname-or-ip:10101
  -s /path/to/backup/
  --tls.ca-certificate ca.crt
  --tls.certificate client.crt
  --tls.key client.key
```
