🏗️ AWS S3 + DBT + Snowflake Data Warehouse
A cloud-native ELT data pipeline that ingests raw Airbnb-style data from AWS S3, transforms it through a Medallion Architecture using DBT, and delivers analytics-ready tables in Snowflake.

🛠️ Tech Stack
ToolPurposeAWS S3Cloud storage / raw data lakeDBT (Data Build Tool)Data transformation & modelingSnowflakeCloud data warehouse

🏛️ Architecture — Medallion Layers
🥉 Bronze (Raw Layer)
Ingests raw data directly from S3 with minimal transformation. Uses incremental loading to process only new records on each run, keeping pipeline runs fast and cost-efficient.

bronze_listings — Raw property listing data
bronze_hosts — Raw host profile data
bronze_bookings — Raw booking/reservation data

🥈 Silver (Cleaned Layer)
Applies data cleaning, type casting, deduplication, and business logic to prepare data for dimensional modeling.
🥇 Gold (Analytics Layer)
Fully modeled Fact and Dimension tables ready for BI tools and analytics consumption.

DIM tables — Built with SCD Type 2 (Slowly Changing Dimensions) to preserve the full history of changes to hosts, listings, and other entities over time
FACT tables — Aggregated transactional data (e.g., bookings) linked to dimension keys


✅ Best Practices Implemented

Incremental Load Strategy — Bronze layer only processes new/changed records, avoiding costly full table scans
SCD Type 2 — Dimension tables track historical versions of records, enabling point-in-time analysis
Medallion Architecture — Clear separation of raw, cleaned, and business-ready data layers
DBT Sources & Properties — Defined in sources.yml and properties.yml for documentation and lineage tracking
DBT Tests — Data quality tests applied across models
Modular DBT Models — Reusable, well-structured models across bronze, silver, and gold layers


📁 Project Structure
aws_dbt_project/
├── models/
│   ├── bronze/        # Raw ingestion models (incremental)
│   ├── silver/        # Cleaned & conformed models
│   ├── gold/          # Fact & Dimension tables (SCD2)
│   ├── sources.yml    # Source definitions
│   └── properties.yml # Model documentation & tests
├── macros/            # Reusable DBT macros
├── seeds/             # Static reference data
├── snapshots/         # DBT snapshots for SCD2
├── tests/             # Custom data quality tests
└── dbt_project.yml    # Project configuration

🚀 Getting Started

Configure your Snowflake credentials in profiles.yml
Set up your S3 source connection
Run the pipeline:

bashdbt deps          # Install dependencies
dbt seed          # Load seed data
dbt run           # Execute all models
dbt test          # Run data quality tests
