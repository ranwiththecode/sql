# A Deep-Dive into 10,000+ Records 🎮📊 

## Project Overview

This project explores the relationship between critical reception, user sentiment, and commercial success in the video game industry. I transitioned from a small guided project of 400 rows to an independent, large-scale analysis of 10,000+ records, migrating raw CSV data into a cloud-hosted PostgreSQL instance.

## Technical Skills Demonstrated
- Database Design: Engineered a relational schema using Composite Primary Keys to handle multi-platform release data.
- ETL & Data Engineering: Migrated data to Supabase (PostgreSQL), resolving primary key conflicts and performing explicit type casting for data normalization.
- Advanced SQL: Utilized Joins, CTEs, Aggregate Functions, and Filtering (HAVING) to extract market trends.

## The Data Journey

The dataset consists of two primary tables:
- game_sales: Includes game title, platform, publisher, developer, and global sales.
- reviews: Includes critic scores (0-100) and user scores (0-10).

## Resolving Data Integrity Issues

During ingestion, I encountered Unique Constraint Violations (Error 23505). I resolved this by identifying that a single game can exist on multiple platforms. I implemented a Composite Primary Key on (game, platform) to ensure every record was unique while maintaining all 9,459 sales entries.

## Conclusions

- Quality vs. Volume: Specialized publisher portfolios (e.g., EA Sports) often maintain higher average "quality" scores than broad mass-market portfolios.

- Market Resilience: Legacy hardware can maintain a "long tail" of sales for 5+ years even after successor consoles launch, as seen with the Wii and Xbox 360.

## How to Run This Project

The raw SQL queries can be found in queries.sql.
The database was hosted on Supabase using a PostgreSQL engine.
Data types for scores were cast to NUMERIC for precise average calculations.
