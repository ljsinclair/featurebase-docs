---
title: FBSQL config reference
layout: default
parent: CLI SQL tool
grand_parent: Tools
nav_order: 11
---

# FBSQL CLI commands reference

FBSQL configuration commands are run from the CLI.

## Before you begin

{% include /fbsql/fbsql-before-begin.md %}
* [Install FBSQL](/docs/tools/fbsql/fbsql-install
* Open a CLI then CD to `*/fbsql/featurebase`

{% include /fbsql/fbsql-help-quit.md %}

## Syntax

```
[fbsql | \]
  [
    <command-flags>
    <output-flags>
    <connection-flags>
    <file-flags>
  ]
```

{% include /fbsql/fbsql-required-args.md %}

## Optional arguments


## Command flags

| Flag | Description | Required | Additional information |
|---
| `-c`<br/>`--command` | Begin FBSQL command which includes one or more flags |  |

## Meta flags


## Set print flags



## Set variable flags


## File flags

| Flag | Description | Additional information |
|---|---|---|
| `-config <filename.toml>` | Read FBSQL commands from specified file |
| `-f <filename.ext>`<br/>`-file <filename.ext>` | Read commands from specified file | [File flag additional] |

### File flag additional

{: .note}
FBSQL commands are always placed first

| Purpose | file extension |
|---|---|
| SQL commands | `.sql` |
| FBSQL loader impala |  |
| FBSQL loader kafka |  |
| FBSQL loader postgres |  |






Flags:
  -c, --command --command     Command to run in non-interactive mode. Provide multiple flags to execute more than one command. All --command flags run before all `--file` flags.
      --config string         Configuration file to read from.
      --csv                   CSV (Comma-Separated Values) table output mode.
  -f, --file --command        File to run in non-interactive mode. Provide multiple flags to execute more than one file. All --command flags run before all `--file` flags.
  -h, --help                  help for fbsql
      --history-path string   path for history files.
      --kafka-config string   Kafka configuration file to read from.
      --password string       Password for FeatureBase Cloud access.
      --pset strings          Set printing option VAR to ARG (see \pset command). Use form: --pset=VAR[=ARG]



## Arguments

### Command and flag precedence

| Argument | Description | Execution order |
|---|---|---|
| `-c`<br/>`--command` | FBSQL executes commands from CLI without opening FBSQL interface. | 1 |
| `-f`<br/>`--file` | FBSQL executes commands without opening FBSQL interface | 2 |



| Argument | Description | Required | Additional information |
|---|---|---|---|
| `-h`<br/>`--help` | Display summary of configuration commands |  |  |
| `-c`<br/>`--command` | Run configuration commands from the CLI |  | [FBSQL command additional](#fbsql-command-additional) |
| `<meta-flags>` |  |  |  |
| `<print-flags>` |  |  |  |
| `<set-flags>` |  |  |  |


## Additional information

### FBSQL command additional






\[
  [o | output]
  [timing [ on | off ]]
  [unset <variable-name>]
  [x [on | off]]
]



## Arguments




| Argument | Description | Default | Required | Additional information |
|---|---|---|---|---|
| `\` | Unquoted backslash indicates a FBSQL command |  | For FBSQL commands | Not required for SQL statements |
| `-c`<br>`--command` |
| `i <filename>`<br/> `include <filename>` | Specify a file where commands are defined |  |  |  

Specifies that fbsql is to execute the given command string (enclosed in either single or double quotes). This option can be repeated and combined with the `-f` option. All `-c` options will be processed before all `-f` options are processed. When either `-c` or `-f` is specified, fbsql does not read commands from standard input; instead it terminates after processing all the `-c` and `-f` options in sequence. | |
| `--history-path` | File in which to store command history. This defaults to `.featurebase/fbsql_history` in the current user's home directory. | |
| `o` | set output channel |
| `timing [ on | off ]` | Toggle timing of display of SQL statement |
| `unset <variable-name>` | Delete the FBSQL variable of <variable-name> |
| `x [on | off]` | Toggle table formatting mode |  | Equivalent to ['\pset expanded'](/docs/tools/fbsql/fbsql-config/pset) |
