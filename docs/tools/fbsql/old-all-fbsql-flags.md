---
title: fbsql delete when ready
layout: default
parent: Tools
has_children: true
nav_order: 1
has_toc: false
---

## fbsql flags

The following flags can be provided when running fbsql. None of the flags are required to start fbsql.

| Moved | Flag | Description | Default |
|---|---|---|






## Usage

### Entering SQL Commands

In normal operation, fbsql provides a prompt with the name of the database to which fbsql is currently connected, followed by the string =#. For example:

```
$ fbsql -d testdb
FeatureBase CLI ()
Type "\q" to quit.
testdb=#
```

At the prompt, the user can type in SQL commands. Ordinarily, input lines are sent to the server when a command-terminating semicolon is reached. An end of line does not terminate a command. Thus commands can be spread over several lines for clarity. If the command was sent and executed without error, the results of the command are displayed on the screen.

### Meta-Commands

Anything you enter in fbsql that begins with an unquoted backslash is a fbsql meta-command that is processed by fbsql itself. These commands make fbsql more useful for administration or scripting. Meta-commands are often called slash or backslash commands.

The format of an fbsql command is the backslash, followed immediately by a command verb, then any arguments. The arguments are separated from the command verb and each other by any number of whitespace characters.

To include whitespace in an argument you can quote it with single quotes.

If an unquoted colon (:) followed by a fbsql variable name appears within an argument, it is replaced by the variable's value, as described in SQL Interpolation below. The forms :'variable_name' and :"variable_name" described there work as well.

Parsing for arguments stops at the end of the line, or when another unquoted backslash is found. An unquoted backslash is taken as the beginning of a new meta-command.

Some of the meta-commands act on the current query buffer. This is simply a buffer holding whatever SQL command text has been typed but not yet sent to the server for execution. This will include previous input lines as well as any text appearing before the meta-command on the same line. The query buffer will only ever hold one complete or partial query

The following meta-commands are defined:


#### change directory

```shell
\cd [ directory ]
```

Changes the current working directory to directory. Without argument, changes to the current user's home directory.

####  list databases
```shell
\d [ tablename ]
```

Lists all of the objects in the database your are connected to (currently, only tables are listed). For `tablename`, show all columns and their types.

####  list tables

```shell
\dt
```

Lists the tables in the database your are connected to.

####  list views

```shell
\dv
```

Lists the views in the database your are connected to.

####  print output

```shell
\echo text
```

Prints the argument to standard output, followed by a newline.

####  local file reference

```shell
\file filename [alias]
```

Adds a reference to `filename` to the the query buffer. An optional alias can be provided in order to simplify referencing a long or complex file name.

Local file references can be use in [BULK INSERT](/docs/sql-guide/statements/statement-insert-bulk/) statements with `INPUT STREAMX`. For example, the following commands will insert contents from local file `insert_test.csv` using an alias `icsv`:

```
fbsql=# \file insert_test.csv icsv
fbsql-# bulk replace
     -#     into insert_test (_id, int1, string1, timestamp1)
     -#     map (0 id, 1 int, 2 string)
     -#     transform (@0, @1, @2, current_timestamp)
     -# from
     -#     'icsv'
     -# with
     -#     format 'CSV'
     -#     input 'STREAMX';
```

####  use a file for commands

```shell
\i or \include filename
```

Reads input from the file filename and executes it as though it had been typed on the keyboard.

####  list databases

```shell
\l or \list
```

Lists the databases on the server

####  save results to file

```shell
\o or \out [ filename ]
```

Arranges to save future query results to the file **filename**. If sent without the **filename**, the output will return to standard output

####  print query buffer

```shell
\p or \print
```

Prints the current query buffer to the standard output. If the current query buffer is empty, the most recently executed query is printed instead.

####  set options

```shell

```

This command sets options affecting the output of query result tables. option indicates which option is to be set. The semantics of value vary depending on the selected option. For some options, omitting value causes the option to be toggled or unset, as described under the particular option. If no such behavior is mentioned, then omitting value just results in the current setting being displayed.

`\pset` without any arguments displays the current status of all printing options.

Adjustable printing options are:

```
border
```







####  quit

```shell
\q or \quit
```

Quits the fbsql program.

####  clear query buffer

```shell
\r or \reset
```

Resets (clears) the query buffer.

####  set variables

```shell
\set [ name [ value [ ... ] ] ]
```

Sets the fbsql variable **name** to **value**, or if more than one value is given, to the concatenation of all of them. If only one argument is given, the variable is set to an empty-string value. To unset a variable, [use the `\unset` command](#unset-variable).

`\set` without any arguments displays the names and values of all currently-set fbsql variables.

Variable names are case-sensitive.

####  timing

```shell
\timing [ on | off ]
```

With a parameter, turns displaying of how long each SQL statement takes on or off. Without a parameter, toggles the display between on and off.

####  unset variables

```shell
\unset name
```

Unsets (deletes) the fbsql variable **name**.

####  write buffer to file

```shell
\w or \write filename
```

Writes the current query buffer to the file **filename**. If the current query buffer is empty, the most recently executed query is written instead.

####  warn to standard error channel

```shell
\warn text
```

This command is identical to \echo except that the output will be written to fbsql's standard error channel, rather than standard output.

####  re-execute query buffer

```shell
\watch [ seconds ]
```

Repeatedly execute the current query buffer until interrupted or the query fails. Wait the specified number of seconds (default 2) between executions.

If the current query buffer is empty, the most recently sent query is re-executed instead.

####  set table formatting mode

```shell
\x [ on | off ]
```

Sets or toggles expanded table formatting mode. As such it is equivalent to \pset expanded.

####  send command to the shell

```shell
\! [ command ]
```

The **command** is simply passed literally to the shell.

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
