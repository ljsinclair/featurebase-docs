---
title: SQL ingester reference
layout: default
parent: Import data
grand_parent: Community
nav_order: 5
---

The SQL ingester tool selects data from a MSSQL, MySQL or Postgres database table using a SQL endpoint.

Once your SQL file(s) are constructed, they can be ingested by FeatureBase using the `molecula-ingest-csv` ingester.

Source column names are used to specify column names for each record.

## Syntax

```shell
molecula-consumer-sql \
  {--connection-string '{sql-endpoint}'} \
	--pilosa-hosts 10.0.0.1:10101 \
	--batch-size 1000000 \
	--driver=mssql \
	--index=myindexname \
	--id-field=id \
	--row-expr 'SELECT tableID as id__ID, zipcode as zipcode__String limit 10'
```

## Arguments



## Additional information



## Examples



```shell
molecula-consumer-sql \
	--connection-string 'server=sqldb.myserver.com;userid=mysqlusername;password=secret;database=mydbname' \
	--pilosa-hosts 10.0.0.1:10101 \
	--batch-size 1000000 \
	--driver=mssql \
	--index=myindexname \
	--id-field=id \
	--row-expr 'SELECT tableID as id__ID, zipcode as zipcode__String limit 10'
```
