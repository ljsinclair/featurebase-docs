### Ingest data from SQL server database

Use `SELECT` query at the command-line to import data from a source SQL-Server database table and create in FeatureBase.

```shell
molecula-consumer-sql \
	--connection-string 'server=sqldb.myserver.com;userid=mysqlusername;password=secret;database=mydbname' \
	--featurebase-hosts 10.0.0.1:10101 \
	--batch-size 1000000 \
	--driver=mssql \
	--index=myindexname \
	--id-field=id \
	--row-expr 'SELECT tableID as id__ID, zipcode as zipcode__String limit 10'
```
