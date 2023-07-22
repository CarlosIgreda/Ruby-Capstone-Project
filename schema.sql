DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS labels;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS music_albums;

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE authors(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL
)

CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)
);

CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  genre_id INT REFERENCES genres(id),
  author_id INT REFERENCES authors(id),
  label_id INT REFERENCES labels(id),
  publish_date DATE,
  archived BOOLEAN
);

CREATE TABLE games(
  id INT PRIMARY KEY REFERENCES items(id),
  last_played_at DATE NOT NULL,
  multiplayer NULL
)

CREATE TABLE books (
  id INT PRIMARY KEY REFERENCES items(id),
  title VARCHAR(255),
  publisher VARCHAR(255),
  cover_state VARCHAR(255)
);

CREATE TABLE music_albums (
  id INT PRIMARY KEY REFERENCES items(id),
  on_spotify BOOLEAN
);