## Prefix

Commands can be executed from the CLI or the FBSQL interface using the appropriate prefix flag

| Interface | Prefix | Structure | Example |
|---|---|---|---|
| CLI | `fbsql...-[c|-command] <meta-command>` | Meta-command flags enclosed in single or double quotes | `fbsql --command "\print"` |
| FBSQL | `\<meta-command>` | One or more meta-command flags and arguments separated by `\` backslash character | `\print \echo "this is a test"` |

{: note}
Use `\!` in the FBSQL interface to execute CLI commands
