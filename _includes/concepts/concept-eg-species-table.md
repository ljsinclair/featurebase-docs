## Data representation in traditional databases

In traditional databases, the relationships between data is determined by its position in a row and column. In this example table:

* low cardinality data is found in the `Vertebrae` column
* high cardinality data is found in the `Captivity` column

| Species | Vertebrae | Captivity |
|---|---|---|
| Manatee | Yes | 3 |
| Sea Horse | Yes | 956 |
| Koala | Yes | 19 |
| Starfish | No | 20 |
