### Step 1 - Establish the correct release to install

* Open [FeatureBase releases on GitHub](https://github.com/FeatureBaseDB/FeatureBase/releases){:target="_blank"}
* Make note of the:
  * version (e.g., 3.32.0)
  * kernel (darwin or linux)
  * processor (arm or amd)

### Step 2 - Download the release

There are two ways to download the release:

| Method | Instructions | Destination |
|---|---|---|
| Browser | Download a [releases on GitHub](https://github.com/FeatureBaseDB/FeatureBase/releases){:target="_blank"}. | Default downloads directory |
| Terminal | Substitute the version, kernel and processor in the following command:<br/>`curl -L https://github.com/FeatureBaseDB/featurebase/releases/download/v<version>/featurebase-v<version>-<kernel>-<processor>64.tar.gz -o featurebase.tgz` | featurebase.tgz |

### Step 2: Untar release files

* Open a terminal then create a destination directory for the release:

```
mkdir featurebase
```

* CD to the download directory then run the following command:

```
tar xvfz featurebase.tgz -C ~/featurebase
```

### Step 3: Setup application directory

* CD to the `featurebase` directory
* Setup the application directory using the following commands:

```
mv featurebase-* opt
mv idk-* idk
```
