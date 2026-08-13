# SQL
Exploring SQL, one project at a time!

## Projects:

**1. World Cup Database & Query Engine**
A PostgreSQL data pipeline and analytics project that processes historical FIFA World Cup match data from raw files into structured database insights. The system features an automated Bash ETL script (`insert_data.sh`) that ingests CSV data, resolves relational entity dependencies, and populates a normalized schema (`teams` and `games`). Utilizing an analytical query engine (`queries.sh`), it executes multi-table SQL joins, nested subqueries, set operations (`UNION`), and aggregate functions (`SUM`, `AVG`, `ROUND`) to extract automated statistical summaries of tournament results.

**2. Salon Appointment Scheduler**
A relational database-backed CLI application designed to handle operational scheduling workflows and real-time state management. Built on a normalized three-table PostgreSQL schema (`customers`, `services`, and `appointments`), the system dynamically validates customer records, executes conditional `INSERT` operations for new profiles, and maps primary to foreign key dependencies to log structured appointment transactions. The project emphasizes core transactional database concepts, relational integrity across linked tables, and interactive user-driven data processing.

**3. Bike Rental Shop Command-Line Interface (CLI) Application (Guided)** 
A terminal-based Bike Rental Shop application built with Bash and PostgreSQL for the freeCodeCamp Relational Database Certification. The core focus of this project is demonstrating real-time database interaction from an application interface, utilizing SQL queries for multi-table relational joins (INNER JOIN), conditional record updates, and live inventory state management. While wrapped in a shell script, it highlights practical database manipulation skills, including dynamic customer creation and automated return-timestamp tracking (NOW()).  

**4. Golden Era of Video Games (Independent)**
Scales a guided analysis into an independent study of 10,000+ video game records, migrating raw data into a cloud-hosted PostgreSQL instance on Supabase. I engineered a relational schema with composite primary keys to resolve multi-platform data conflicts and leveraged advanced SQL to uncover deep market trends in platform longevity and critic-user sentiment gaps

**5. Golden Era of Video Games (Guided)** 
project completed initially on DataCamp: https://www.datacamp.com/datalab/w/26afed2a-e656-45d4-bd56-f14c20433b52/edit 
