---
title: Restore FeatureBase
layout: default
parent: Community configuration
grand_parent: Community
---

# How do I restore from a backup?

You can use the `featurebase-restore` command to restore a backup to any size cluster.

{: .warning}
`featurebase-restore` should **only** be executed against an empty cluster. Data loss and/or instability **will** occur if this is attempted on a live cluster with data.

## Before you begin

* {% include /com-install/com-install-before-begin.md %}
* [Backup FeatureBase Community](/docs/community/com-config/com-config-backup)
* Obtain Administrator permissions to the destination FeatureBase cluster

## Syntax

```
featurebase restore
  --host [https://]featurebase:10101
  -source /directory/path/
  [--auth-token <token>]
```

## Arguments

| Argument | Description | Required? | Further information |
|---|---|---|---|
{% include /com-config/com-config-flags-common.md %}
| -source | Source directory and backup file. Can be abbreviated to `-s` | Yes |  |
| /directory/path/ | Path to backups | Yes |  |
{% include /com-config/com-config-backup-restore-flags-auth.md %}

## Restoration process

The ideal restoration process involves the following tasks:

### Stop running processes

* Stop running processes such as ingest tasks

### Create a new cluster and restore

* Start a new cluster
* Restore from the backup

### Testing

* Test queries return expected results

### Redirect query traffic and restart processes

* Redirect query traffic from original cluster to new cluster
* Start processes including ingest

### Cleanup

* Backup the original cluster if it still exists
* Tear down the original cluster

## Further information
