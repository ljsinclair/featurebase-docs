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
* TOML files

{% include page-toc.md %}

## Before you begin

{% include /com-install/com-install-before-begin.md %}


## How do I set up a FeatureBase cluster?

* [Set up a FeatureBase cluster](/docs/community/com-config/old-resize-cluster)

## How do I generate FeatureBase keys?

* [Generate Featurebase SSH key](/docs/community/com-config-auth/com-config-auth-key)
* [Generate FeatureBase login auth and refresh tokens](/docs/community/com-config-auth/com-config-auth-token)

## How do I set up authentication?

FeatureBase supports authentication and authorization with OAuth2.0 via a configurable identity provider (IdP).

Azure Active Directory is supported via SAML 2.0

* [Set up Azure AD single sign-on](/docs/community/com-config-auth/com-config-azure-sso)
* [Set up FeatureBase authentication](/docs/community/com-config-auth/com-config-tls-auth)
* [Set up FeatureBase group permissions](/docs/community/com-config-auth/com-config-group-permissions)

## How do I backup and restore my FeatureBase database?

* [Backup and Restore FeatureBase databases](/docs/community/com-backup/com-backup-home)
