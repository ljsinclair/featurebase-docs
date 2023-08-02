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

* [Learn about FBSQL](/docs/tools/fbsql/fbsql-home)
Setup a Linux or MacOS target system:
* Obtain administrator permissions for FBSQL installation
* Setup network to access your FeatureBase database
* [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git){:target="_blank"}
* [Create and login to a GitHub account](https://github.com/){:target="_blank"}
* [Install go](https://go.dev/doc/install){:target="_blank"}
* [Install make](https://www.gnu.org/software/make/){:target="_blank"}

## Step 1 - Create a destination directory for the source code

* Open a CLI then create a destination directory in an appropriate directory

```sh
mkdir fbsql
```

* CD to `fbsql` then clone the FeatureBase code repository:

```
git clone https://github.com/FeatureBaseDB/featurebase
```

## Step 2 - install FBSQL

Install FBSQL from the `*/fbsql/featurebase` directory:

```shell
make install-fbsql
```

## Further information

* [Learn how to connect to a Cloud database with FBSQL]()
* [Learn how to connect to a Community database with FBSQL]()
* [Learn how to run SQL commands with FBSQL]()
