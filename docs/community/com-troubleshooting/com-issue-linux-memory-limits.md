---
title: Linux memory limits
layout: default
parent: Community troubleshooting
grand_parent: Community
---

# Issue - Linux memory limits

{% include /com-issues/com-issue-memory-process-summary.md %}

## Before you begin

* [Learn how to use `ulimit` to change the open file limit](https://linuxconfig.org/limit-user-environment-with-ulimit-linux-command){:target="_blank"}
* Obtain SUDO privileges on the system

{% include /com-issues/open-file-limit-recommend.md %}

## Temporarily increase the memory limit

{% include /com-issues/com-issue-ulimit-summary.md%}

* Open a CLI then run the following command with an appropriate value:

```
ulimit -n <value>
```

* Verify the change:

```
ulimit -n
```

## Further information

* [Learn how change max threads per process](https://www.baeldung.com/linux/max-threads-per-process){:target="_blank"}
