---
title: Managing services
layout: default
parent: Community configuration
grand_parent: Community
---

# How do I manage FeatureBase services?
{: .no_toc }

You can start, stop and check the status of FeatureBase services using `systemctl` commands.

{% include page-toc.md %}

## Before you begin

{% include /com-install/com-install-before-begin.md %}
* Obtain `sudo` credentials for the system
* [Setup FeatureBase as a service](/docs/community/old-setup/old-community-quickstart-guide/set-up-log-and-data-folders)

## Manage FeatureBase services

* Open a CLI and the `/featurebase` installation directory.

| Description | Command |
|---|---|
| Verify FeatureBase service status | `sudo systemctl status featurebase` |
| Start FeatureBase services | `sudo systemctl start featurebase` |
| Stop FeatureBase services | `sudo systemctl stop featurebase` |
| Restart FeatureBase services | `sudo systemctl restart featurebase` |
