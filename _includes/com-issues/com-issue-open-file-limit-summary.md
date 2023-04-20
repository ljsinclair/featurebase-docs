## Issues

Unix systems may limit the number of simultaneously open files for a given process or user

## Cause

FeatureBase Community may exceed open file limits because:
* it splits the database into a potentially large number of files
* which are open simultaneously.

## Solution

You may decide to:
* Temporarily change system limits during development and testing
* Make changes that persist across restarts

{: .note}
FeatureBase recommends an open file limit of 256k
