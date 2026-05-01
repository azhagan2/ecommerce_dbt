Try using dbt-codegen packages, for creating a sources.yml file

dbt run-operation generate_source --args '{"schema_name": "bronze", "database_name": "ecommerce_db"}'


![alt text](image.png)