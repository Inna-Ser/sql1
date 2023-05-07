CREATE TABLE people
(
    id         BIGSERIAL   NOT NULL PRIMARY KEY,
    first_name VARCHAR(60) NOT NULL,
    last_name  VARCHAR(60) NOT NULL,
    gender     VARCHAR(6)  NOT NULL,
    age        INT         NOT NULL
);
INSERT INTO people (first_name, last_name, gender, age)
VALUES ('Michail', 'Ivanov', 'male', 35),
       ('Valeriy', 'Smirnov', 'male', 58),
       ('Elena', 'Petrova', 'female', 25),
       ('Michail', 'Lapin', 'male', 30),
       ('Elena', 'Grach', 'female', 48);

CREATE TABLE city
(
    city_id   BIGSERIAL NOT NULL PRIMARY KEY ,
    city_name VARCHAR(50) NOT NULL
);
INSERT INTO city (city_name)
VALUES ('St_Petersburg'),
       ('Samara'),
       ('Vladivostok'),
       ('Kazan'),
       ('Penza'),
       ('Orel'),
       ('Saratov');

ALTER TABLE people
    ADD COLUMN city_id INT;
UPDATE people
SET city_id = CASE id
                  WHEN 1 THEN 2
                  WHEN 2 THEN 3
                  WHEN 3 THEN 2
                  WHEN 4 THEN 1
                  WHEN 5 THEN 7
                  ELSE city_id END;
ALTER TABLE people ADD FOREIGN KEY (city_id) REFERENCES city(city_id);
SELECT  first_name, last_name, city_name
FROM city
INNER JOIN people
ON city.city_id = people.city_id;
SELECT city_name, first_name, last_name
FROM city
LEFT JOIN people
ON city.city_id = people.city_id
ORDER BY city_name DESC;
SELECT first_name, last_name, city_name
FROM city
FULL OUTER JOIN people
ON city.city_id = people.city_id
ORDER BY city_name;
SELECT first_name,last_name, city_name
FROM city
CROSS JOIN people;
-- SELECT *
-- FROM city;
-- SELECT *
-- FROM people;