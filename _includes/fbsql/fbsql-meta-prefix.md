## Meta-command prefix

Meta commands can be executed from the CLI or within the FBSQL interface.

| Interface | Prefix | Structure | Example |
|---|---|---|---|
| CLI | `fbsql...-[c|-command] <meta-command>` | Meta-command flags enclosed in single or double quotes | `fbsql --command "\print"` |
| FBSQL | `\<meta-command>` | One or more meta-command flags and arguments separated by `\` backslash character | `\print \echo "this is a test"` |
