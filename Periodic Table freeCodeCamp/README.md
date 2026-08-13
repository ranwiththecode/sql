# Periodic Table Database & Script

A terminal-based tool that queries a PostgreSQL periodic table database and retrieves element details based on atomic number, symbol, or name inputs. This project satisfies the "Build a Periodic Table Database" certification requirements for freeCodeCamp's Relational Database program.

## 🚀 Features
* **Dynamic Input Parsing:** Automatically identifies whether an input argument is an integer (atomic number), a short string (symbol), or a long string (element name).
* **Relational Schema:** Utilizes normalized `elements`, `properties`, and `types` tables with exact structural foreign keys and unique constraints.
* **Formatted Bash Output:** Yields standardized, parsed data results matching absolute string verification parameters.

## 🛠️ How to Run
Ensure the script has executable permissions, then pass any element identifier:
```bash
./element.sh 1
./element.sh H
./element.sh Hydrogen
```
