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

## Step 1 - download

* Open a CLI on the target system.
* Use one of the following methods to download the library:

| Method | Command | Additional information |
|---|---|---|
| Git clone | `git clone git@github.com:FeatureBaseDB/python-featurebase.git` | [Python-FeatureBase on GitHub](https://github.com/FeatureBaseDB/python-featurebase) |
| Python Pip | `pip install featurebase` | [FeatureBase Python library on pypi](https://pypi.org/project/featurebase/) |


Clone the repository to create the `python-featurebase` directory

* Open a terminal then connect to the target system
* `CD` to an appropriate directory then run the clone command that

```sh
git clone git@github.com:FeatureBaseDB/python-featurebase.git
```

## Step 2 - install package in your python environment

{: .warning}
Installing as `root` user may cause Python Package Manager issues

Run the following commands:

```sh
cd python-featurebase
make
```

## Troubleshooting

* Resolve any reported errors then run `make`.

## Next step

{% include /python-lib/python-lib-connect-db-links.md %}
