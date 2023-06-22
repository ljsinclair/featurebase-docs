---
title: Revoke Key
layout: default
parent: Manage API Keys
grand_parent: Cloud
nav_order: 5
---

# How do I revoke an API key in FeatureBase Cloud?
{: .no_toc }

Learn how to revoke a FeatureBase Cloud API key.

{% include page-toc.md %}

## Before you begin

{% include /cloud/cloud-before-begin.md %}
* [Create an API key](/docs/cloud/cloud-authentication/cloud-auth-create-key/)

{% include /cloud-auth/cloud-auth-revoke-warning.md %}

## Warnings

After a key is revoked, API calls using a revoked key will:
* complete as normal if already in progress
* be rejected if the call has not yet started

## Revoke an API key

* Click **Configuration** > **Manage API keys**.
* Click <span class="material-icons md-18">more_vert</span> on the API key to revoke.
* Click **Revoke**.
* Click **Revoke This Key** in the confirmation dialog.

## Further information

* [Update key API reference](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/putUserKey)
