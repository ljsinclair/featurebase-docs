---
title: Install python client
layout: default
parent: Python client library
grand_parent: Tools
nav_order: 1
---
# How do I install the FeatureBase Python client library?

{: .important}
The FeatureBase Python client library has some dependencies and may cause package manager issues if installed as `root`.

## Before you begin

* [Learn about the FeatureBase Python client library](/docs/tools/python-client-library/python-client-home)
* [Install python 3.7+](https://www.python.org/downloads/){:target="_blank"} if required
* [Install make](https://www.gnu.org/software/make/){:target="_blank"} if required

{: .important}
Some environments require `python<version>-venv`

## Step 1 - clone repository

Clone the repository to create the `python-featurebase` directory

* Open a terminal then connect to the target system
* `CD` to an appropriate directory then run the clone command that

```sh
git clone git@github.com:FeatureBaseDB/python-featurebase.git
```

## Step 2 - install as package in your python environment

Run the following commands:

```sh
cd python-featurebase
make
```

## Troubleshooting

Follow on-screen instructions to repair or install requirements missing from your system.

## Next step

* [Learn how to connect to FeatureBase Cloud with the Python client](/docs/tools/python-client-library/python-client-connect-cloud), OR
* [Learn how to connect to FeatureBase Community with the Python client](/docs/tools/python-client-library/python-client-connect-community)
