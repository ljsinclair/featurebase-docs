Uncompressed bitmaps scale with the number of values and the cardinality of that value.

| Database | Values saved as | Storage overhed 10,000 value dataset |
|---|---|---|
| RDBMS | Row and column based structure | 20480 - 30720 KB |
| FeatureBase | Individual bitmaps, or<br/>Bitmap for each power of 2 (Bit-slice) | 1280000 KB |

FeatureBase overcomes this issue by compressing all bitmap data using **Roaring Bitmap Format**, based on Roaring Bitmaps.
