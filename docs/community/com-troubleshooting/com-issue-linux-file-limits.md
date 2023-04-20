---
title: Linux file limits
layout: default
parent: Community troubleshooting
grand_parent: Community
---

# Issue - Linux file limits

{% include /com-issues/com-issue-open-file-limit-summary.md %}

## Before you begin

* [Learn how to troubleshoot Linux "too many open files" error](https://www.baeldung.com/linux/error-too-many-open-files){:target="_blank"}
* [Learn how to use `ulimit` to change the open file limit](https://linuxconfig.org/limit-user-environment-with-ulimit-linux-command){:target="_blank"}
* [Learn how to use `prlimit` to change the open file limit](https://www.baeldung.com/linux/prlimit){:target="_blank"}
* Obtain SUDO privileges on the system

## Verify the open file limit

{: .note}
`ulimit` affects only the current shell and its child processes.

The `ulimit` program only affects the limits of the shell it's run in and child processes of that shell, so you can't use `sudo ulimit` to change the limit of your current shell

* Open a CLI then enter the following command:

```
  ulimit -n
```

## Temporarily increase the open file limit

{: .note}
You may require `sudo` to increase the file limit high enough to make a difference.

* Open a CLI then run this command to launch a new shell as `root`

```
sudo -s
```

* Run this command with an appropriate value to change the ulimit

```
ulimit -m <value>
```

## Step 2 - Launch a new shell to inherit the higher limits
<!--note for @gthrone -- this doesn't look right to me but I may be wrong-->
Launch a new shell using the `sudo su` command to:
* run the shell as your regular user
* inherit the higher limits just set

## Set a persistent open file limit value

There are four ways to change the open file limit so it persists after reboot.

{: .note}
FeatureBase recommends an open file limit of 256K or more.

* Open a CLI then edit one or all the following files:

| Edit | Parameter to set |
|---|---|
| `/etc/security/limits.conf` | `nofile` |
| `/etc/security/limits.d/<username>.conf` | `nofile` |
| `/etc/susctl.conf` | `fs.file-max` and/or `vm.max_map_count` |
| `/etc/sysctl.d/*.conf` | `fs.file-max` |

* Restart your session for the change to take effect.

## Further information

* [Learn about limits.conf](https://www.geeksforgeeks.org/limits-conf-file-to-limit-users-process-in-linux-with-examples/){:target="_blank"}
