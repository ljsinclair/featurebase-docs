### Define header for multiple CSV files with mismatched headers

In this example, one CSV file has defined a header while the other has not.
This mismatch is overcome by defining the `--header` and ignoring file headers using `--ignore-header`

```shell
molecula-consumer-csv \
    --batch-size=10000 \
    --auto-generate \
    --header=asset_tag__String,fan_time__RecordTime_2006-01-02,fan_val__String_F_YMD \
    --ignore-header
    --index=csv-ingest-header-flag \
    --files=header-defined.csv,header-undefined.csv \
```
