## SQL ingest tool change data type

Use SQL functions at the command-line to convert `fan_vol` from `string` to `int` data type.

```shell
molecula-consumer-sql \
    --driver mysql \
    --connection-string 'username:password@(127.0.0.1:3306)/dbname' \
    --featurebase-hosts localhost:10101 \
    --batch-size 10000 \
    --index=event_list \
    --primary-key-fields 'pk' \
    --row-expr 'SELECT pk as pk__String, asset_tag as asset_tag__String, fan_time as `fan_time__Timestamp_s_2006-01-02`, SUBSTRING(fan_vol, 1, CHAR_LENGTH(fan_vol)-1) as fan_vol__Int FROM events'
```
