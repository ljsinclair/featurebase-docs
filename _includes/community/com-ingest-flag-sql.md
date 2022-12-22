## SQL ingest flags

| flag | data type | Description | Default |
|---|---|---|---|
| `--driver` | string | key used for finding go sql database driver | postgres |
| `--connection-string` | string | sql endpoint credentials | postgres://user:password@localhost:5432/defaultindex?sslmode=disable |
| `--row-expr` | string | sql + type description on input | |
| `--mds-address` | string | SQL-server [Master Data Services](https://learn.microsoft.com/en-us/sql/master-data-services/master-data-services-overview-mds?view=sql-server-ver16) address. |  |
| string array separator (MOVE)


| `--lookup-db-dsn` | string | Connection string for connecting to Lookup database. |  |

GLOBAL
| `--lookup-batch-size` | int | Number of records to batch before writing them to Lookup database. |  |
