---
title: Running SQL queries
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 4
---

# How do I run SQL queries with FBSQL?

Valid SQL queries can be run directly in the FBSQL interface or via defined files

## Before you begin

* [Install FBSQL](/docs/tools/fbsql/fbsql-install)
* [Connect to FeatureBase database with FBSQL](/docs/tools/fbsql/fbsql-connect-db)
* [SQL Guide](/docs/sql-guide/sql-guide-home)

{% include /fbsql/fbsql-help.md %}

## Syntax

```sh
(fbsql | \ [
    (-[c|connect dbname])
    (-[d|-dbname] <database-name>) |
    (-[i|-include] <filename.sql>) |
  ]
  (<sql-statement>)
```

## Arguments

| Argument | Description | Default | Additional information |
|---|---|---|---|
| `-d`<br/>`--dbname` | Specify a database to connect to |  |  |
| `-i <filename.sql>`<br/>`--include <filename.sql>` | Run SQL statements from file |  |  |


| `-f`<br>`--file` | Read commands from the file **filename**, rather than standard input.
This option can be repeated with the `-c` option.
All `-c` options will be processed before all `-f` options are processed.
When either `-c` or `-f` is specified, fbsql does not read commands from standard input;
instead it terminates after processing all the `-c` and `-f` options in sequence.
Except for that, this option is largely equivalent to the meta-command `\i`. | |



## Examples

### Table definition and INSERT statements

The following statements can be run direct from the FBSQL interface or saved to a file.

```sql
CREATE TABLE people (_id id, name string, age int);
INSERT INTO people VALUES (1, 'Amy', 42), (2, 'Bob', 27), (3, 'Carl', 33);
```

### Connect to database then Run SQL from file

### Run SQL statement from FBSQL interface

```sql
select * from people;
```

### Run SQL from file using meta command

Create `select_all_people.sql`:
```tex
select * from people;
```

Run the SQL from the file in the FBSQL interface
```sql
\include select_all_people.sql
```

### Results for both methods

```
 _id | name | age
-----+------+-----
   1 | Amy  |  42
   2 | Bob  |  27
   3 | Carl |  33
```
