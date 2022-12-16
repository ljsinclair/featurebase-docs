### Join Assets and Events tables into a single FeatureBase index

Use a SQL query at the command-line to join the `assets` and `events` table data into a single FeatureBase index.

The query performs these tasks:
* Import `event` data along with `weight` of relative `asset_tag`
* create `locale` field based on the first three characters from the `pk` field

```shell
molecula-consumer-sql \
    --driver mysql \
    --connection-string 'username:password@(127.0.0.1:3306)/dbname' \
    --featurebase-hosts localhost:10101 \
    --batch-size 10000 \
    --index=events_plus_weight \
    --primary-key-fields 'pk' \
    --row-expr 'SELECT events.pk as pk__String, events.asset_tag as asset_tag__String, assets.weight as weight__Int, SUBSTRING(events.pk, 1, 3) as locale__String FROM events INNER JOIN assets on assets.asset_tag = events.asset_tag'
```
