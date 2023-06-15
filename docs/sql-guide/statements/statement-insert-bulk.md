---
title: BULK INSERT
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 4
---

# BULK INSERT statement
{: .no_toc }

BULK INSERT is a SQL statement that reads data from various source types, maps data locations and data types, performs optional lightweight data transformations, and loads data to a table [using INSERT statements](/docs/sql-guide/statements/statement-insert)

![expr](/assets/images/sql-guide/bulk_insert_steps.svg)

Sources can include:
* file
* URL
* inline blob

Supported formats include:
* CSV
* PARQUET
* NDJSON

{% include page-toc.md %}

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

## DML syntax

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
      [FORMAT
        ['CSV' [HEADER_ROW] [CSV_EMPTY_STRING_AS_NULL] [CSV_NULL_AS_NULL] [NULL_AS_EMPTY_SET]] |
        ['NDJSON' [ALLOW_MISSING_VALUES] [NULL_AS_EMPTY_SET]] |
        ['PARQUET' [NULL_AS_EMPTY_SET]]
      ]
      ...
    ]
```

## Arguments

| Argument | Description | Required? |Further information |
|---|---|---|---|
| `INSERT` | Insert new records if the `_id` does not exist else update the record with the values passed. Values are not updated for missing columns. | Yes | `REPLACE` can be used but is the same functionality |
| `table_name` | Name of target table | Yes |  |
| `column_name` | Valid columns belonging to `table_name`. First column must be defined `_id` column. System builds a column list from existing columns in `table_name` if columns are not specified. | Optional |  |
| `MAP` | Map expresses how the source data is mapped from its location and what datatype it should be outputted as. | Yes | [Map examples](#map-examples) |
| `position` | Ordinal position of value in source. |  |  |
| `type_name` | Data type of the value in source. |  | [Data types](/docs/sql-guide/data-types/data-types-home) |
| `TRANSFORM expr` | a list of expressions that are evaluated during execution for each row. | Optional | [TRANSFORM examples](/docs/sql-guide/statements/statement-insert-bulk/#transform-clause-1) |
| `FROM` | A single or multi-line string literal that specifies the source of data and are interpreted based on the INPUT option. | Yes |  |
| `'path/file_name'` | Valid path and file name for data source. | Optional | Not available for FeatureBase Cloud. |
| `'URL'` | Valid URL for data source. | Optional |  |
| `x'records'` | CSV or NDJSON records as a string literal. | Required for STREAM | Not supported for `FORMAT 'PARQUET'` |
| `WITH` | Pass one or more statement level options. | Optional |  |
| `BATCHSIZE` | Specify the batch size of the BULK commit. Defaults to 1000. | Optional |  |
| `ROWSLIMIT` | Limit the number of rows processed in a batch. | Optional |  |
| `INPUT` | Input values must match those used in the `FROM` clause |  |  |
| `'STREAM'` | The contents of the literal read as though they were in a file.  | Required for `FROM x'records'`<br/>Not supported for `PARQUET` Format | [STREAM quotation marks](#using-stream-with-quotation-marks) |
| `FORMAT` | Set the format of the source data to `'CSV'`, `'NDJSON'` or `'PARQUET'` | Optional | `'PARQUET'` does not support `INPUT (STREAM)` |
| `NULL_AS_EMPTY_SET` | Argument that will coerce all `NULL` values resulting from the `MAP` clause into `[]` (empty sets) for all target columns with `SET` datatypes | Optional |  |
| `HEADER_ROW` | `CSV` argument that will ignore the header in the source CSV file. | Optional |  |
| `CSV_EMPTY_STRING_AS_NULL` | `CSV` argument that will assign `""` value as `null` | Optional |  |
| `CSV_NULL_AS_NULL` | `CSV` argument that will assign `NULL` value as `null` | Optional |  |
| `ALLOW_MISSING_VALUES` | `NDJSON` argument that outputs a `NULL` value from the MAP clause if the path expression fails. | Optional |  |

## MAP clause
The Map clause expresses how the source data is mapped from its location and what datatype it should be outputted as. Values from the MAP clause are placed directly into the columns specified in the `column_list`.

### CSV Value Assignment
There are special assignments for certain literal values when inserting CSV data.

| Literal Value | Target Data Type | Resultant | Further information |
|---|---|---|---|
| `,,` or `,"",` | All unless explicitly listed | `NULL` | |
| `,,` or `,"",` | `string` | `''` (empty string) | if `CSV_EMPTY_STRING_AS_NULL` is used, the resultant becomes `NULL` |
| `,,` or `,"",` | `stringset` <br/>`idset` <br/>`stringsetq` <br/>`idsetq` | `NULL` | if `NULL_AS_EMPTY_SET` is used, the resultant becomes `[]` (empty set) |
| `,NULL,` | All unless explicitly listed | `'NULL'` (string literal) | if `CSV_NULL_AS_NULL` is used, the resultant becomes `NULL` |

### NDJSON Value Assignment
There are special assignments for certain literal values when inserting NDJSON data.

| Literal Value | Target Data Type | Resultant | Further information |
|---|---|---|---|
| `""` | `string` | `''` (empty string) | |
| `""` | `stringset`<br/>`stringsetq` | `['']` (set with empty string member) | |
| `null` | All unless explicitly listed | `NULL` | |
| `[]` | `stringset` <br/>`idset` <br/>`stringsetq` <br/>`idsetq` | `[]` (empty set) | |
| Value Missing () | All unless explicitly listed | `NULL` | This will only occur if using `ALLOW_MISSING_VALUES` |
| Value Missing () | `stringset` <br/>`idset` <br/>`stringsetq` <br/>`idsetq` | `NULL` | if `NULL_AS_EMPTY_SET` is used, the resultant becomes `[]` (empty set). This will only occur if using `ALLOW_MISSING_VALUES` |

## TRANSFORM clause

The `TRANSFORM` clause is a list of valid SQL expressions that are used to specify data transformation before values are inserted. The variables to transform are named based on the ordinal position values are specified in the MAP clause.

{: .important}
The number of expressions in the column list and TRANSFORM clause must match.

* [TRANSFORM examples](/docs/sql-guide/statements/statement-insert-bulk/#transform-examples)

## Examples

### MAP examples

| Input type | MAP expression for value in source column | Example |
|---|---|---|
| CSV | Integer offset | [BULK INSERT CSV example](/docs/sql-guide/statements/statement-insert-bulk-csv-example) |
| NDJSON | String [JsonPath expression](https://goessner.net/articles/JsonPath/index.html#e2) for the NDJSON value | [BULK INSERT NDJSON example](/docs/sql-guide/statements/statement-insert-bulk-ndjson-example) |
| PARQUET | A string label that precisely matches the column name in the schema within the parquet file. | [BULK INSERT PARQUET example](/docs/sql-guide/statements/statement-insert-bulk-parquet-example) |

### TRANSFORM examples

| Map clause | TRANSFORM clause |
|---|---|
| `MAP (0 id, 1 int, 4 string)` | Variables: `@0`, `@1` and `@2` |

```sql
TRANSFORM (
    @0 + 10, -- offset the new _id value by 10
    @1,      -- pass through unchanged
    TUPLE(@3,@4),      -- create tuple to load time quantum fields
    CASE     -- clean up state names
        WHEN @2 = 'Texas' then 'TX' end
        WHEN @2 = 'California' then 'CA' end
        ELSE @2
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

### Bulk insert statement that reads from a CSV file

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

## Further information

* [BULK INSERT using CSV file](/docs/sql-guide/statements/statement-insert-bulk-csv-example)
* [BULK INSERT using NDJSON data source](/docs/sql-guide/statements/statement-insert-bulk-ndjson-example)
* [BULK INSERT using PARQUET data source](/docs/sql-guide/statements/statement-insert-bulk-parquet-example)
