In a typical database, each field -- the intersection of row and column -- contains an individual value.

FeatureBase `SET` and `SETQ` data types are designed to contain an array of comma-separated values within each field.

This means:
* data does not need to be normalized into separate tables,
* import/ingest actions are faster because there are less rows to import,
* queries are faster
