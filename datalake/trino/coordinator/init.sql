CREATE SCHEMA if not exists iceberg.example_s3_schema;

CREATE TABLE iceberg.example_s3_schema.employees_test
(
  name varchar,
  salary decimal(10,2)
)
WITH (
  format = 'PARQUET'
);

INSERT INTO iceberg.example_s3_schema.employees_test (name, salary) VALUES ('Sam Evans', 55000);
