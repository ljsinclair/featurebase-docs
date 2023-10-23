---
title: Cloud database states
layout: default
parent: Manage databases
grand_parent: Cloud
nav_order: 6
---

# What states can my Database have?
{: .no_toc }

{% include /concepts/summary-db-states.md %}

{% include page-toc.md %}

## Before you begin

{% include /cloud/cloud-before-begin.md %}
* [Manage databases](/docs/cloud/cloud-databases/cloud-db-manage)

## Database states

| Status | Description | Further information |
|---|---|---|
| CREATING | FeatureBase Cloud has received the signal to start provisioning a database | [Create a cloud database](/docs/cloud/cloud-databases/cloud-db-create) |
| PROVISIONING | Following CREATING, system then provisions hardware, installs software, and performs other tasks to spin up the database. | [Create a cloud database](/docs/cloud/cloud-databases/cloud-db-create) |
| RESTORING | The state of restoring data from a backup | [Create a cloud database](/docs/cloud/cloud-databases/cloud-db-create) |
| RUNNING |  Created or updated database has been spun up and is ready for use. | [Learn about database shapes and their running costs](/docs/cloud/cloud-databases/cloud-db-shape) |
| BACKUP |  Creating a backup of the database. |  |
| FROZEN | There was a problem with backup and no new operations can be done on the database | [Contact support on Discord for help](https://discord.com/invite/bSBYjDbUUb){:target="_blank"} |
| DEPROVISIONING |  A user has chosen to delete the database so the system is de-provisioning services and spinning the database down. | [Delete a cloud database](/docs/cloud/cloud-databases/cloud-db-delete) |
| DELETED |  The state after deprovisioning completed successfully | [Delete a cloud database](/docs/cloud/cloud-databases/cloud-db-delete) |
| FAILED | Database action has failed to complete successfully. Unrecoverable. Data is lost or Database failed to be provisioned. [Contact support on Discord for help](https://discord.com/invite/bSBYjDbUUb){:target="_blank"} |


## Further information

* [Query the database state via the API](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/getDatabase)
