---
title: Install fbsql
layout: default
parent: fbsql
grand_parent: Tools
nav_order: 1
---
# How do I install the fbsql CLI?

{% include page-toc.md %}

## Before you begin
* [Learn About fbsql](/docs/tools/fbsql/fbsql-home)
* [Install go](https://go.dev/doc/install)

## Step 1 - Navigate to source code

* [Navigate to the source code](https://github.com/FeatureBaseDB/featurebase)

## Step 2 - Download the source code

In your terminal, clone the repository

```shell
git clone https://github.com/FeatureBaseDB/featurebase
```

## Step 3 - Build fbsql

Navigate to the source code folder

```shell
cd featurebase
```

 and then run
 
 ```shell
make install-fbsql
```

{: .note }
In the very near future, fbsql will be packaged with every release on the [FeatureBase Releases](https://github.com/FeatureBaseDB/featurebase/releases) page.

## Next step
* [See fbsql examples](/docs/tools/fbsql/fbsql-home#examples)