---
title: BULK INSERT
layout: default
parent: Statements
grand_parent: SQL guide
nav_order: 13
---

# BULK INSERT statement
{: .no_toc }

BULK INSERT is a SQL statement that:
* reads data from various sources,
* maps data locations and data types,
* performs optional lightweight data transformations,
* then loads the data to a table [using INSERT statements](/docs/sql-guide/statements/statement-insert)

In some cases, the data will be pre-sorted by internal FeatureBase partition before being ingested by multiple concurrent routines.

![expr](/assets/images/sql-guide/bulk_insert_steps.svg)


## Before you begin

Prepare your data source:
* file(s)
* URL(s)
* inline blob

The data source must be in one of the following formats:
* [Comma separated value (CSV) format](https://www.rfc-editor.org/rfc/rfc4180){:target="_blank"}
* [Lean about New Line Delimited JSON (NDJSON) format](https://en.wikipedia.org/wiki/JSON_streaming){:target="_blank"}
* [Learn about Apache ORC format](https://orc.apache.org/specification/){:target="_blank"}
* [Learn about Apache PARQUET format](https://parquet.apache.org/){:target="_blank"}

{% include page-toc.md %}

## BNF diagrams

![expr](/assets/images/sql-guide/bulk_insert_stmt.svg)

### Column list
![expr](/assets/images/sql-guide/column_list.svg)

{% include /tips/tip-show-table-for-structure.md %}

### Map list
![expr](/assets/images/sql-guide/map_list.svg)

### Transform clause
![expr](/assets/images/sql-guide/map_list.svg)

### With clause
![expr](/assets/images/sql-guide/bulk_insert_options.svg)
![expr](/assets/images/sql-guide/bulk_insert_option.svg)

## Syntax

```
BULK INSERT
  INTO
    <table-name> [(<column-list>)]
  MAP
    ({$.<column-name> | <map-id>} <data-type>,...)
  [TRANSFORM
    (expr,...)]
  FROM
    ['<URL>' | '<string-literal>']
  WITH
    [
      [BATCHSIZE <integer-value>]
      [ROWSLIMIT <integer-value>]
      [INPUT ['INLINE' | 'STREAM' | 'URL']]
      [FORMAT
        ['CSV' [HEADER_ROW] [CSV_EMPTY_STRING_AS_NULL] [CSV_NULL_AS_NULL] [NULL_AS_EMPTY_SET]] |
        ['NDJSON' [ALLOW_MISSING_VALUES] [NULL_AS_EMPTY_SET]] |
        ['PARQUET' [NULL_AS_EMPTY_SET]] |
        ['ORC' [NULL_AS_EMPTY_SET]]
      ]
      ...
    ]
```

## Arguments

| Argument | Description | Required? | Additional information |
|---|---|---|---|
| `INSERT` | INSERT a row of data identified by an `_id` value not in the table<br/>UPDATE values in a row where the `_id` already exists | Yes | Columns not defined in the `<column-list>` are not updated |
| `<table-name>` | Name of target table | Yes |  |
| `<column-list>` | Columns belonging to `<table-name>`, starting with the `_id` column | Optional | Assumes all columns in `<table-name>` are to be updated if left blank |

## MAP clause

| Argument | Description | Required? | Additional information |
|---|---|---|---|
| `MAP` | Comma-separated list defining each column in the `<column-list>` as a positive integer and data type | Yes |  |
| `$.<column-name>` | `MAP` values in `NDJSON` data source to the target table `<column-name>` |  | [MAP clause with NDJSON data source](/docs/sql-guide/examples/sql-eg-insert/sql-eg-insert-bulk-ndjson-target) |
| `<map-id>` | Corresponds to the ordinal position of each column | Yes | `_id` column is numbered `0` |
| `<data-type>` | The data type assigned to each column in the `CREATE TABLE` statement | Yes | [Data types](/docs/sql-guide/data-types/data-types-home) |

## TRANSFORM clause

| Argument | Description | Required? | Additional information |
|---|---|---|---|
| `TRANSFORM` | Prefix each column integer from the `MAP` clause with the `@` symbol | Optional |  |
| `expr` | Any valid function or operator used to manipulate values identified by `@<map-id>` | Optional |  |

## FROM clause

| Argument | Description | Required? | Additional information |
|---|---|---|---|
| `FROM` | A single or multi-line string literal that specifies the data source defined in the `WITH...INPUT` and `WITH...SOURCE` clauses | Yes |  |
| `'<URL>'` | One or more valid URLs that link to valid data sources | Required for `INPUT 'URL'`| Define multiple URLs as [string literals](#string-literals)  |
| `<string-literal>` | CSV or NDJSON records as a string literal. | Required for `INPUT 'INLINE'` | * Not supported for `FORMAT 'PARQUET'`<br/>* [String literals](#string-literals) |

## WITH clause

| Argument | Description | Required? | Additional information |
|---|---|---|---|
| `WITH` | Pass one or more statement level options | Optional |  |

### Ingest arguments

| Argument | Description | Default | Additional information |
|---|---|---|---|
| `BATCHSIZE` | Specify the batch size of the BULK commit | `1000` | If batching not available on client, use `STREAM` instead |
| `ROWSLIMIT` | Limit the number of rows processed in a batch. |  |  |
| `CONCURRENCY` | Number of concurrent workers to ingest the data after it has been presorted | `8` | Can be used with `CSV` and `NDJSON` which can presort. Not supported for `PARQUET` and `ORC` |

### INPUT arguments

| Argument | Description | Required? | Additional information |
|---|---|---|---|
| `INPUT` | Input values must match those used in the `FROM` clause |  |  |
| `'INLINE'` | Used for data included directly from the `FROM` clause with contents of the literal read as though they were in a file.  | Required for  `FROM <string-literal>'`<br/>Not supported for `PARQUET` and `ORC` | [INPUT additional](#input-additional) |
| `'STREAM'` | `STREAM` supports a streaming payload using an HTTP multipart POST. | Optional | [BULK INSERT with STREAM](#bulk-insert-with-stream) |
| `FORMAT` | Supported data source formats are:<br/>* CSV<br/>* `NDJSON`<br/>* `ORC`<br/>* `PARQUET` | Optional | `INPUT 'INLINE'` does not support `PARQUET` or `ORC` |

### FORMAT arguments

The following arguments are optional

| Argument | Data source | Description | Additional information |
|---|---|---|---|
| `ALLOW_MISSING_VALUES` | `NDJSON` | Output a `NULL` value from the `MAP` clause if the path expression fails | [NDJSON value assignment](#ndjson-data-source-value-assignment) |
| `CSV_EMPTY_STRING_AS_NULL` | `CSV` | Assign `""` value as `null` | [CSV value assignment](#csv-data-source-value-assignment) |
| `CSV_NULL_AS_NULL` | `CSV` | Assign `NULL` value as `null` | [CSV value assignment](#csv-data-source-value-assignment) |
| `HEADER_ROW` | `CSV` | Ignore the header row |  |
| `NULL_AS_EMPTY_SET` | All | `MAP` any `NULL` values from the data source to a `SET` column without error | [SET and SETQ data types](/docs/sql-guide/data-types/data-type-set-setq) |

## Additional information

{: .note}
Any variables are evaluated during execution for each row

### INPUT additional

#### String literals

{% include /sql-guide/string-literal-def.md %}

#### CSV data source value assignment

| Literal Value | Target Data Type | Result | Additional information |
|---|---|---|---|
| `,,` or `,"",` | [All data types](/docs/sql-guide/data-types/data-types-home) unless stated | `NULL` | |
| `,,` or `,"",` | [STRING](/docs/sql-guide/data-types/data-type-string) | `''` (empty string) | `NULL` when `WITH` `'CSV_EMPTY_STRING_AS_NULL'` is defined |
| `,,` or `,"",` | [SET and SETQ](/docs/sql-guide/data-types/data-type-set-setq) | `NULL` | Empty set `[]` if `WITH 'NULL AS EMPTY SET'` is defined |
| `,NULL,` | [All data types](/docs/sql-guide/data-types/data-types-home) unless stated | `'NULL'` (string literal) | `NULL` when `WITH 'CSV_NULL_AS_NULL'` is defined |

#### NDJSON data source value assignment

| Literal Value | Target Data Type | Result | Additional information |
|---|---|---|---|
| `""` | [STRING](/docs/sql-guide/data-types/data-type-string) | `''` (empty string) | |
| `""` | [STRINGSET and STRINGSETQ](/docs/sql-guide/data-types/data-type-set-setq) | `['']` (set with empty string member) | |
| `null` | [All data types](/docs/sql-guide/data-types/data-types-home) unless stated | `NULL` | Not supported for  |
| `[]` | [SET and SETQ](/docs/sql-guide/data-types/data-type-set-setq) | `[]` (empty set) | |
| Value Missing () | [All data types](/docs/sql-guide/data-types/data-types-home) unless stated | `NULL` | This will only occur if using `ALLOW_MISSING_VALUES` |
| Value Missing () | [SET and SETQ](/docs/sql-guide/data-types/data-type-set-setq) | `NULL` | Empty set `[]` if `FORMAT` includes `'NULL_AS_EMPTY_SET'` and `'ALLOW_MISSING_VALUES'` |

## Examples

{% include /sql-guide/sql-eg-insert-bulk-statements.md %}

### TRANSFORM with operators and expressions

```sql
BULK INSERT INTO doctest (_id, zip-code, state-name)
MAP (
  0 id,
  1 INTEGER,
  2 STRING)
TRANSFORM (
    @0 + 10, -- offset the new _id value by 10
    @1,      -- pass through unchanged
    CASE     -- clean up state names
        WHEN @2 = 'Texas' then 'TX' end
        WHEN @2 = 'California' then 'CA' end
        ELSE @2
    end
)
```

<!-- Applies only to FB Community which is now archived

### BULK INSERT with read from CSV file

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

### BULK INSERT with STREAM

Using input STREAM requires making an HTTP multipart form POST request. The argument to FROM may be `'*'` and all files attached to the request will be streamed in and ingested together. The fbsql CLI tool implements the multipart POST and you would use it as follows:

```sql
\file myfile.csv
\file myfile2.csv
\file myfile3.csv

bulk replace
  into insert_test (_id, int1, string1, timestamp1)
  map (0 id, 1 int, 2 string)
  transform (@0, @1, @2, current_timestamp)
  from
    '*'
  with
    format 'CSV'
    input 'STREAM';
```
