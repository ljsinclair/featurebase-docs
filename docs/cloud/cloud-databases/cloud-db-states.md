---
title: Cloud database states
layout: default
parent: Manage databases
grand_parent: Cloud
nav_order: 4
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
| PROVISIONING |  Provisioning hardware, installing software, and other tasks to spin up the database. | [Create a cloud database](/docs/cloud/cloud-databases/cloud-db-create) |
| RUNNING |  Created or updated database is ready for use. |  |
| UPDATING |  Hardware changes or software patches are in progress. |  |
| DEPROVISIONING |  A user has chosen to delete the database so the system is de-provisioning services and spinning the database down. | [Delete a cloud database](/docs/cloud/cloud-databases/cloud-db-delete) |
| FAILED | Database action has failed to complete successfully. {% include contact-support.md %} to help with this issue. |

## Further information

* [Query the database state via the API](https://api-docs-featurebase-cloud.redoc.ly/v2#operation/getDatabase)
