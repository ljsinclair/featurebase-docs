---
title: Impala data source example
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 21
---
# Impala data source example for fbsql loader

This example provides:
* valid SQL to create a table and insert data
* a TOML configuration file that will be used by the fbsql `loader` command to load data from the Impala table to a target in FeatureBase.

## Before you begin

* Create an Impala Database
* Obtain your Impala connection string
* [Create a FeatureBase Cloud database](/docs/cloud/cloud-databases/cloud-db-manage)
* [Create target table](/docs/sql-guide/examples/sql-eg-table/sql-eg-table-create-impala-postgres)

## Step 1 - Create data source

* Connect to your Impala database
* Create the source table:
```sql
CREATE TABLE testdb.impala_table (
    idkey int,
    intf int,
    stringf string,
    idf int,
    stringsetf string,
    idsetf string);
```
* Insert data to the source table:
```sql
INSERT INTO testdb.impala_table VALUES
 (0, 0, 'a', 0, 'a', '3'),
 (1, 0, 'a', 0, 'c', '4'),
 (2, 0, 'a', 0, 'd', '5');
```

## Step 2 - Create TOML configuration file

* Open a terminal then run `nano impala-import.toml`
* Add the following keys and values:

```toml
table = "loader-target"
query = "select idkey, intf, stringf, idf, stringsetf, idsetf from <impaladb>.impala_table;"
driver = "impala"
connection-string = "impala://<connection-string>/database=<source-db-name>"
batch-size = 1
```

{% include /fbsql/fbsql-loader-config-fields-impala-postgres.md %}

## Next step

* [Import data from your data source](/docs/tools/fbsql/fbsql-loader-eg-generic-command.md )

## Further information
* [Learn about fbsql](/docs/tools/fbsql/fbsql-home)
* [Learn how to install fbsql](/docs/tools/fbsql/fbsql-install)
* [Learn about fbsql TOML configuration](/docs/tools/fbsql/fbsql-loader-config)
