-- Insercion de los datos de la tabla movie_dataset ala tabla movie
INSERT INTO movie
SELECT .`index`,budget,genres,homepage,id_Movie,keywords,original_language,original_title,
       overview,popularity,release_date,revenue,runtime,`status`,tagline,title,
       vote_average,vote_count,cast,MD5(director)
	FROM movie_dataset_cleaned ;
    
-- Insercion de la tabla production_companies despues de llamar al procedimiento respectivo
INSERT INTO production_companies
SELECT DISTINCT name_production_company,id_production_company
FROM tmp_production_companies ;

-- Se Inserta los datos en la tabla que surge de la relacion entre movies y companies
INSERT INTO movies_companies
SELECT  DISTINCT m.id_Movie,  pc.id_production_companies
FROM movie m, tmp_production_companies tp, production_companies pc
WHERE m.id_Movie = tp.id_movie AND tp.id_production_company = pc.id_production_companies;

-- Insercion de datos en la tabla production_countries
INSERT INTO production_countries
SELECT DISTINCT iso_3166_1,country
FROM tmp_production_countries ;

-- Se insertan los datos en la tabla que surge de la relacion entre movies y countries
INSERT INTO movies_countries
SELECT  DISTINCT m.id_Movie,  pc.iso_3166_1
FROM movie m, tmp_production_countries tp, production_countries pc
WHERE m.id_Movie = tp.id_movie AND tp.iso_3166_1 = pc.iso_3166_1;

-- Insercion de los datos en la tabla spoken_language
INSERT INTO spoken_languages
SELECT DISTINCT iso_639_1,`language`
FROM tmp_spoken_languages ;

-- Se insertan los datos en la tabla que surge de la relacion entre movies y language
INSERT INTO movies_languages
SELECT  DISTINCT m.id_Movie,  sl.iso_639_1
FROM movie m, tmp_spoken_languages tsl, spoken_languages sl
WHERE m.id_Movie = tsl.id_movie AND tsl.iso_639_1 = sl.iso_639_1;

-- Insercion de datos en la tabla genres
INSERT INTO genre
SELECT DISTINCT idGe,tmg.genre
FROM  tmp_genres;

--  Se insertan los datos en la tabla que surge de la relacion entre movies y genre
INSERT INTO genre_movie
SELECT m.id_Movie,  g.idGenre
FROM movie m,tmp_genres tm, genero g
WHERE m.id_Movie = tm.id_movie AND tm.idGenre = g.idGenre;

