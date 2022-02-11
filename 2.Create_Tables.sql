DROP TABLE IF EXISTS keywords;
DROP TABLE IF EXISTS gener_movie;
DROP TABLE IF EXISTS movies_companies;
DROP TABLE IF EXISTS movies_countries;
DROP TABLE IF EXISTS movies_languages;
DROP TABLE IF EXISTS movies_crew;
DROP TABLE IF EXISTS movies_genre;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS director;
DROP TABLE IF EXISTS crew;
DROP TABLE IF EXISTS production_countries;
DROP TABLE IF EXISTS production_companies;
DROP TABLE IF EXISTS spoken_languages;
DROP TABLE IF EXISTS movies;

DROP TABLE IF EXISTS movies;
CREATE TABLE movies (
  `index` INTEGER ,
  budget INTEGER ,
  genres VARCHAR(255),
  homepage VARCHAR(255) ,
  id_movie INTEGER PRIMARY KEY ,
  keywords VARCHAR(255) ,
  original_language VARCHAR(255) ,
  original_title VARCHAR(255) ,
  overview VARCHAR(1000),
  popularity FLOAT ,
  release_date VARCHAR(255),
  revenue VARCHAR(255),
  runtime VARCHAR(100),
  status_movie VARCHAR(255),
  tagline VARCHAR(255),
  title VARCHAR(255),
  vote_average FLOAT,
  vote_count INTEGER,
  cast VARCHAR(255),
  director VARCHAR(100)
);

-- Creacion de la tabal production_companies
DROP TABLE IF EXISTS production_companies;
CREATE TABLE production_companies(
    name_production_company VARCHAR(200),
    id_production_company INTEGER PRIMARY KEY
);

-- Creacion de la relacion production_companies y movies
-- movies_companies
DROP TABLE IF EXISTS movies_companies;
CREATE TABLE movies_companies(
id_movie Integer NOT NULL,
id_production_company INTEGER NOT NULL,
primary key(id_Movie,id_production_company),

CONSTRAINT FK_id_Movie_Movie_companies
        FOREIGN KEY(id_movie) REFERENCES movies(id_movie),

CONSTRAINT FK_id_Movie_production_companies
        FOREIGN KEY(id_production_company) REFERENCES production_companies(id_production_company)

);

-- Creacion de la tabla production_countries
DROP TABLE IF EXISTS production_countries;
CREATE TABLE production_countries (
iso_3166_1 VARCHAR(30) PRIMARY KEY NOT NULL,
country VARCHAR(30) NOT NULL
);

-- Creacion de la realacion entre production_countries y movie
-- movies_countries
DROP TABLE IF EXISTS movies_countries;
CREATE TABLE movies_countries(
id_movie INTEGER,
iso_3166_1 VARCHAR(30) NOT NULL,
primary key(id_Movie,iso_3166_1),
CONSTRAINT FK_id_movies_movies_countries
        FOREIGN KEY(id_movie) REFERENCES movies(id_movie),

CONSTRAINT FK_id_production_countries_movies_countries
        FOREIGN KEY(iso_3166_1) REFERENCES production_countries(iso_3166_1)
);

-- Creacion de la tabla spoken_language
CREATE TABLE spoken_languages(
iso_639_1 VARCHAR(40) PRIMARY KEY NOT NULL,
`language` VARCHAR(30)
);

-- Creacion de la relacion entre spoken_language y movies
-- movies_language
CREATE TABLE movies_languages(
id_movie Integer NOT NULL,
iso_639_1 VARCHAR(40) NOT NULL,
primary key(id_Movie,iso_639_1),

CONSTRAINT FK_id_movies_languages
        FOREIGN KEY(id_movie) REFERENCES movies(id_movie),
CONSTRAINT FK_id_movies_spoken_languages
        FOREIGN KEY(iso_639_1) REFERENCES spoken_languages(iso_639_1)
);

-- Creacion de la tabla crew
CREATE TABLE crew(
idCrew INTEGER primary key NOT NULL,
name VARCHAR(400) NOT NULL,
gender INTeger
);

-- Creacion de la tabla director
CREATE TABLE director(
  id_director VARCHAR(100) PRIMARY KEY NOT NULL,
  name_director VARCHAR(100)
);

-- Creacion de la tabla genres
CREATE TABLE genre(
idGenre VARCHAR(40) PRIMARY KEY NOT NULL,
genre VARCHAR(50)
);

-- Creacion de la relacion entre genres y movies
-- drop table genero_movie;
-- drop table genero;
CREATE TABLE movies_genre(
id_movie Integer NOT NULL,
idGenre VARCHAR(100) NOT NULL,
primary key(id_Movie,idGenre),

CONSTRAINT FK_id_movies_genero_movie
        FOREIGN KEY(id_Movie) REFERENCES movies(id_Movie),
CONSTRAINT FK_id_movies_genero_genero
        FOREIGN KEY(idGenre) REFERENCES genre(idGenre)
);