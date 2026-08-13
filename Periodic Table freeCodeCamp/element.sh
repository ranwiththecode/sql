#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# If no argument passed
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

# Determine if argument is numeric or text (symbol/name)
if [[ $1 =~ ^[0-9]+$ ]]
then
  ELEMENT_DATA=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number = $1;")
else
  ELEMENT_DATA=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE symbol = '$1' OR name = '$1';")
fi

# If element is not found
if [[ -z $ELEMENT_DATA ]]
then
  echo "I could not find that element in the database."
else
  # Parse and format the output string exactly as required
  echo "$ELEMENT_DATA" | while IFS="|" read ATOMIC_NUM NAME SYMBOL TYPE MASS MELT BOIL
  do
    echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
  done
fi
# feat
# fix
# refactor
# chore
# 1
# 2
# 3
# 4
