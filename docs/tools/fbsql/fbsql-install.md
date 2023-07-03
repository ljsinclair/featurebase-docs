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
* [Install and setup Git on the target system](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git){:target="_blank"}
* [Install go](https://go.dev/doc/install){:target="_blank"}
* [Install make](https://www.gnu.org/software/make/){:target="_blank"}
* [Create and login to your GitHub account](https://github.com/){:target="_blank"}

## Step 1 - Download the FBSql source code

* Open a CLI then CD to the destination directory.
* Run the following command:

```shell
git clone https://github.com/FeatureBaseDB/featurebase
```

## Step 3 - Build fbsql

* CD to the

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
