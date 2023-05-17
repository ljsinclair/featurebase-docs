---
title: Serverless limitations
layout: default
parent: Cloud troubleshooting
grand_parent: Cloud
nav_order: 4
---

# Issue - Known limitations of serverless databases

{% include /serverless/serverless-preview-warning.md %}

The following functionality is not yet supported by serverless databases:

* [SQL SELECT statements](/docs/sql-guide/statements/statement-select) using:
    * `GROUP BY` on [IDSET](/docs/sql-guide/data-types/data-type-idset) and [STRINGSET](/docs/sql-guide/data-types/data-type-stringset) data types  
    * `HAVING`  
    * `TOP`
    * `LIMIT`   
* [PQL Percentile](/docs/pql-guide/pql-read-percentile)
* [IDSETQ](/docs/sql-guide/data-types/data-type-idsetq) and [STRINGSETQ](/docs/sql-guide/data-types/data-type-stringsetq) data types
* Database snapshotting
* Database restoration from backup
{% include /serverless/serverless-worker-shape.md %}
{% include /serverless/serverless-worker-limits.md %}

## Cause

Serverless databases are in preview and future versions will support this functionality.

## Further information

* {% include contact-support.md %} to discuss FeatureBase serverless.
* [Learn about FeatureBase Serverless Databases](/docs/cloud/cloud-databases/cloud-db-serverless-home)