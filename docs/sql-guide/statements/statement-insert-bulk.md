---
title: BULK INSERT
layout: default
parent: Statements
grand_parent: SQL guide
---

# BULK INSERT statement

BULK INSERT data from CSV, NDJSON, URL or streaming sources to a FeatureBase table.

## BNF diagrams

![expr](/assets/images/sql-guide/bulk_insert_stmt.svg)

### Column list
![expr](/assets/images/sql-guide/column_list.svg)

### Map list
![expr](/assets/images/sql-guide/map_list.svg)

### Transform clause
![expr](/assets/images/sql-guide/map_list.svg)

### With clause
![expr](/assets/images/sql-guide/bulk_insert_options.svg)
![expr](/assets/images/sql-guide/bulk_insert_option.svg)

## DDL syntax

```
BULK INSERT
  INTO
    table_name [(column_name,...)]
  MAP (position type_name,...)
  [TRANSFORM (expr,...)]
  FROM
    ['path/file_name' | 'URL' | x'records']
  WITH
    [
      [BATCHSIZE integer_literal]
      [ROWSLIMIT integer_literal]
      [INPUT ['path/file_name' | 'URL' | 'STREAM']]
      [FORMAT ['CSV' [HEADER_ROW]] | ['NDJSON' [ALLOW_MISSING_VALUES]]]
      ...
    ]
```

## Arguments

| Argument | Description | Further information |
|---|---|---|
| `INSERT` | Insert new records if the _id does not exist else update the record with the values passed. if a column is missing, its values are not updated | `REPLACE` can be used but is the same functionality |
| `table_name` | Name of target table |  |
| `column_name` | Valid columns belonging to `table_name`. First column must be defined `_id` column. System builds a column list from existing columns in `table_name` if columns are not specified. |  |
| `MAP` | MAP defines how the source data is read and the expected data types. Values from the MAP clause are placed directly into the columns specified in the `column_list`. | [Map examples](/docs/sql-guide/statements/statement-insert-bulk/#map-examples) |
| `position` | Ordinal position of value in source. |  |
| `type_name` | Data type of the value in source. |  |
| `TRANSFORM expr` | a list of expressions that are evaluated during execution for each row. | [TRANSFORM examples](/docs/sql-guide/statements/statement-insert-bulk/#transform-clause-1) |
| `FROM` | A single or multi-line string literal that specifies the source of data and are interpreted based on the INPUT option. |  |
| `'path/file_name'` | Valid path and file name for data source. | Not available for FeatureBase Cloud. |
| `'URL'` | Valid URL for data source. |  |
| `'records'` | CSV or NDJSON records as a string literal to be used with the `STREAM` option |  |
| `'STREAM'` | The contents of the literal read as though they were in a file.  | [STREAM quotation marks](#stream-quotation-marks) |
| `WITH` | Pass one or more statement level options. |  |
| `BATCHSIZE` | Specify the batch size of the BULK commit. Defaults to 1000. |  |
| `ROWSLIMIT` | Limit the number of rows processed in a batch. |  |
| `INPUT` | Set the type of input to `'FILE'`, `'URL'` or `'STREAM'`. | [FROM quotation mark examples for STREAM](#stream-quotation-examples-in-from) |
| `FORMAT` | Set the format of the source data to `'CSV'` or `'NDJSON'`. |  |
| `HEADER_ROW` | Optional `CSV` argument that will ignore the header in the source CSV file. |  |
| `ALLOW_MISSING_VALUES` | Optional `NDJSON` argument to ignore `null` data in valid MAP clause that would otherwise cause an error that stops processing. |  |

## TRANSFORM clause

* a list of valid SQL expressions that are used to specify data transformation before values are inserted.
* uses variables named for the ordinal position values are specified in the MAP clause.

{: .important}
The number of expressions in the column list and TRANSFORM clause must match.

* [TRANSFORM example](/docs/sql-guide/statements/statement-insert-bulk/#transform-examples)

## Examples

### MAP examples

| Input type | MAP expression for value in source column | Example |
|---|---|---|
| CSV | Integer offset | [BULK INSERT CSV example](/docs/sql-guide/statements/statement-insert-bulk-csv-example) |
| NDJSON | String [JsonPath expression](https://goessner.net/articles/JsonPath/index.html#e2) for the NDJSON value | [BULK INSERT NDJSON example](/docs/sql-guide/statements/statement-insert-bulk-ndjson-example) |

### TRANSFORM examples

| Map clause | TRANSFORM clause |
|---|---|
| `MAP (0 id, 1 int, 4 string)` | Variables: `@0`, `@1` and `@2` |

```sql
TRANSFORM (
    @0 + 10, -- offset the new _id value by 10
    @1,      -- pass through unchanged
    case     -- clean up state names
        when @2 = 'Texas' then 'TX' end
        when @2 = 'California' then 'CA' end
        else @2
    end
)
```
### FROM examples
#### Using STREAM argument
The contents of an inline stream string literal are treated as a file and read line-by-line.

Single line stream string literal

```
'this is a single-line string literal'
```

Multi-line stream string literal

Multi line (prepend with `x`)

```sql
x'this
is
a
multi-line
string
literal'
```

#### Using STREAM with quotation marks

FROM clause quotation marks must be escaped before the BULK statement is run, even when CSV values are quoted.

| Incorrect | Correct |
|---|---|
| `FeatureBase's speed` | `FeatureBase''s speed` |
| `""Time is money." – Benjamin Franklin."` | `"""Time is money."" – Benjamin Franklin."` |


<!-- COMMENTED OUT BECAUSE AS OF 2023-01-31 this is the same as INSERT

### BULK REPLACE from CSV file with TRANSFORM

```sql
bulk replace
    into insert_test (_id, int1, string1, timestamp1)
    map (0 id, 1 int, 2 string)
    transform (@0, @1, @2, current_timestamp)
from
    '/dev/queries/insert_test.csv'
with
    format 'CSV'
    input 'FILE';
```
-->

## Further information

* [BULK INSERT using CSV file](/docs/sql-guide/statements/statement-insert-bulk-csv-example)
* [BULK INSERT using NDJSON data source](/docs/sql-guide/statements/statement-insert-bulk-ndjson-example)
