DROP DATABASE IF EXISTS number_guess;
CREATE DATABASE number_guess;
\connect number_guess

CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(22) UNIQUE NOT NULL
);

CREATE TABLE games (
  game_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(user_id),
  guesses INT NOT NULL
);

