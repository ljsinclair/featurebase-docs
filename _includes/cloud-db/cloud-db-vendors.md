## What data storage vendors are available?

FeatureBase runs on the following vendor architecture:

* [AWS Simple Storage Service (S3)](https://aws.amazon.com/s3/){:target="_blank"}
* [Microsoft Azure](https://azure.microsoft.com/en-us/explore/global-infrastructure/availability-zones/){:target="_blank"}

| Feature | AWS S3 | Microsoft Azure |
|---|---|---|
| Architecture | ARM | AMD |
| Externalized storage | Supported | Not supported |
| Backups | S3 buckets | BLOB Storage that keeps the data within the cloud provider |
| FeatureBase Nodes (per shape) | 3 | 3 |
| Shape replica factor |   | 2 |
| Region | US-east-2 (Ohio) | eastus2 |

{: .note}
Azure uses internal SSDs (ephemeral storage) for your data. If FeatureBase nodes go down at once, data can be recovered from the latest backup.
