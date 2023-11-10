---
title: Example Impala data source
layout: default
parent: fbsql loader examples
grand_parent: Tools
nav_order: 1
---
# Example Impala data source for fbsql `loader` command

{% include /fbsql/fbsql-loader-eg-source-summary.md %}

## Before you begin

* [Learn about Apache Impala](https://impala.apache.org/){:target="_blank"}
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
* Add the following keys and values and substitute your Impala connection string as directed:

```toml
table = "loader-target"
query = "select idkey, intf, stringf, idf, stringsetf, idsetf from <impaladb>.impala_table;"
driver = "impala"
connection-string = "impala://<connection-string>/database=<source-db-name>"
batch-size = 1
```

{% include /fbsql/fbsql-loader-config-fields-impala-postgres.md %}

* Save and exit nano.

## Next step

* [Import data from your data source](/docs/tools/fbsql-examples/fbsql-eg-ingest.md )

## Further information

* [Learn about fbsql](/docs/tools/fbsql/fbsql-home)
* [Learn how to install fbsql](/docs/tools/fbsql/fbsql-install)
* [Learn about fbsql TOML configuration](/docs/tools/fbsql/fbsql-loader-config)
