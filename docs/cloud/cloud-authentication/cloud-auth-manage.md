---
title: Manage API Keys
layout: default
parent: Cloud
has_children: true
nav_order: 5
---

# How do I manage API keys in FeatureBase Cloud?
{: .no_toc }

This page provides an overview of FeatureBase API keys and links to guide you through the process of managing API keys.

FeatureBase API keys are used for authentication [when accessing FeatureBase programmatically](/docs/cloud/programmaticaccess/).

## Before you begin
{: .no_toc }
{% include /cloud/cloud-before-begin.md %}

{% include page-toc.md %}

## Accessing API keys

To view your API keys, click **Configuration** > **Manage API Keys**. Here you can see all of the API keys that are available to you. If you are an admin in your organization, you will be able to see all of the API keys in your organization (toggleable in the top right).

{: .note }
API key secrets are not stored. If you lose a key's secret, it is recommended that you revoke the key and create a new one. [Learn how to revoke an API key](/docs/cloud/cloud-authentication/cloud-auth-revoke-key/)

## Managing API keys in FeatureBase Cloud

* [Create API key](/docs/cloud/cloud-authentication/cloud-auth-create-key/)
* [Rename API key](/docs/cloud/cloud-authentication/cloud-auth-rename-key/)
* [Revoke API key](/docs/cloud/cloud-authentication/cloud-auth-revoke-key/)

## Further information

* [Learn how to access FeatureBase Cloud programmatically](/docs/cloud/programmaticaccess/)
* [API keys HTTP API reference](https://api-docs-featurebase-cloud.redoc.ly/latest#tag/Keys)
