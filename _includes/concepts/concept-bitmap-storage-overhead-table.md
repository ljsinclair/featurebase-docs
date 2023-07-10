Encoding data as base-2 equality-encoded or bit-slice bitmaps makes queries faster but incurs storage overheads because the number of bitmaps scale:
* with the number of values, and
* the cardinality of those values

For example:

| Database | Values saved as | Storage overhead 10,000 value dataset |
|---|---|---|
| RDBMS | Row and column based structure | 20480 - 30720 KB |
| FeatureBase | Individual bitmaps, and<br/>Bit-slice bitmaps | 1280000 KB |

FeatureBase overcomes this issue by compressing all bitmap data using **Roaring Bitmap Format**, based on Roaring Bitmaps.
