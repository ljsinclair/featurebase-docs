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

## Warnings

* Revoked keys can no longer be used. 
* API calls using a revoked key will be rejected. 
* This will happen immediately when you revoke the key.
* Any currently-running calls will complete as normal.

## Before you begin

{% include /cloud/cloud-before-begin.md %}
* [Create an API key](/docs/cloud/cloud-authentication/cloud-auth-create-key/)

## Revoke an API key

* Click **Configuration** > **Manage API keys**.
<ul>
<li>
Click <span class="material-icons md-18">more_vert</span> on the API key to revoke.
</li>
</ul>
* Click **Revoke**.
* Click **Revoke This Key** in the confirmation dialog.

## Further information

* [Update key API reference](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/putUserKey)
