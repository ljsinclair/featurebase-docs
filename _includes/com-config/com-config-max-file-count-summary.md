Unix systems limit the number of simultaneously open files for a given process or user

The `max-file-count` parameter in `featurebase.conf` allows you to set a soft limit on files FeatureBase opens during operations.

When past this limit, FeatureBase will only keep files open for as long as required to write updates.
