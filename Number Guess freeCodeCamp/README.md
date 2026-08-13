# Number Guessing Game

An interactive, terminal-based CLI game written in Bash and backed by a PostgreSQL database. The application generates a secret random number between 1 and 1000 and challenges players to guess it, while automatically persisting player statistics across sessions.

## 🚀 Features
* **Player Recognition & Persistence:** Checks the database for returning usernames. New players receive a personalized welcome message, while returning players see their total games played and personal best (fewest guesses).
* **Robust Input Validation:** Rejects non-integer inputs without increasing the player's guess counter or crashing the game loop.
* **Dynamic Feedback Loop:** Provides instantaneous feedback (`higher` / `lower`) after each attempt.
* **Relational Stat Tracking:** Leverages a PostgreSQL schema featuring `users` and `games` tables linked via foreign keys to track individual game records over time.

## 🗄️ Database Schema
* **`users` Table:** Stores unique `username` (up to 22 characters) and `user_id`.
* **`games` Table:** Records each completed game, referencing `user_id` and storing `guesses_count`.

## 🛠️ How to Run
Ensure the script has executable permissions and that PostgreSQL is running:
```bash
./number_guess.sh
```
