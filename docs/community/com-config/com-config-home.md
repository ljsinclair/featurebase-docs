---
title: Community configuration
layout: default
parent: Community
has_children: true
nav_order: 8
has_toc: false
---

FeatureBase features can be enabled or disabled via

* Command-line flags
* TOML files

## Before you begin

* {% include /com-install/com-install-before-begin.md %}

## How do I setup a FeatureBase cluster?

* [Setup a FeatureBase cluster](/docs/community/com-config/com-config-cluster)
* [Resize a FeatureBase cluster](/docs/community/com-config)

## How do I generate FeatureBase keys?

* [Generate Featurebase SSH key](/docs/community/com-config/com-config-auth-key)
* [Generate FeatureBase login auth and refresh tokens](/docs/community/com-config/com-config-auth-token)

## How do I setup authentication?

FeatureBase supports authentication and authorization with OAuth2.0 via a configurable identity provider (IdP).

Azure Active Directory is supported via SAML 2.0

* [Setup Azure AD single sign-on](/docs/community/com-config/com-config-azure-sso)
* [Setup FeatureBase authentication](/docs/community/com-config/com-config-authentication)
* [Setup FeatureBase group permissions](/docs/community/com-config/com-config-group-permissions)

## How do I backup FeatureBase?

* [Backup a Featurebase cluster](/docs/community/com-config/com-config-backup)

## How do I restore a FeatureBase backup?

Use the following checklist to successfully restore a cluster from backups.

| Task | Description |
|---|---|
| Stop running processes | Stop running processes such as ingest tasks |
| Create a new cluster | [Create a cluster](/docs/community/com-config/com-config-cluster) |
| Restore backups | [Restore a FeatureBase cluster](/docs/community/com-config/com-config-restore) |
| Testing | Run test queries and verify results are as expected |
| Redirect traffic | Redirect query traffic from original cluster to new cluster |
| Start all processes | Start processes including ingest |
| Cleanup | Backup the original cluster then tear it down |
