The `_id` column in each table represents the primary key and supports two data types:

| Data type | Description | Example | Advantage | Disadvantage |
|---|---|---|---|---|
| [`ID` data type](/docs/sql-guide/data-types/data-type-id) | One or more contiguous blocks of positive integers | `7,8,9,10,11,12,...20,21,22,23,...` | Faster queries | **Warning:** performance and storage are adversely affected if values are non-contiguous |
| [`String` data type](/docs/sql-guide/data-types/data-type-string) | String literal values can be supplied in any order if used as primary key | "a23", "s93kk", "h82k", "2023-02-10",... | Automatically mapped to blocks of contiguous integers | Higher storage and performance costs |
