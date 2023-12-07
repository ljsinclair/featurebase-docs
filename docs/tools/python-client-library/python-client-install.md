---
title: Install python client
layout: default
parent: Python client library
grand_parent: Tools
nav_order: 1
---
# How do I install the FeatureBase Python client library?

## Before you begin

* [Learn about the FeatureBase Python client library](/docs/tools/python-client-library/python-client-library-home)
* Verify Python is installed
* [Install python 3.7+ if required](https://www.python.org/downloads/){:target="_blank"}
* [Install make](https://www.gnu.org/software/make/){:target="_blank"}

{: .important}
Some environments may require `python<version>-venv`<br/>
Installing as root may cause package manager issues

## Step 1 - clone repository

* Open a terminal and connect to the target system, then in the directory of choice, run:

```sh
git clone git@github.com:FeatureBaseDB/python-featurebase.git
```

## Step 2 - install as package in your python environment

Run the following commands:

```sh
cd python-featurebase
make
```

## Next step

* [Create a `.py` file to connect and run SQL against your database](/docs/tools/python-client-connect-query)
