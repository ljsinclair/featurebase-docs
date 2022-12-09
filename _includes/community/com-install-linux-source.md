### Step 1: Download a FeatureBase release for your environment

FeatureBase supports MacOS (darwin), ARM and AMD (intel) processors.

* [Open the FeatureBase releases page on GitHub](https://github.com/FeatureBaseDB/FeatureBase/releases){:target="_blank"}
* Download release to the `/Downloads` directory.

### Step 2: Untar the install files to the FeatureBase directory

Open a terminal window then enter the following commands from your `user/home` directory to:
* create a FeatureBase directory
* untar the FeatureBase release to that directory

```
mkdir ~/featurebase
cd Downloads
tar xvfz featurebase-<version>-community-<os><architecture>.tar.gz -C ~/featurebase
```

Where:
* `<version>` is the FeatureBase version (e.g., v1.30.)
* `<os>` = linux or darwin for Apple Mac
* `<architecture>` = AMD for intel, or ARM

### Step 3: Move the files to new directories

* Enter the following commands to move the folders to a new directory:

```
cd ~/featurebase
mv featurebase-* opt
mv idk-* idk
```
