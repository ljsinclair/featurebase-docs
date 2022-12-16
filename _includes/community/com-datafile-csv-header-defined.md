### header-defined.csv

This CSV file defines the header row as follows:

| Field | Data type | Additional |
|---|---|---|
| `asset_tag` | `String` |  |
| `fan_time` | `RecordTime` | timestamp layout format `2006-01-02` (according to go time) |
| `fan_val` | `String` |  |

```
asset_tag__String,fan_time__RecordTime_2006-01-02,fan_val__String_F_YMD
ABCD,2019-01-02,70%
ABCD,2019-01-03,20%
BEDF,2019-01-02,70%
BEDF,2019-01-05,90%
ABCD,2019-01-30,40%
BEDF,2019-01-08,10%
BEDF,2019-01-08,20%
ABCD,2019-01-04,30%
```
