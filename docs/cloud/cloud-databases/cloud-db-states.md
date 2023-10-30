---
title: Cloud database states
layout: default
parent: Manage databases
grand_parent: Cloud
nav_order: 10
---

# What states can my Database have?
{: .no_toc }

{% include /concepts/summary-db-states.md %}

{% include page-toc.md %}

## Before you begin

{% include /cloud/cloud-before-begin.md %}
* [Manage databases](/docs/cloud/cloud-databases/cloud-db-manage)
* [Create small database](/docs/cloud/cloud-databases/cloud-db-create-small)
* [Create sample database of 1 million records](/docs/cloud/cloud-databases/cloud-db-create-sample)
* [Create custom database](/docs/cloud/cloud-databases/cloud-db-create-custom)

## Database states

| Status | Description | Additional information |
|---|---|---|
| CREATING | FeatureBase Cloud has received the signal to start provisioning a database | |
| PROVISIONING | Following CREATING, system then provisions hardware, installs software, and performs other tasks to spin up the database. |  |
| RESTORING | The state of restoring data from a backup |  |
| RUNNING |  Created or updated database has been spun up and is ready for use. |  |
| BACKUP |  Creating a backup of the database. |  |
| FROZEN | There was a problem with backup and no new operations can be done on the database | [Contact support on Discord for help](https://discord.com/invite/bSBYjDbUUb){:target="_blank"} |
| DEPROVISIONING |  A user has chosen to delete the database so the system is de-provisioning services and spinning the database down. | [Delete a cloud database](/docs/cloud/cloud-databases/cloud-db-delete) |
| DELETED |  The state after deprovisioning completed successfully | [Delete a cloud database](/docs/cloud/cloud-databases/cloud-db-delete) |
| FAILED | Database action has failed to complete successfully. Unrecoverable. Data is lost or Database failed to be provisioned. | [Contact support on Discord for help](https://discord.com/invite/bSBYjDbUUb){:target="_blank"} |


## Further information

* [Query the database state via the API](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/getDatabase)
