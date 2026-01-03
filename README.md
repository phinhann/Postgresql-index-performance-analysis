# PostgreSQL Index Performance Analysis

This repository contains the SQL scripts, Python code, and experimental outputs used in the study **“Measuring the Impact of Data Distribution on B-tree Index Performance”**.  
The project evaluates how different data distributions influence the effectiveness of B-tree indexing in PostgreSQL by comparing indexed and non-indexed query performance under controlled experimental conditions.

The experiments were conducted using a real-world transactional dataset derived from an online retail database and focus on both point queries and range queries across uniform and skewed data distributions.

---

## Software and Tools

The experiments were conducted using the following tools and technologies:

- **PostgreSQL** (Relational Database Management System)
- **pgAdmin 4** (Database administration and query execution)
- **Python 3.9**
- **Python Libraries**:
  - pandas
  - sqlalchemy
  - psycopg2
  - matplotlib
- **Operating System**: macOS

---

## Reproducibility Steps

1. Import Online Retail CSV into PostgreSQL (pgAdmin import/COPY) and run sql/01_schema_and_load.sql.
2. Run sql/02_cleaning_and_profiling.sql to create online_retail_clean.
3. Run python/02_generate_distributions.py to generate online_retail_uniform and online_retail_skewed.
4. Run sql/03_frequency_hot_cold_selection.sql to confirm StockCode frequency (hot/cold selection).
5. Run sql/04_index_and_queries_explain.sql to execute the indexed vs no-index workload.
6. Compare outputs in results/.

## Outputs
EXPLAIN outputs for point (hot/cold) and range queries across:

uniform vs skewed
indexed vs no-index
