---
title: fbsql-loader-impala
layout: default
parent: fbsql
grand_parent: Tools
nav_order: 2
---
# Impala Loader

If fbsql is provided the `--loader-impala=filename` flag, it will run in non-interactive mode. Based on the configuration provided in filename, fbsql will query Impala, read tuples returned, and submit them to FeatureBase via `BULK INSERT` statements. In this mode, fbsql processes messages until all tuples returned by the query are processed.

## Impala Specific Configuration Options

### General
The table below holds the key/value pairs supported in the TOML configuration file if you are connecting to Impala: 

| Key | Description | Example Value | Default |
|---|---|---|---|
| connection-string | Impala connection string used to connect to the Impala source. | `"impala://localhost:21050/database=testdb"` | |
| query | The query sent to Impala to get the data to store in FeatureBase. | `"select col1, col2, col3 from impala_table;"` | |
| driver | This must be specified and set to `"impala"` | `"impala"` | |

### Fields
The table below holds the key/value pairs supported in the TOML fields array if you are connecting to Impala:

| Key | Description | Example Value | Default |
|---|---|---|---|
| `source-column` | The column name in the response from `query` that should be used to populate the current field. If `source-column` is not provided, it will default to the value provided in `name`. | `"col1"` | value of `name` |

## Example

Impala `CREATE TABLE` statement:
```sql
CREATE TABLE testdb.impala_table (
    idkey int, 
    intf int, 
    stringf string, 
    idf int, 
    stringsetf string, 
    idsetf string);
```

Impala `INSERT` statement:
```sql
INSERT INTO testdb.impala_table VALUES
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

FBSQL configuration file pointed to by `--loader-impala`:
```toml
table = "tbl"
query = "select idkey, intf, stringf, idf, stringsetf, idsetf from testdb.impala_table;"
driver = "impala"
connection-string = "impala://localhost:21050/database=testdb"
batch-size = 1

[[fields]]
name		= "idkey"
source-type	= "string"
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