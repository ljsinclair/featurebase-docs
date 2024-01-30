Queries on `SET` and `SETQ` data return unexpected results:
* `SELECT...DISTINCT` returns the number of fields, not the number of unique values
* `SELECT...GROUP BY` returns the array of values in each field
