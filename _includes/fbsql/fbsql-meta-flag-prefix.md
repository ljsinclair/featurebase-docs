## Meta-command flag prefix

Meta-command flags can be run from the FBSQL interface or CLI using the an appropriate prefix:

| Interface | Prefix | Additional information | Example |
|---|---|---|---|
| FBSQL | `\` | One or more meta-command flags and arguments separated by `\` backslash character | `\print \echo "this is a test"` |
| CLI | `fbsql...-[c|-command]` | Meta-command flags enclosed in single or double quotes | `fbsql --command "\print"` |
