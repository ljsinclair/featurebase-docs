---
title: MacOS file limits
layout: default
parent: Community troubleshooting
grand_parent: Community
---

# Issue - MacOS file limits

{% include /com-issues/com-issue-open-file-limit-summary.md %}

## Before you begin

* [Learn how to troubleshoot MacOS "too many open files" error](https://www.macobserver.com/tips/deep-dive/evade-macos-many-open-files-error-pushing-limits/){:target="_blank"}
* [Learn how to change file limits on MacOS](https://wilsonmar.github.io/maximum-limits/){:target="_blank"}
* Obtain SUDO privileges to the system

{: .important}
>Open file limit changes are affected by the following on MacOS:
* `ulimit` does not behave predictably because limits change between releases.
* System Integrity Protection (SIP) system resists attempts to change system settings.

{% include /com-issues/open-file-limit-recommend.md %}

## Solutions

### Alter FeatureBase max-file-limit

* [Alter max-file-limit](/docs/community/com-config/com-config-max-file-limit)

### Temporarily increase open file limit

{: .important}
These changes do not persist across reboots

* Open a CLI then run the following command:

```
launchctl limit maxfiles 262144 262144
```

## Persistent change to open file limit

Setup your system to run the `launchctl limit...` command on startup.

### Step 1 - Disable SIP

* Enter recovery mode by restarting MacOS while holding down CMD + R
* Open a CLI then run the following command:

```
csrutil disable
```
* Restart MacOS

### Step 2 - Create new `LaunchDaemons` files

New `LaunchDaemon` files can be setup to increase file limits.

* Open a CLI then CD to `/Library/LaunchDaemons/`
* Create a new file `limit.maxfiles.plist`
* Paste the following XML to the file:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>limit.maxfiles</string>
    <key>ProgramArguments</key>
    <array>
      <string>launchctl</string>
      <string>limit</string>
      <string>maxfiles</string>
      <string>262144</string>
      <string>262144</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>ServiceIPC</key>
    <false/>
  </dict>
</plist>
```

* Save the file.

## Step 3 - change ownership and tell system to run the file

* Run the following command to change ownership of the file:

```
chown root:wheel /Library/LaunchDaemons/limit.maxfiles.plist
```

* Run the following `launchd` command to launch the file at startup:

```
launchctl load -w /Library/LaunchDaemons/limit.maxfiles.plist
```

## Step 4 - Verify file limit has been changed

* Run the following command:

```
launchctl limit maxfiles
```

## Step 5 - Turn SIP back on

* Open Recovery Mode by restarting MacOS whilst pressing CMD + R
* Open a CLI and run the following command:

```
csrutil enable
```

* Restart MacOS

## Adjust kernel parameter files

You may also need to adjust the following kernel parameter files:
* `kern.maxfiles`
* `kern.maxfilesperproc`

[Learn how to adjust Kernel Parameters](https://developer.apple.com/library/archive/documentation/System/Conceptual/ManPages_iPhoneOS/man3/sysctl.3.html){:target="_blank"}

## Further information

* [Adjust file limits MacOS](https://gist.github.com/tombigel/d503800a282fcadbee14b537735d202c){:target="_blank"}
