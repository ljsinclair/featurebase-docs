---
title: Upload data
layout: default
parent: Manage tables
grand_parent: Cloud
nav_order: 2
---

# How do I upload data to FeatureBase Cloud?
{: .no_toc }


## Before you begin

{% include /cloud/cloud-before-begin.md %}
* [Create a database](/docs/cloud/cloud-databases/cloud-db-create)

## Naming standards

{% include /concepts/standard-naming-obj.md%}
{% include /cloud-table/cloud-standard-naming-table.md %}

## Step 1: Navigate to Upload Data

| Click **Databases** > database name > **Upload Data**. |

## Step 2: Select a file to upload

1. Click **Upload a file**.
2. Select a file from the file browser.
3. Click **Done**.

{: .note }
Currently, FeatureBase only supports .csv files. <br/>
FeatureBase assumes that the first line in the uploaded file is the header row. <br/>

## Step 3: Select column type for each column

{% include /cloud-table/cloud-summary-table-pk.md %}

1. Click on the kebab menu at the right side of the row of the targeted column.
2. Click **Update**.
3. Select a type from the **Type** dropdown menu.
4. Click **Update Column**.

{: .note }
FeatureBase will make the first column the ID column. <br/>
Column names are not editable once the file is uploaded. <br/>
User cannot procced until all column types have been selected.

## Step 4: Upload data to FeatureBase

1. Enter a name for the table.
2. (Optional) Click **DDL** which downloads a .sql file that contains the SQL create statement for creating table.
3. (Optional) Click **DML** which downloads a .sql file that contains the SQL bulk insert statement for inserting the data.
4. Click **Write my data**

## Further information

* [Create table API reference](https://api-docs-featurebase-cloud.redoc.ly/latest#operation/createTable)
* [Learn about querying in Cloud](/docs/cloud/cloud-query/cloud-query-data)