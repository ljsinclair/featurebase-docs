---
title: Community configuration
layout: default
parent: Community
has_children: true
nav_order: 8
has_toc: true
---

## Configure FeatureBase Community
{: .no_toc }

FeatureBase features can be enabled or disabled via

* Command-line flags
* the `/featurebase.conf` TOML configuration file

{% include page-toc.md %}

## Before you begin

{% include /com-install/com-install-before-begin.md %}

## Where are configuration files found?

| File and path | Purpose | Additional information |
|---|---|---|
| `/opt/featurebase.conf` | TOML configuration file used to save FeatureBase settings. | [Configuration flags](/docs/community/com-config/com-config-flags) |
| `/opt/featurebase.*.service` |  |  |
| `/opt/fbsql` | Used to run SQL commands from the CLI. | [/docs/tools/fbsql/fbsql-home] |
| `/idk/molecula-consumer-*` | Used to import data to FeatureBase tables. | [Manage data ingest](/docs/community/com-ingest/com-ingest-manage) |

## How do I manage FeatureBase services?

* [Manage FeatureBase services](/docs/community/com-config/com-config-manage-fb-services)

## How do I set up a FeatureBase cluster?

* [Set up a FeatureBase cluster](/docs/community/com-config/old-resize-cluster)

## How do I set up authentication?

* [Secure FeatureBase Community accounts](/docs/community/com-auth/com-auth-manage)

## How do I backup and restore my FeatureBase database?

* [Backup and Restore FeatureBase databases](/docs/community/com-backup/com-backup-home)
