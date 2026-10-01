#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  ELEMENT_INFO=$($PSQL "SELECT 'The element with atomic number ' || e.atomic_number || ' is ' || e.name || ' (' || e.symbol || '). It''s a ' || t.type || ', with a mass of ' || p.atomic_mass || ' amu. ' || e.name || ' has a melting point of ' || p.melting_point_celsius || ' celsius and a boiling point of ' || p.boiling_point_celsius || ' celsius.' FROM elements AS e INNER JOIN properties AS p USING(atomic_number) INNER JOIN types AS t USING(type_id) WHERE CAST(e.atomic_number AS VARCHAR) = '$1' OR e.symbol = '$1' OR e.name = '$1'")

  if [[ -z $ELEMENT_INFO ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$ELEMENT_INFO" | sed -E 's/^ *| *$//g'
  fi
fi

