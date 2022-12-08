### Step 1: Download a FeatureBase release for your environment

FeatureBase supports MacOS (darwin), ARM and AMD (intel) processors.

* [Open the FeatureBase releases page on GitHub](https://github.com/FeatureBaseDB/FeatureBase/releases)
* Download release to the `/Downloads` directory.

### Step 2: Untar the install files to the FeatureBase directory

Open a terminal window then enter the following commands from your `user/home` directory to:
* create a FeatureBase directory
* untar the FeatureBase release to that directory

```
mkdir ~/featurebase
cd Downloads
tar xvfz featurebase-v1.3.0-community-<os><architecture>.tar.gz -C ~/featurebase
```

Where:
* <os> = linux or darwin (Apple Mac)
* <architecture> = AMD for intel, or ARM

### Step 3: Move the directories

* Enter the following commands to move the folders to the correct directory:

```
cd ~/featurebase
mv featurebase-*-<os><architecture>/ opt
mv idk-*-arm64 idk
```
