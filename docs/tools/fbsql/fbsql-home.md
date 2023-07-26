---
title: CLI SQL tool
layout: default
parent: Tools
has_children: true
nav_order: 1
has_toc: false
---

<!-- look at https://github.com/FeatureBaseDB/sql-examples/blob/main/data/spotify/readme.md for in context examples that explain stuff that's in here-->

# How do I run SQL queries from the command-line?

{% include /fbsql/fbsql-summary.md %}

## Before you begin

{% include /fbsql/fbsql-before-begin.md %}

## How do I install FBSql?

* [Learn How To Install fbsql](/docs/tools/fbsql/fbsql-install)

## How do I connect to a FeatureBase database?

You can connect to databases in three ways:
* [Connect to a FeatureBase cloud database](/docs/tools/fbsql/fbsql-connect-cloud-db)
* [Connect to a FeatureBase community database](/docs/tools/fbsql/fbsql-connect-com-db)

## How do I run queries?

You can run any valid SQL query against a connected FeatureBase database

* [Learn how to run SQL on FBSQL](/docs/tools/fbsql/fbsql-running-sql.md)

## How do I load values to FBSQL

* [Learn about FBSql loaders](/docs/tools/fbsql/fbsql-loaders)

## FBSQL meta command reference

Information on FBSQL meta commands are found in the following files:

* [FBSQL scripting reference](/docs/tools/fbsql/fbsql-scripting)
* [FBSQL printing configuration](/docs/tools/fbsql/fbsql-config-pset)
* [FBSQL variable configuration](/docs/tools/fbsql/fbsql-set-variable)

### Entering SQL Commands

In normal operation, fbsql provides a prompt with the name of the database to which fbsql is currently connected, followed by the string =#. For example:

```
$ fbsql -d testdb
FeatureBase CLI ()
Type "\q" to quit.
testdb=#
```

At the prompt, the user can type in SQL commands. Ordinarily, input lines are sent to the server when a command-terminating semicolon is reached. An end of line does not terminate a command. Thus commands can be spread over several lines for clarity. If the command was sent and executed without error, the results of the command are displayed on the screen.


## Examples

### Starting fbsql with FeatureBase Cloud

#### With command-line flags
```
fbsql --host="https://query.featurebase.com" \
  --email="user@example.com" \
  --password="a1b2c3d4e5f6"
```
```
fbsql --host="https://query.featurebase.com" \
  --api-key="asdf-f345-sg-hjyjk-345323"
```

#### With a configuration file

```
fbsql --config=cloud.toml
```

where the contents of `cloud.toml` look like:

```
host = "https://query.featurebase.com"
email     = 'user@example.com'
password  = 'a1b2c3d4e5f6'
```

### Starting fbsql with FeatureBase Community

#### With command-line flags
```
fbsql --host="localhost" \
  --port=10101
```

#### With a configuration file

```
fbsql --config=community.toml
```

where the contents of `community.toml` look like:

```
host = "localhost"
port = "10101"
```

### Run SQL in fbsql from a local file

The following examples assume the presence of a file called `example.sql` containing:

```
create table people (_id id, name string, age int);
insert into people values (1, 'Amy', 42), (2, 'Bob', 27), (3, 'Carl', 33);
select * from people;
```

#### Using the --file flag
- example of running sql from a file (--file)

```
fbsql --config=community.toml \
  --file example.sql
```

Will result in the following output:

```
Host: http://localhost:10101


 _id | name | age
-----+------+-----
   1 | Amy  |  42
   2 | Bob  |  27
   3 | Carl |  33
```

#### Using the \include meta-command

```
fbsql=# \include example.sql

 _id | name | age
-----+------+-----
   1 | Amy  |  42
   2 | Bob  |  27
   3 | Carl |  33

fbsql=#
```

## Further Information

* [FBSQL Data Loaders](/docs/tools/fbsql/fbsql-loaders)
