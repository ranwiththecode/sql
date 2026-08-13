# Salon Appointment Scheduler CLI

A command-line interface (CLI) application built for the freeCodeCamp Relational Database Certification. This project demonstrates handling user-driven transaction data, managing state across multiple relational tables, and executing conditional data-insertion workflows in a live PostgreSQL database.

---

## 📊 Analyst Focus & Skills Demonstrated

While the program runs inside a shell wrapper, the primary focus centers on relational data management and system integration:

* **Relational Schema Design:** Implemented a three-table normalized structure (`customers`, `services`, and `appointments`) mapping one-to-many relationships through strict primary key (`SERIAL`) and foreign key (`REFERENCES`) dependencies.
* **Conditional Data Logic:** Designed an ETL-like script flow (`salon.sh`) that dynamically validates database entries in real time—checking if a record exists (returning customer) before deciding whether to execute an `INSERT` statement or fetch the existing relational keys.
* **Transaction Recording:** Maintained reference integrity by capturing multiple terminal inputs and recording transactional rows inside the `appointments` table that bridge separate entity attributes seamlessly.

---

## 🛠️ Technology Stack

* **Database:** PostgreSQL
* **Scripting/Interface:** Bash / Shell

---

## 🗄️ Database Schema

The relational structure maps appointments dynamically by linking customers to the specific service they requested:
```
+-------------------+           +-------------------+
|     customers     |           |     services      |
+-------------------+           +-------------------+
| customer_id (PK)  |           | service_id (PK)   |
| phone (UNIQUE)    |           | name              |
| name              |           +-------------------+
+-------------------+                     |
          |                               |
          +--------------+   +------------+
                         |   |
                       (1)(2) 
                +--------------------+
                |    appointments    |
                +--------------------+
                | appointment_id(PK) |
                | customer_id (FK)   |
                | service_id (FK)    |
                | time               |
                +--------------------+
```

---

## 📂 Core Database Operations

The application leverages specific SQL procedures to maintain data flow:

```sql
-- Creating the core appointments bridge table
CREATE TABLE appointments(
  appointment_id SERIAL PRIMARY KEY,
  customer_id INT NOT NULL REFERENCES customers(customer_id),
  service_id INT NOT NULL REFERENCES services(service_id),
  time VARCHAR(20) NOT NULL
);

-- Performing runtime customer profile checks
SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';

-- Executing the operational transaction record
INSERT INTO appointments(customer_id, service_id, time) 
VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');
```

🚀 Setup & Execution
1. Rebuild the Database

Restore or create the database structure from the repository's dump file:
```
psql --username=freecodecamp --dbname=postgres < salon.sql
```
2. Set Script Permissions

Make sure the scheduler script has executable rights:
```
chmod +x salon.sh
```
3. Run the Scheduler CLI

Execute the program to begin booking appointments directly into the PostgreSQL engine:
```
./salon.sh
```
