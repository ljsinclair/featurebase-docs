---
title: Install fbsql
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 1
---
# How do I install the fbsql CLI?

FBSQL is provided as a tool for anyone who downloads the FeatureBase source code from GitHub.

The application will run natively on any Linux or MacOS operating system. For Windows machines, the system can be setup and run on a Linux virtual machine.

{% include page-toc.md %}

## Before you begin

* [Learn About fbsql](/docs/tools/fbsql/fbsql-home)
* Setup a Linux, MacOS or Linux Virtual Machine as the target system
* Obtain Administrator access
* Configure target system with network access to your FeatureBase database
* [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git){:target="_blank"}
* [Install go](https://go.dev/doc/install){:target="_blank"}
* [Install make](https://www.gnu.org/software/make/){:target="_blank"}
* [Create and login to your GitHub account](https://github.com/){:target="_blank"}

## Step 1 - Create a destination directory for the source code

* Open a CLI then create a destination directory in an appropriate directory

```sh
mkdir fbsql
```

* CD to `fbsql` then clone the FeatureBase code repository

```
git clone https://github.com/FeatureBaseDB/featurebase
```

## Step 2 - install FBSQL

* CD to `fbsql/featurebase` then setup FBSQL

 ```shell
make install-fbsql
```

## Further information

* [Running SQL queries using FBSQL](/docs/tools/fbsql/fbsql-running-sql)
