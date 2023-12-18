---
title: Install python client
layout: default
parent: Python client library
grand_parent: Tools
nav_order: 1
---
# How do I install the FeatureBase Python client library?

{% include /python-lib/python-lib-classes-summary.md %}

## Before you begin

* [Learn about the FeatureBase Python client library](/docs/tools/python-client-library/python-client-home)
* Install the following if not already on the target system:
  * [Install python 3.7+](https://www.python.org/downloads/){:target="_blank"}
  * [Install make](https://www.gnu.org/software/make/){:target="_blank"}
* Install one of the following to download the FeatureBase Python library:
  * [Git version control](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  * [Install pip](https://pip.pypa.io/en/stable/installation/)

## Install the FeatureBase Python library

You can install the library by
* cloning the repository
* running the pip command

## Method 1 - clone the repository

* Open a CLI on the target system
* Clone the FeatureBase Client library:

```sh
`git clone git@github.com:FeatureBaseDB/python-featurebase.git`
```

* CD to `python-featurebase`
* Run `make`

## Method 2 - Install using `pip`

* Open a CLI on the target system
* Run `pip install featurebase`

## Next step

{% include /python-lib/python-lib-connect-db-links.md %}
