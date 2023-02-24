---
title: Startup & connect
layout: default
parent: Community
nav_order: 4
---

# How do I startup and connect to FeatureBase Community?

These instructions explain how to run FeatureBase Community after you’ve installed on the target system.

{% include /page-toc.md %}

{: .note }
FeatureBase does not currently run on Mac Safari

## Before you begin

* Learn about [FeatureBase Community](/docs/community/com-home)
* Install FeatureBase on the system:
  * [Install FeatureBase on Linux](/docs/community/com-install-linux)
  * [Install FeatureBase on Mac](/docs/community/com-install-mac)
  * [Install FeatureBase on Windows](/docs/community/com-install-windows)
* Install Mozilla Firefox or Google Chrome on the system

## How do I start the FeatureBase Community server?

* Open a terminal
* CD to the `~/featurebase/opt` directory
* Run the following command:

```
./featurebase server --sql.endpoint-enabled
```

## Confirm FeatureBase server is running

{: .note}
localhost:10101 is the default port for the FeatureBase Community GUI. This can be changed in configuration settings.

Run this command from any directory FeatureBase has been installed.

```
curl localhost:10101
```

## How do I connect to FeatureBase community?

Open the following URL in your web browser:

```
http://localhost:10101/
```

## Troubleshooting

* [Issue: FeatureBase Community won't startup on Mac](/docs/community/com-troubleshooting/com-issue-mac)
