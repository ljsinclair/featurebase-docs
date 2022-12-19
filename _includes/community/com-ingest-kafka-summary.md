The `molecula-ingest-kafka` ingest tool:
* streams and reads Avro-encoded records from an Apache Kafka topic over HTTPS
* decodes the records using the Confluent Schema Registry
* copies the data into the target FeatureBase index
