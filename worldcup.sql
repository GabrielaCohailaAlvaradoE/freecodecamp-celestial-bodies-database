-- World Cup Database
DROP DATABASE IF EXISTS worldcup;
CREATE DATABASE worldcup;
\connect worldcup

CREATE TABLE teams (
  team_id SERIAL PRIMARY KEY,
  name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE games (
  game_id SERIAL PRIMARY KEY,
  year INT NOT NULL,
  round VARCHAR(30) NOT NULL,
  winner_id INT NOT NULL REFERENCES teams(team_id),
  opponent_id INT NOT NULL REFERENCES teams(team_id),
  winner_goals INT NOT NULL,
  opponent_goals INT NOT NULL
);

ALTER TABLE teams OWNER TO freecodecamp;
ALTER TABLE games OWNER TO freecodecamp;

