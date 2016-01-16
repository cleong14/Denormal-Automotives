-- connect to normal_cars
\c normal_cars;

-- 1. create new user normal_user
-- CREATE USER normal_user;

-- 2. create new database normal_cars owned by normal_user
-- CREATE DATABASE normal_cars OWNER normal_user;

-- 3. whiteboard solution to normalizing denormal_cars schema
-- SELECT *
-- FROM car_models;

-- model_code, model_title, year should all be linked to each other along with referencing make_title

-- 5. create tables for normalization
-- drop tables if they exist
DROP TABLE IF EXISTS make, models;

-- create make table
CREATE TABLE make (
  id  serial  NOT NULL PRIMARY KEY,
  make_code  char (125)  NOT NULL,
  make_title  char (125)  NOT NULL
);

-- 6. insert data to normalize
INSERT INTO make (make_code, make_title)

SELECT DISTINCT
  make_code,
  make_title
FROM car_models;

-- -- like a console log
-- SELECT *
-- FROM make;

-- create Model table - columns 'id', 'code', 'title', 'year', 'make_id'
CREATE TABLE models (
  id  serial  NOT NULL  PRIMARY KEY,
  model_code  char (125)  NOT NULL,
  model_title  char (125)  NOT NULL,
  year  int  NOT NULL,
  make_id  int  REFERENCES  make (id)
);

-- 6. insert data to normalize
INSERT INTO models (model_code, model_title, year, make_id)

SELECT DISTINCT
  car_models.model_code,
  car_models.model_title,
  car_models.year,
  make.id
FROM car_models INNER JOIN make ON (make.make_code = car_models.make_code);

-- like console log
-- SELECT *
-- FROM models;

-- 7. query to select all make_title values in car model table (71)
-- SELECT make_title
-- FROM make;

-- 8. query to list all model_title values where make_code is 'VOLKS' (27)
-- SELECT DISTINCT model_title
-- FROM models INNER JOIN make ON (models.make_id = make.id)
-- WHERE make.make_code LIKE '%VOLKS%';

-- 9. list all make_code, model_code, model_title, year from car_models where make_code is 'LAM' (136)
-- SELECT DISTINCT make_code, model_code, model_title, year
-- FROM models INNER JOIN make ON (models.make_id = make.id)
-- WHERE make.make_code LIKE '%LAM%';

-- 10. (7884)
SELECT *
FROM models
WHERE models.year BETWEEN '2010' AND '2015';