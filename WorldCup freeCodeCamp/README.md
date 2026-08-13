# World Cup Database & Querying Engine

A relational database project built for the freeCodeCamp Relational Database Certification. This project involves designing a PostgreSQL schema from scratch, building a Bash ETL (Extract, Transform, Load) script to automate data insertion from a CSV dataset, and writing analytical SQL queries to answer key questions about historical World Cup data.

---

## 📊 Analyst Focus & Skills Demonstrated

While Bash was used to automate the pipeline, the project highlights key relational database and analytical skills:

* **Relational Schema Design:** Designed normalized tables (`teams` and `games`) with primary keys (`SERIAL`), unique constraints, and foreign key relationships (`REFERENCES`).
* **Data Pipeline (ETL Automation):** Built an automated ingestion script in Bash (`insert_data.sh`) that parses CSV data, checks for existing entity records to prevent duplicates, and populates linked primary/foreign key pairs dynamically.
* **SQL Analytics & Aggregations:** Wrote analytical queries utilizing aggregate functions (`SUM`, `AVG`, `COUNT`, `MAX`), rounding logic (`ROUND`), string matching (`LIKE`), set operations (`UNION`), subqueries, and table joins (`INNER JOIN`).

---

## 🛠️ Technology Stack

* **Database:** PostgreSQL
* **Automation/Scripting:** Bash / Shell
* **Data Source:** CSV (`games.csv`)

---

## 🗄️ Database Schema

The database consists of two interconnected tables linked via foreign key relationships:
+--------------------+       +------------------------------------+
|       teams        |       |               games                |
+--------------------+       +------------------------------------+
| team_id (PK)       |<------| winner_id (FK -> teams.team_id)    |
| name (UNIQUE)      |<------| opponent_id (FK -> teams.team_id)  |
+--------------------+       | game_id (PK)                       |
| year                               |
| round                              |
| winner_goals                       |
| opponent_goals                     |
+------------------------------------+

---

## 📂 Core SQL Queries Highlighted

Here are a few examples of the analytical SQL queries used in this project:

```sql
-- Retrieve all teams that played in the 2014 'Eighth-Final' round using UNION and Subqueries
SELECT name 
FROM teams 
WHERE team_id IN (
  SELECT winner_id FROM games WHERE year = 2014 AND round = 'Eighth-Final' 
  UNION 
  SELECT opponent_id FROM games WHERE year = 2014 AND round = 'Eighth-Final'
) 
ORDER BY name;

-- List champions by year using INNER JOIN
SELECT year, name 
FROM games 
INNER JOIN teams ON games.winner_id = teams.team_id 
WHERE round = 'Final' 
ORDER BY year;
```

🚀 Setup & Execution
1. Database Setup

Log into PostgreSQL and create the database schema:
psql --username=freecodecamp --dbname=postgres < worldcup.sql

2. Permissions

Ensure execution permissions are set for both scripts:
Bash

chmod +x insert_data.sh queries.sh

3. Run the Data Pipeline

Populate the database from games.csv:
Bash

./insert_data.sh

4. Run Analytical Queries

Execute the query engine to display analysis results:
Bash

./queries.sh
