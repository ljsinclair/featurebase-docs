---
title: Programmatic Access
layout: default
parent: Cloud
nav_order: 4
---

# How do I access FeatureBase Cloud programmatically?

Everything that can be done in the user interface can be accomplished via REST api calls. Furthermore, APIs allow you to perform additional actions as well as gather more metadata about your organization and data. You will likely interact with the APIs in a production setting.

## Obtain an auth token

FeatureBase Cloud uses Oauth2.0 for all authorization, so every API call must be accompanied with a valid token. You can get tokens by passing your credentials to https://id.featurebase.com. The below cURL command can be run on any linux-based system:

**HTTP API Reference:**
```shell
curl --location --request POST 'https://id.featurebase.com' \
--data-raw '{
    "USERNAME": "<username>",
    "PASSWORD": "<password>"
}'
```

3 tokens are returned: Access, ID, and Refresh. Use the ID token for all of your API calls as the Authorization header:

`--header 'Authorization: Bearer <IdToken>'`

It’s best practice to have tokens that expire frequently in order to protect customers in the unlikely event attackers are able to obtain a token. The ID token is valid for 60 minutes. After that, you’ll need to perform the same call above. Alternatively you can use the refresh token to retrieve new ID tokens for up to 30 days. This is an option if you don’t want to re-authenticate using your credentials every time. You will need to keep these tokens somewhere in order to re-use them.

## Obtain an API key

Alternatively, every API call can be accompanied with a valid API key. [Learn how to create an API key](/docs/cloud/cloud-authentication/cloud-auth-create-key/)

Use an API key' secret for all of your API calls as the Authorization header:

`--header 'X-API-Key: <key secret>'`

## Further Information

* [HTTP API Docs](https://api-docs-featurebase-cloud.redoc.ly/latest/)