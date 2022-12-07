### Step 1: Download FeatureBase

Download the installer suitable for your environment:

[Download Featurebase from the Community repository in Github](https://github.com/FeatureBaseDB/FeatureBase/releases)

### Step 2: Untar the install files to the Featurebase directory

1. Open a terminal window
2. Enter the following command to untar the FeatureBase application files to `/username/featurebase`:

```
# tar xvfz featurebase-v1.3.0-community-<os><architecture>.tar.gz -C ~/featurebase
```

Where:
* <os> = linux or darwin (Apple Mac)
* <architecture> = AMD for intel, or ARM

### Step 3: Move the directories

* Enter the following commands to move the folders to the correct directory:

```
mv featurebase-*-community-darwin-arm64/ opt
mv idk-*-arm64 idk
```
