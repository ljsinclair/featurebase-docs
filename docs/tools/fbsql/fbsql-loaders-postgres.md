---
title: fbsql-loader-postgres
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 23
---

# PostgreSQL Loader

<!-- taken from original fbsql-loaders.md

Based on the configuration file provided as an argument to this flag, fbsql will query PostgreSQL and send the data to FeatureBase via BULK INSERT statements. In this mode, fbsql processes messages until all the tuples from PostgreSQL are loaded.
-->

If fbsql is provided the `--loader-postgres=filename` flag, it will run in non-interactive mode. Based on the configuration provided in filename, fbsql will query PostgreSQL, read tuples returned, and submit them to FeatureBase via `BULK INSERT` statements. In this mode, fbsql processes messages until all tuples returned by the query are processed.

## PostgreSQL Specific Configuration Options

### General
The table below holds the key/value pairs supported in the TOML configuration file if you are connecting to PostgreSQL:

| Key | Description | Example Value | Default |
|---|---|---|---|
| connection-string | PostgreSQL connection string used to connect to the PostgreSQL source. | `"postgres://user:password@localhost:5432/database?sslmode=disable"` | |
| query | The query sent to PostgreSQL to get the data to store in FeatureBase. | `"select col1, col2, col3 from pg_table;"` | |
| driver | This must be specified and set to `"postgres"` | `"postgres"` | |

### Fields
The table below holds the key/value pairs supported in the TOML fields array if you are connecting to PostgreSQL:

| Key | Description | Example Value | Default |
|---|---|---|---|
| `source-column` | The column name in the response from `query` that should be used to populate the current field. If `source-column` is not provided, it will default to the value provided in `name`. | `"col1"` | value of `name` |

## Example

PostgreSQL `CREATE TABLE` statement:
```sql
CREATE TABLE postgres_table (
    idkey int,
    intf int,
    stringf varchar(30),
    idf int,
    stringsetf varchar(30),
    idsetf varchar(30));
```

PostgreSQL `INSERT` statement:
```sql
INSERT INTO postgres_table VALUES
	(0, 0, 'a', 0, 'a', '3'),
	(1, 0, 'a', 0, 'c', '4'),
	(2, 0, 'a', 0, 'd', '5');
```

FeatureBase `CREATE TABLE` statement:
```sql
CREATE TABLE tbl (
    _id id,
    intf int,
    stringf string,
    idf id,
    stringsetf stringset,
    idsetf idset);
```

fbsql configuration file pointed to by `--loader-postgres`:
```toml
table = "tbl"
query = "select idkey, intf, stringf, idf, stringsetf, idsetf from postgres_table;"
driver = "postgres"
connection-string = "postgres://postgres_uesr:user_password@localhost:5432/mydatabase?sslmode=disable"
batch-size = 1

[[fields]]
name		= "idkey"
source-type	= "id"
primary-key	= true

[[fields]]
name		= "intf"
source-type	= "int"

[[fields]]
name		= "stringf"
source-type	= "string"

[[fields]]
name		= "idf"
source-type	= "id"

[[fields]]
name		= "stringsetf"
source-type	= "stringset"

[[fields]]
name		= "idsetf"
source-type	= "idset"
```

## Additional Resources
* [Learn about fbsql](/docs/tools/fbsql/fbsql-home)
* [Learn how to install fbsql](/docs/tools/fbsql/fbsql-install)
