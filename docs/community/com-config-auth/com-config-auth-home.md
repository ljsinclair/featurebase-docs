---
title: Community authentication
layout: default
parent: Community
has_children: true
nav_order: 6
has_toc: false
---

# How do I secure FeatureBase Community?
{: .no_toc }

FeatureBase supports authentication and authorization with OAuth2.0 via a configurable identity provider (IdP). Azure Active Directory is supported.

{% include page-toc.md %}

## How does the authentication process work?

Once setup, FeatureBase Community authentication works as follows:

1. A user logs into FeatureBase and is then directed to the configured IdP login page.
2. When the user logs in successfully, The IdP sends a JWT token to FeatureBase to retrieve the IdP groups the user belongs to from the configured endpoint.
3. Upon retrieving the authenticated user groups, FeatureBase passes the JWT to the user account as the `molecula-chip` cookie which is used to authorize the user in subsequent requests.

## Before you begin

{% include /com-install/com-install-before-begin.md %}

## Step 1 - Generate keys and tokens

* [Generate an authentication key](/docs/community/com-config-auth/com-config-auth-key)
* [Obtain authentication tokens](/docs/community/com-config-auth/com-config-auth-token)

## Step 2 - Setup Identity Provider (IdP)

* [Setup Azure AD for Single-Sign-On with FeatureBase](/docs/community/com-config-auth/com-config-azure-sso)

## Step 3 - Setup FeatureBase permissions

* [Setup FeatureBase group permissions](/docs/community/com-config-auth/com-config-group-permissions)

## Step 4 - Setup TLS authentication

* [Setup TLS authentication](/docs/community/com-config-auth/com-config-tls-auth)
* [Setup Mutual TLS](/docs/community/com-config-auth/com-config-tls-mutual)

<!--
## Step 5 - Setup audit logs

* [Setup authentication audit logs]()

-->
