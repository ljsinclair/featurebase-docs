## Issues

* Memory issues whilst developing and testing your FeatureBase database
* Limits on simultaneously open files for given process or user

## Causes

Unix systems may:
* limit the number of simultaneously open files for a given process or user
* limit the number of memory-mapped regions allowed in a process

FeatureBase Community may exceed these limits because it splits the database into a potentially large number of files which are open simultaneously.

## Solution

You may decide to:
* Temporarily change system limits during development and testing
* Make changes that persist across restarts

{: .note}
FeatureBase recommends an open file limit of 256k
