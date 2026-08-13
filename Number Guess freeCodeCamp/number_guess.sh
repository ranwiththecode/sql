#!/bin/bash

# feat
# fix
# refactor
# chore

# PSQL execution variable
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompt for username
echo "Enter your username:"
read USERNAME

# Fetch user details
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")

# Determine if new or returning user
if [[ -z $USER_ID ]]
then
  # New user scenario
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Insert new user into the database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
else
  # Returning user metrics calculations
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID;")
  BEST_GAME=$($PSQL "SELECT MIN(guesses_count) FROM games WHERE user_id=$USER_ID;")
  
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate random target integer between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

echo "Guess the secret number between 1 and 1000:"
GUESS_COUNT=0

while true
do
  read USER_GUESS
  ((GUESS_COUNT++))

  # Input validator checking for pure integers
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif (( USER_GUESS == SECRET_NUMBER ))
  then
    # Target matched successfully
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
    # Insert completed game tracking record
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses_count) VALUES($USER_ID, $GUESS_COUNT);")
    break
  elif (( USER_GUESS > SECRET_NUMBER ))
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done