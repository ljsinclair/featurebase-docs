### Source table `tuple-demo`

```sql
CREATE TABLE IF NOT EXISTS tuple-demo (
    _id STRING,
    time_col TIMESTAMP,
    stringset_col STRINGSET,
    idset_col IDSET,
    stringsetq_col STRINGSETQ timequantum 'YMD',
    idesetq_col IDSETQ timequantum 'Y'
);
```
