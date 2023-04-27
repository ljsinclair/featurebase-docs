---
title: Community backup and restore
layout: default
parent: Community
has_children: true
nav_order: 11
has_toc: false
---

# Backup and Restore FeatureBase Community Databases
{: .no_toc }

FeatureBase Community databases can be backed-up and restored for a number of reasons, including the following:

* General backup of data
* Making changes to your `featurebase.conf` settings, including the cluster `partition-to-node-assignment` parameter.

{% include page-toc.md %}

## Before you begin

{% include /com-install/com-install-before-begin.md %}
* [Import data to FeatureBase Community](/docs/community/com-ingest/com-ingest-manage)

## What is the end-to-end backup and restore process?

Use the following checklist to successfully restore a cluster from backups.

{: .warning}
Wait for ingest processes to finish before stopping FeatureBase services.

| Task | Description |
|---|---|
| Stop all running processes | [Manage FeatureBase services](/docs/community/com-config/com-config-service-fb-manage) |
| Backup the source | [Backup the FeatureBase Cluster](/docs/community/com-backup/com-config-backup) |
| Create target | [Create a cluster](/docs/community/com-cluster/com-cluster-setup) |
| Restore backups to target | [Restore a FeatureBase cluster](/docs/community/com-backup/com-config-restore) |
| Test target | Run test queries and verify results are as expected |
| Redirect traffic to target | Redirect query traffic from original cluster to new cluster |
| Start all processes on target | Start processes including ingest |
| Clean up source | Backup the original cluster then tear it down |

## How do I backup a FeatureBase cluster?

* [Backup a Featurebase cluster](/docs/community/com-backup/com-config-backup)

## How do I verify backups?

Use the following checklist to verify backups function correctly.

| Task | Description |
|---|---|
| Backup source | [Backup a Featurebase cluster](/docs/community/com-backup/com-config-backup) |
| Set up test environment | Backup testing can be performed using a single local node provided the system has sufficient memory and disk space. |
| Restore source backup | [Restore a FeatureBase cluster](/docs/community/com-backup/com-config-restore) |
| Test target | Run queries and verify results are as expected |

## How do I restore a FeatureBase cluster?

* [Restore a FeatureBase cluster](/docs/community/com-backup/com-config-restore)
