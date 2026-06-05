# 🏗️ AWS S3 + DBT + Snowflake Data Warehouse

A cloud-native ELT pipeline that ingests raw data from **AWS S3**, transforms it through a **Medallion Architecture** using **DBT**, and delivers analytics-ready Fact and Dimension tables in **Snowflake**.

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| AWS S3 | Cloud storage / raw data lake |
| DBT (Data Build Tool) | Data transformation & modeling |
| Snowflake | Cloud data warehouse |

---

## 🏛️ Architecture — Medallion Layers

### 🥉 Bronze — Raw Layer
![Incremental Load](https://img.shields.io/badge/Strategy-Incremental%20Load-orange)

Raw data ingested directly from S3. Uses **incremental loading** so only new or changed records are processed on each run — keeping pipelines fast and cost-efficient.

- `bronze_listings` — Raw property listing data
- `bronze_hosts` — Raw host profile data
- `bronze_bookings` — Raw booking/reservation data

### 🥈 Silver — Cleaned Layer

Applies data cleaning, type casting, deduplication, and business logic to prepare data for dimensional modeling.

### 🥇 Gold — Analytics Layer
![SCD2](https://img.shields.io/badge/DIM%20Tables-SCD%20Type%202-green)

Fully modeled **Fact** and **Dimension** tables ready for BI tools and analytics consumption.

- **DIM tables** — Built with SCD Type 2 to preserve full historical records of data changes over time
- **FACT tables** — Aggregated transactional data linked to dimension keys

---

## ✅ Best Practices

- **Incremental Load** — Bronze layer processes only new/changed records, avoiding costly full table scans
- **SCD Type 2** — Dimension tables track every version of a record, enabling point-in-time analysis
- **Medallion Architecture** — Clear separation of raw, cleaned, and business-ready layers
- **DBT Tests & Docs** — Data quality tests and lineage tracking via `sources.yml` and `properties.yml`
- **Modular DBT Models** — Reusable, well-structured models across all three layers

---

## 📁 Project Structure

aws_dbt_project/
├── models/
│   ├── bronze/        # Raw incremental models
│   ├── silver/        # Cleaned & conformed models
│   ├── gold/          # Fact & Dimension tables (SCD2)
│   ├── sources.yml
│   └── properties.yml
├── macros/            # Reusable DBT macros
├── seeds/             # Static reference data
├── snapshots/         # DBT snapshots for SCD2
├── tests/             # Custom data quality tests
└── dbt_project.yml

---

## 🚀 Getting Started

```bash
dbt deps      # Install dependencies
dbt seed      # Load seed/reference data
dbt run       # Execute all models
dbt test      # Run data quality tests
```
