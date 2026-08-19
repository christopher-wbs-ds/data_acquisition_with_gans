DROP SCHEMA IF EXISTS gans;
CREATE SCHEMA gans;

USE gans;

CREATE TABLE cities(
    city_id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(80) NOT NULL,
    country VARCHAR(80),
    latitude FLOAT,
    longitude FLOAT
);

CREATE TABLE populations(
    city_id INT,
    population INT,
    date_gathered DATE,
    FOREIGN KEY (city_id) REFERENCES cities(city_id),
    PRIMARY KEY (city_id, date_gathered)
);
