FeatureBase has four import methods for Kafka data:

* Kafka
* Kafka consumer
* Kafka static
* Kafka delete

In all cases, the FeatureBase ingest tool:
* Streams and reads Avro-encoded records from an Apache Kafka topic over HTTPS
* Decodes the records
* Converts the records to FeatureBase Streaming Bitmap format
* Writes the converted records to the target database table
