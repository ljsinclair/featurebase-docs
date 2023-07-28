---
title: FBSQL set output ref
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 12
---

# Set output reference

Query output is set in the FBSQL interface.

## Before you begin

{% include /fbsql/fbsql-before-begin.md %}
* [Install FBSQL](/docs/tools/fbsql/fbsql-install)

{% include /fbsql/fbsql-help-quit.md %}

## Syntax

```
\pset
  [
    [border [0..3]] |
    [[x|expanded [on|off]]] |
    [format [aligned|csv]] |
    [location [timezone]] |
    [-[t|-tuples]_only]
  ]
```

## PSET flags

| Flags | Description | Default | Additional information |
|---|---|---|---|
| `\pset border [0...3]` | Border for table output | 1 | [PSET border values](#query-border-values) |
| `\pset [x|expanded] [on|off]` | Off | Change orientation of query results | [Query result orientation](#query-result-orientation) |
| `\pset format [aligned | csv]` | Toggle query result format from column, row format to RFC 4180 standard CSV format | Aligned | [Query output format](#pset-query-output-format) |
| `\pset location ['timezone']` | Location for query result timestamps | local time zone | [Location timezone additional ](#location-timezone-additional)
| `\pset t` <br/> `\pset tuples_only` | Toggle storage of multiple values in a single variable. | off | [Tuples additional](#tuples-additional) |

## Additional information

### `pset` defaults

```
border      1
expanded    off
format      aligned
location    Local
tuples_only off
```

### Query border values

| Value | Table border |
|---|---|
| 0 | None |
| 1 | Internal dividing lines |
| 2 | Table frame |
| 3 | Add latex format dividing lines between rows |

### Query result orientation

| Value | Column name | Data |
|---|---|
| on | Right column | Left column |
| off | Top row | Bottom rows |

### CSV output format

* Titles and footers are not printed.
* Header line with column names generated when `tuples_only` parameter is `off`
* End of line characters are system-dependent:

| OS | Description |EOL character |
|---|---|---|
| Linux<br/>MacOS | Single new-line character | `\n` |
| Windows | Carriage return and newline sequence |`\r\n` |

### Location timezone additional

The optional timezone can be set as follows:

| timezone | Description | Further information |
|---|---|---|
| <none> | Local time |  |
| `UTC` | UTC time |
| `region/city` | Region and city UTC offset | [UTC region/city offset values](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones){:target="_blank"}

### Tuples additional

`\pset tuples_only` toggles between regular and tuples output.

| Output | Query output |
|---|---|
| Regular | * CSV column headers<br/>* titles<br/>* Various footers |
| tuples_only | Table data |

## Further information

* [Learn about RFC-4180 quoting rules](https://www.rfc-editor.org/rfc/rfc4180){:target="_blank"}
