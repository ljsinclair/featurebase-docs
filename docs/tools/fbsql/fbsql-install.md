---
title: Install or upgrade FBSQL
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 1
---
# How do I install or upgrade the FBSQL CLI?

FBSQL is provided as a tool for anyone who downloads the FeatureBase source code from GitHub.

The application will run natively on any Linux or MacOS operating system. For Windows machines, the system can be setup and run on a Linux virtual machine.

## Before you begin

* [Learn about FBSQL](/docs/tools/fbsql/fbsql-home)
* Setup Linux or MacOS installation environment:
  * Obtain administrator permissions
  * Verify network settings allow access to your FeatureBase database
  * [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git){:target="_blank"}
  * [Create and login to a GitHub account](https://github.com/){:target="_blank"}
  * [Install go](https://go.dev/doc/install){:target="_blank"}
  * [Install make](https://www.gnu.org/software/make/){:target="_blank"}
  * Delete earlier installations at the CLI with `rm -rf fbsql`

## Step 1 - Setup installation directory

* Open a CLI on your computer.
* Run `mkdir fbsql`.

## Step 2 - clone the repository and install FBSQL

* CD to `fbsql` then clone the FeatureBase code repository:

```
git clone https://github.com/FeatureBaseDB/featurebase
```
* CD to `featurebase` then run the installation command:

```shell
make install-fbsql
```

## Further information

* [Learn how to connect to a Cloud database with FBSQL](/docs/tools/fbsql/fbsql-connect-cloud-db)
* [Learn how to connect to a Community database with FBSQL](/docs/tools/fbsql/fbsql-connect-com-db)
* [Learn how to run SQL commands with FBSQL](/docs/tools/fbsql/fbsql-running-sql)
