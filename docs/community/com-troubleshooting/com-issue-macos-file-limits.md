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
>Making changes to the open file limit are affected by the following issues on MacOS:
* `ulimit` does not behave predictably on MacOS because limits change between releases.
* System Integrity Protection (SIP) system resists attempts to change system settings.

## Temporarily increase open file limit

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

* Run the following command to change ownershit of the file:

```
chown root:wheel limit.maxfiles.plist
```

* Setup `launchd` to launch the file at startup with one of the following commands:

* `chown root:wheel /Library/LaunchDaemons/limit.maxfiles.plist` OR
* `launchctl load -w /Library/LaunchDaemons/limit.maxfiles.plist`

## Step 4 - Verify file limit has been changed

* Run the following command:

```
ulimit -a
```

## Step 5 - Turn SIP back on

* Open Recovery Mode by restarting MacOS whilst pressing CMD + R
* Open a CLI and run the following command:

```
csrutil enable
```

* Restart MacOS

## Further information

You may also need to use `sysctl` to adjust `kern.maxfiles` or `kern.maxfilesperproc` kernel parameter files.

* [Learn how to adjust Kernel Parameters](https://developer.apple.com/library/archive/documentation/System/Conceptual/ManPages_iPhoneOS/man3/sysctl.3.html){:target="_blank"}
