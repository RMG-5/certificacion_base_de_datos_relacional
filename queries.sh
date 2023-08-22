#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

## Número total de goles en todos los partidos de los equipos ganadores:
echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

## Número total de goles en todos los juegos de ambos equipos combinados:
echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals + opponent_goals) FROM games")"

## Promedio de goles en todos los partidos de los equipos ganadores:
echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games")"

## Número medio de goles en todos los partidos de los equipos ganadores redondeado a dos decimales:
echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games")"

## Promedio de goles en todos los partidos de ambos equipos:
echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals + opponent_goals) FROM games")"

## Más goles marcados en un solo partido por un equipo:
echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(winner_goals) FROM games")"

## Número de partidos en los que el equipo ganador anotó más de dos goles:
echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(winner_goals) FROM games WHERE winner_goals > 2")"

## Nombre del equipo ganador del torneo 2018:
echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT name FROM games LEFT JOIN teams ON games.winner_id = teams.team_id WHERE year = 2018 AND round = 'Final'")"

## Lista de equipos que jugaron en la ronda de 'Octavos de final' de 2014:
echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT name FROM games FULL JOIN teams ON games.winner_id = teams.team_id OR games.opponent_id = teams.team_id WHERE year = 2014 AND round = 'Eighth-Final' ORDER BY name")"

## Lista de nombres únicos de equipos ganadores en todo el conjunto de datos:
echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT DISTINCT name FROM games LEFT JOIN teams ON games.winner_id = teams.team_id ORDER BY name")"

## Año y nombre de todos los equipo campeones:
echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT year, name FROM games LEFT JOIN teams ON games.winner_id = teams.team_id WHERE round = 'Final' ORDER BY year")"

## Lista de equipos que comienzan con 'Co':
echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%' ORDER BY name")"
