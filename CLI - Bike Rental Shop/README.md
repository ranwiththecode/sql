# Bike Rental Shop CLI README

A command-line interface (CLI) application built as part of the freeCodeCamp Relational Database Certification. This project demonstrates how to bridge the gap between database systems and application scripts by executing raw PostgreSQL queries inside a terminal application to manage live business inventory and customer workflows.

## 📊 Analyst Focus & Skills Demonstrated
While the wrapper application is written in Bash, the primary objective of this project was mastering database design and interaction:
* **Relational Database Design:** Interacted with a multi-table schema consisting of `bikes`, `customers`, and `rentals` tables.
* **Advanced Querying:** Wrote raw SQL utilizing `INNER JOIN`, `USING()` clauses, conditional filtering (`WHERE`), and sorting (`ORDER BY`).
* **Data Manipulation:** Handled dynamic database state changes using `INSERT` statements for new users and `UPDATE` statements to track inventory availability and timestamps (`NOW()`).
* **Data Cleaning & Formatting:** Used string manipulation (`sed`) to clean up output tuples directly from the database query responses for a seamless user experience.

---

## 🛠️ Technology Stack
* **Database:** PostgreSQL
* **Scripting Language:** Bash / Shell
* **Interface:** Command Line Interface (CLI)

---

## ⚙️ How It Works

The script queries a `bikes` database in real-time to manage a local shop's workflows:

1. **Rent a Bike:**
   * Queries available inventory (`available = true`).
   * Checks for existing customers by phone number or creates a new customer profile.
   * Records the transaction in a `rentals` table and toggles the bike's status to unavailable.
2. **Return a Bike:**
   * Joins `bikes`, `rentals`, and `customers` to fetch outstanding rentals for a specific user.
   * Updates the `date_returned` timestamp.
   * Sets the bike's status back to available.

---

## 📂 Core SQL Concepts Utilized

Here is a look at how data is fetched and manipulated under the hood:

```sql
-- Fetching a customer's active rentals using INNER JOIN
SELECT bike_id, type, size 
FROM bikes 
INNER JOIN rentals USING(bike_id) 
INNER JOIN customers USING(customer_id) 
WHERE phone = '$PHONE_NUMBER' AND date_returned IS NULL 
ORDER BY bike_id;

-- Updating transaction logs on return
UPDATE rentals 
SET date_returned = NOW() 
WHERE rental_id = $RENTAL_ID;
