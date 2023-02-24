---
title: Obtain auth tokens
layout: default
parent: Community configuration
grand_parent: Community
---

# How do I obtain authorization tokens?

An `auth-token` and `refresh-token` is a valid JSON Web Token provided by FeatureBase after the user is authenticated.

These tokens are used to authenticate your user when TLS authentication is enabled, and with the following features:

* HTTPS API
* gRPC API
* Backup FeatureBase
* Restore FeatureBase from backup
* Grafana connector authentication

{: .warning}
**NEVER** share your `auth-token` or `refresh-token`. These identify and authenticate you with FeatureBase and can be misused.

## Before you begin

* {% include /com-install/com-install-before-begin.md %}
* [Learn how to enable authentication](/docs/community/com-config-auth/com-config-tls-auth)
* Setup a password manager or other safe storage for your tokens

## Obtain tokens via CLI

* Open a Terminal then `cd` to the FeatureBase installation directory.
* Run the following command:

```
featurebase auth-token
```

* Follow the prompts to obtain your auth-token.

## Obtain tokens from the lattice UI

* Login to the lattice UI
* Right click the interface > Inspect
* Click Application
* Click Cookies > `molecula-chip` > to obtain your `auth-token`.
* Click `refresh-molecula-chip` to obtain your `refresh-token`.

<!--
## Further information

* [Use tokens to authenticate HTTPS API commands]
* [Use tokens to authenticate gRPC API commands]
* [Use tokens to Backup an authenticated FeatureBase cluster](/docs/community/com-config/com-config-backup)
* [Use an `auth-token` to restore from an authenticated backup](/docs/community/com-config/com-config-restore)
* [Use tokens to authenticate the Grafana connector]
-->
