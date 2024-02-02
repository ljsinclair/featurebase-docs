| User data | FeatureBase data type | Bitmap type |
|---|---|---|
| Boolean | [Bool](/docs/sql-guide/data-types/data-type-bool) | [Equality-encoded bitmaps](/docs/cloud/cloud-faq/cloud-faq-bitmaps-equality-encoded) |
| Floating point | [Decimal](/docs/sql-guide/data-types/data-type-decimal) | [Bit-sliced](/docs/cloud/cloud-faq/cloud-faq-bitmaps-bit-slice) |
| Unsigned integer | [ID](/docs/sql-guide/data-types/data-type-id) | [Equality-encoded bitmaps](/docs/cloud/cloud-faq/cloud-faq-bitmaps-equality-encoded) |
| Signed Integer | [Integer](/docs/sql-guide/data-types/data-type-int) | [Bit-sliced](/docs/cloud/cloud-faq/cloud-faq-bitmaps-bit-slice) |
| Alphanumeric | [String](/docs/sql-guide/data-types/data-type-string) | [Equality-encoded bitmaps](/docs/cloud/cloud-faq/cloud-faq-bitmaps-equality-encoded) |
| Date and time | [Timestamp](/docs/sql-guide/data-types/data-type-timestamp) | [Bit-sliced](/docs/cloud/cloud-faq/cloud-faq-bitmaps-bit-slice) |
| Low cardinality | [Set](/docs/sql-guide/data-types/data-types-home#low-cardinality-data-types) | [Equality-encoded bitmaps](/docs/cloud/cloud-faq/cloud-faq-bitmaps-equality-encoded) |
| Low cardinality keyed to date/time values | [SetQ](/docs/sql-guide/data-types/data-types-home#low-cardinality-data-types) | [Equality-encoded bitmaps](/docs/cloud/cloud-faq/cloud-faq-bitmaps-equality-encoded) |
