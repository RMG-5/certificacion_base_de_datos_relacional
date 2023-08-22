#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

## Crea las tablas "teams" y "games" incluyendo sus columnas.
echo $($PSQL "CREATE TABLE teams(team_id SERIAL NOT NULL PRIMARY KEY, name VARCHAR(25) NOT NULL UNIQUE)")
echo $($PSQL "CREATE TABLE games(game_id SERIAL NOT NULL PRIMARY KEY, year INT NOT NULL, round VARCHAR(25) NOT NULL, winner_id INT NOT NULL, opponent_id INT NOT NULL, winner_goals INT NOT NULL, opponent_goals INT NOT NULL, FOREIGN KEY(winner_id) REFERENCES teams(team_id), FOREIGN KEY(opponent_id) REFERENCES teams(team_id))")

## Inserta registros en la tabla "teams".
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOAL
do
  if [[ $YEAR != "year" ]]
  then
    # obtener team_id de ganadores.
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # si no se encuentra TEAM.
    if [[ -z $TEAM_ID ]]
    then
      # insertar team.
      INSERTAR_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      # indica el registro que se inserto.
      if [[ $INSERTAR_TEAM == "INSERT 0 1" ]]
      then
        echo Inserted in teams, $WINNER
      fi
    fi

    # obtener team_id de oponentes.
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # si no se encuentra TEAM.
    if [[ -z $TEAM_ID ]]
    then
      # insertar team.
      INSERTAR_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      # indica el registro que se inserto.
      if [[ $INSERTAR_TEAM == "INSERT 0 1" ]]
      then
        echo Inserted in teams, $OPPONENT
      fi
    fi

    # obtener team_id de ganadores y oponentes.
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # insertar game.
    INSERTAR_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOAL')")
    # indica el registro que se inserto.
    if [[ $INSERTAR_TEAM == "INSERT 0 1" ]]
    then
      echo Inserted in games, $ROUND $YEAR between $WINNER $OPPONENT
    fi    
  fi
done
