The values returned depend on the position of the `SET` function within the query:

| Position | Returns | Example |
|---|---|---|
| Within `<select-list>` | True or False | `SELECT <set-function> (<set-column>, <value>) FROM <table-name>;` |
| Within `WHERE` clause | Row | `SELECT * FROM <table-name> WHERE <set-function> (<set-column>,<set-value>)` |
