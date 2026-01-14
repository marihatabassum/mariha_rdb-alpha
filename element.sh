#! /bin/bash
#echo  "Please provide an element as an argument."

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if an argument was provided
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

INPUT=$1

# Query the element information
ELEMENT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius 
FROM elements e
JOIN properties p USING(atomic_number)
JOIN types t USING(type_id)
WHERE e.atomic_number::text='$INPUT' OR e.symbol='$INPUT' OR e.name='$INPUT';")

# Check if element exists
if [[ -z $ELEMENT ]]
then
  echo "I could not find that element in the database."
  exit
fi

# Read query result into variables
IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING BOILING <<< "$ELEMENT"

# Output in desired format
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."



