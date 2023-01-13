### Connection strings

| `--driver` | example `--connection-string` |
|---|---|
| mysql | `'myusername:password@(10.0.0.1:3306)/mydb'` |
| mysql | `'server=sqldb.myserver.com;userid=mysqlusername;password=secret;database=mydbname'` |
| postgres | `'postgresql://postgres:password@localhost:5432/molecula?sslmode=disable'` |
| postgres | `'user=postgres password=password host=localhost port=5432 dbname=molecula sslmode=disable'` |

* [Learn more about `MySQL` connection strings](https://github.com/go-sql-driver/mysql#dsn-data-source-name)
* [Learn more about `SQL-Server` connection strings](https://github.com/denisenkom/go-mssqldb#connection-parameters-and-dsn)
