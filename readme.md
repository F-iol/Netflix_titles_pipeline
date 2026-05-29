
![dbt CI Pipeline](https://github.com/F-iol/Netflix_titles_pipeline/actions/workflows/dbt_ci.yml/badge.svg)

An end-to-end ELT data pipeline built with **dbt Core** and **DuckDB**, featuring automated Data Quality Gates via **GitHub Actions**.

---

## Architecture & Data Flow

The project follows the **Medallion Architecture** to ensure data cleanliness and progressive refinement:

1. **Bronze Layer (Raw):** Direct ingestion of the Kaggle Netflix CSV dataset. Data is kept in its original state with no business logic applied.
2. **Silver Layer (Cleaned & Structured):** * Deduplication and removal of records with critical missing values (`NULL` handling).
   * Text normalization (standardizing `rating` strings using `UPPER` and `TRIM`).
   * Structural normalization (transforming comma-separated strings of directors and categories into native **SQL Arrays** using `string_split`).
   * Automated generation of unique business keys (Surrogate Keys) using `md5` hashing.
3. **Gold Layer (Business / Analytics):** Optimized Data Marts designed to feed BI tools (like PowerBI or Tableau). Includes top director rankings and aggregate content distribution metrics.

---

## Key Features

* **In-Process Analytical Processing:** Built entirely on top of **DuckDB**, enabling blazing-fast local SQL transformations without the overhead of cloud server maintenance.
* **Automated CI/CD Quality Gates:** Integrated **GitHub Actions** to automatically build models and run tests on every Pull Request or push to the `main` branch, ensuring zero broken code reaches production.
* **Robust Data Testing:** Enforced data integrity using wbt built-in testing capabilities (`unique`, `not_null`, `accepted_values`) across Silver and Gold layers.
* **Dynamic Configuration:** Advanced utilization of **Jinja templating** and dbt variables (`var`) to allow flexible runtime filtering of content ratings without modifying the underlying SQL source code.

---

## Tech Stack

* **Transformation Framework:** dbt Core (v1.6+)
* **Database Engine:** DuckDB
* **Orchestration & CI/CD:** GitHub Actions
* **Language:** SQL (DuckDB dialect) & Jinja
