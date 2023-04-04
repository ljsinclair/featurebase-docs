---
title: Setup logging
layout: default
parent: Community monitoring
grand_parent: Community
---

# How do I setup logging?


All FeatureBase components log to standard error by default and can be configured to log to a file. When logging to a file, FeatureBase components will re-open the log file on receipt of the HUP signal.

## Before you begin

* [Install and configure Linux logrotate](https://linux.die.net/man/8/logrotate)
* Setup `logrotate` to run daily

{: .note}
Check `/etc/cron.daily/logrotate` to make sure.

## Step 1 - create log directory

* Open a terminal and CD to the `/featurebase` directory
* Create a logs directory:

```sh
mkdir fb-logs
```

## Step 2 - add logs directory to configuration

* Edit the `featurebase.conf` configuration file.
* Add or edit the following parameter:

```sh
log-path = "/fb-logs/featurebase.log"
```

## Step 3 - restart FeatureBase

{: .warning}
Restart FeatureBase only AFTER ingestion tasks are complete.

* Run the following command:

```sh
sudo systemctl restart featurebase
```

* Verify the restart was successful:

```sh
sudo systemctl status featurebase
```

## Step 4 - Create a logrotate configuration file

* CD to `/etc/logrotate.d`
* Create a new logrotate file with the following settings:

```sh
/featurebase/fb-logs/featurebase.log {
    missingok
    notifempty
    rotate 7
    daily
    compress
    postrotate
        pkill -HUP featurebase
    endscript
}
```

* Save the file as `featurebase`





4. Ensure that [logrotate](https://linux.die.net/man/8/logrotate) is installed and configured to run daily with cron. This should be the default after installation on most Linux systems. Check `/etc/cron.daily/logrotate` to make sure.

5. Add a new logrotate configuration file at `/etc/logrotate.d/featurebase` with the following contents:

```text
/var/log/molecula/featurebase.log {
    missingok
    notifempty
    rotate 7
    daily
    compress
    postrotate
        pkill -HUP featurebase
    endscript
}
```
