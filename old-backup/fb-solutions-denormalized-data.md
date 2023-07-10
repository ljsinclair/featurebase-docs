<!-- This content was written originally for the Concepts homepage.
Subsequent edits have meant it's no longer useful in that context.-->

<!-- This content is duplicated from concepts-home.md
it provides context for the solutions below

## Benefits and costs of data normalization

Data normalization is not a perfect solution to data cardinality:

| Benefit | Cost |
|---|---|
| Data integrity is easier to maintain | Data in separate tables makes indexing less efficient |
| Less duplication of data means faster inserts, updates and a smaller footprint | `JOIN` clauses are required to query data which makes queries more complex and therefore slower to return results |

## How does FeatureBase handle data cardinality?

FeatureBase does not use Database normalization. Instead, the system inserts data into a two-dimensional bitmap index.
-->

<!-- This content originally followed the above content, but subsequent edits have rendered it less useful. Also, the pages in links are not completed.
Once they **are** completed, this content could be reinserted in concepts-home.md

Another alternative would be to adapt the content for the help homepage content in index.md.


### Data integrity solutions

| Solution | Additional information |
|---|---|
| FeatureBase never alters your data, so data integrity is guaranteed | [Learn about ingestion](/docs/concepts/concept-ingestion) |
| All rows are uniquely identified with a string or integer value | [Learn how the `_id` column is used](/docs/concepts/concept-table-id) |
| Specific rules govern insertion and update actions | [Learn how Upsert works](/docs/concepts/concept-upsert) |

### Data duplication solutions

| Solution | Additional information |
|---|---|
| `SET` and `SETQ` data types address cardinality issues in a single row | [Learn about `SET` data types](/docs/concepts/concept-datatype-set) |

### Storage footprint solutions

| Solution | Additional information |
|---|---|
| Data is bit-sliced, range-encoded then converted to base-2 then translated to roaring bitmap format | [Learn how FeatureBase bitmap indexes work](/docs/concepts/concept-bitmaps-equality-encoded) |
| `SETQ` data types can be used with timestamped data to automatically remove data to continually maintain database size. | Data footprint reduced after set time. | [Learn about SETQ data types](/docs/concepts/concept-setq) |

## Next step

* [Learn the techniques used before importing data to FeatureBase]

-->
