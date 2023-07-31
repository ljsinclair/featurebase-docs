---
title: FBSQL file flag reference
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 11
---
# FBSQL file flags reference



Interface commands are executable from the FBSQL interface and also known as:
* meta-commands
* slash or backslash commands

## Before you begin

* [Install FBSQL](/docs/tools/fbsql/fbsql-install)
* Connect to `fbsql` interface:
  * Open a CLI then enter `fbsql`, or
  * [Connect to cloud database](/docs/tools/fbsql/fbsql-connect-cloud-db)
  * [Connect to community database](/docs/tools/fbsql/fbsql-connect-community-db)

## Syntax

```
<meta-prefix>
  [
    [cd [<directory-name>]] |
    [file <file-name> [<alias>]] |
    [[i|include] <filename-to-run> ] |
    [[w|write <filename-for-buffer>]]
  ]
```

{% include /fbsql/fbsql-meta-prefix.md %}

## File flags

| Flag | Description | Additional information |
|---|---|---|
| `cd [<directory-name>]` | CD to a specified directory | Omit `<directory-name>` to CD to user `$home` |
| `file <file-name> [<alias>]` | Add <filename> or optional <alias> to query buffer which can be used to reference a filename | [\file example](#create-filename-alias)
| `i <filename-to-run>`<br/>`include <filename-to-run>` | Immediately run the contents of the specified file |  | [File formats](#file-formats) |
| `w <filename-for-buffer>`<br/>`write <filename-for-buffer>` | Write contents of FBSQL buffer to specified file |


## Additional information

{% include /fbsql/fbsql-flags-execution-extra.md %}

### File formats

Note about:
file formats supported
internal syntax (there's a bunch in the connection pages)
also covered in sql running page so may be an include too

## Examples

### Create file with SQL

Create `docviewtest.sql` and add the following SQL statement:

```sql
SELECT * from doctest where _id = 0;
```

### Create filename alias

```
\file docviewtest.sql mynewview
```

Use the alias in a SQL statement:

```sql
CREATE VIEW docview AS :mynewview;
```
