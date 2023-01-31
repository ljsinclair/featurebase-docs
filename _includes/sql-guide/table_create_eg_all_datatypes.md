
```sql
create table allcoltypes
  (
    _id id,
    intcol int min 0 max 10000,
    boolcol bool,
    timestampcol timestamp timeunit 'ms' epoch '2022-01-01T00:00:00Z',
    decimalcol decimal(2),
    stringcol string,
    stringsetcol stringset,
    stringsetcolq stringset timequantum 'YMD' ttl '24h',
    idcol id,
    idsetcol idset,
    idsetcolq idset timequantum 'YMD' ttl '24h'
  )
  comment 'table containing all column types';
```
