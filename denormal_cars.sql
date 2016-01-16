-- connect to denormal_cars
\c denormal_cars;

-- 1. creatge new user
CREATE USER denormal_user;

-- 2. create new database
CREATE DATABASE denormal_cars OWNER denormal_user;

-- 3. run scripts/denormal_data.sql on denormal_cars database
-- 4. inspect the table named car_models by running \dS and look at the data using some SELECT statements
SELECT *
FROM car_models;

-- 5. get list of all make_title values in car_models table, without any duplicate rows (71)
SELECT DISTINCT make_title
FROM car_models;

-- 6. list all model_title values where make_code is 'volks', without any duplicate (27)
SELECT DISTINCT model_title
FROM car_models
WHERE make_code LIKE '%VOLKS%';

-- 7. list all make_code, model_code, model_title, and year from car_models where make_code is 'LAM' (136)
SELECT DISTINCT make_code, model_code, model_title, year
FROM car_models
WHERE make_code LIKE '%LAM%';

-- 8. list all fields from car_models in years between 2010 and 2015 (7884)
SELECT *
FROM car_models
WHERE
  car_models.year >= '2010'
  AND
  car_models.year <= '2015';