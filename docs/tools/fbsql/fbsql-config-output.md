---
title: FBSQL output flags
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 12
---

# FBSQL output flags reference

Configure FBSQL output including:
*

## Before you begin

{% include /fbsql/fbsql-before-begin.md %}
* [Install FBSQL](/docs/tools/fbsql/fbsql-install)

{% include /fbsql/fbsql-help-quit.md %}

## Syntax

```

[ (<meta-prefix>)
    <history-logs>
    <file-output-flags> |
    <write-messages-to-output-flags> |
    <query-buffer-flags>
] |
[ (<pset-prefix>)
    <pset-output-flags>
]
```

{% include /fbsql/fbsql-prefix-meta-flags.md %}

## History logs

| Flag | Description | Default | Additional information |
|---|---|---|---|
| `--history-path="<directory-name>"` | Save CLI and FBSQL interface execution history to new folder | `<user-home>.featurebase/fbsql_history` |  |

## File output flags

Output can be directed to files in the currently set directory.

| Flag | Description | Default | Additional information |
|---|---|---|---|
| `cd [<directory-name>]` | Set FBSQL file directory to $home or specified directory | Directory FBSQL was started |  |
| `i <filename>`<br/>`insert <filename>` | Run content of specified file immediately |  | [Run content in file](#run-content-in-file) |
| `w`<br/>`\write <filename>` | Write most recent query or query buffer to defined file |  |  |

## Write messages to output flags

Write specified text to specific destination:

| Flag | Destination |
|---|---|
| `echo <text>` | FBSQL interface |
| `qecho <text>` | Query output channel as defined by `[o|out] <filename>` output |
| `warn <text>` | FBSQL standard error channel |

## PSET prefix

PSET flags can be executed from the CLI or FBSQL interface:

| Interface | Prefix | Structure | Example |
|---|---|---|---|
| CLI | `fbsql [-P|--pset] <pset-meta-commands>` | PSET output flags structured as `flag="value"` | `fbsql --P border="1"` |
| FBSQL | `\pset <pset-meta-commands>` | Valid sequence of PSET output flag, argument and value if required | `\pset border 2` |

## PSET output flags

| Flags | Description | Default | Additional information |
|---|---|---|---|
| `border [0...3]` | Border for table output | 1 | [PSET border values](#query-border-values) |
| `[ x|expanded [on|off]]` | Change orientation of query results. | Off | [Query result orientation](#query-result-orientation) |
| `pset format [aligned | csv]` | Toggle query result format from column, row format to RFC 4180 standard CSV format | Aligned | [Query output format](#pset-query-output-format) |
| `pset location ['tz-identifier']` | Location for query result timestamps | local time zone | [Location timezone additional ](#location-timezone-additional)
| `pset t` <br/> `pset tuples_only` | Toggle storage of multiple values in a single variable. | off | [Tuples additional](#tuples-additional) |

## Additional information

{% include /fbsql/fbsql-flags-execution-extra.md %}

{% include /fbsql/fbsql-query-buffer-extra.md %}

### PSET defaults

```
border      1
expanded    off
format      aligned
location    Local
tuples_only off
```

### Query border values

| Value | Table border | Additional information |
|---|---|---|
| 0 | None | Default |
| 1 | Internal dividing lines |  |
| 2 | Table frame |  |
| 3 | Latex format dividing lines between rows if Add latex format dividing lines between rows | Requires Latex |

### Query result orientation

{: .note}
`\x [on | off]` can also be used to change result orientation

| Value | Column name | Data |
|---|---|
| on | Left column | Right column |
| off | Top row | Bottom rows |

### CSV output format

* Titles and footers are not printed.
* Header line with column names generated when `tuples_only` parameter is `off`
* End of line characters are system-dependent:

| OS | Description |EOL character |
|---|---|---|
| Linux<br/>MacOS | Single new-line character | `\n` |
| Windows | Carriage return and newline sequence |`\r\n` |

### Location time-zone additional

The optional time-zone can be set as follows:

| `<tz identifier>` | Description | Further information |
|---|---|---|
| `<none>` | Local time |  |
| `UTC` | UTC time |  |
| `region/city` | Region and city UTC offset | [UTC region/city offset values](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones){:target="_blank"}

### Tuples additional

`\pset tuples_only` toggles between regular and tuples output.

| Output | Query output |
|---|---|
| Regular | * CSV column headers<br/>* titles<br/>* Various footers |
| tuples_only | Table data |

## Examples

### Change query result orientation

```
\pset expanded on
```

Select statement:
```sql
select * from products;
```

Output:
```sql
 _id      | 1
 prodlist | pen
 price    | 2.50
 stock    | NULL
 _id      | 2
 prodlist | pencil
 price    | 0.50
 stock    | NULL
 _id      | 3
 prodlist | playpen
 price    | 52.50
 stock    | NULL
 _id      | 4
 prodlist | gold-plated earplugs
 price    | 122.50
 stock    | NULL
```

### Change FBSQL time-zone

```
\pset location 'Australia/Melbourne'
```

## Further information

* [Learn about RFC-4180 quoting rules](https://www.rfc-editor.org/rfc/rfc4180){:target="_blank"}
* [Create products table](/docs/sql-guide/statements/statement-table-create#create-table-with-decimal-data-type)
