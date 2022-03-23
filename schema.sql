/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT PRIMARY KEY NOT NULL, 
    name VARCHAR(100) NOT NULL, 
    date_of_birth DATE NOT NULL, 
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);

ALTER TABLE animals
   ADD species VARCHAR(255);

CREATE TABLE owners(
    id SERIAL PRIMARY KEY NOT NULL,
    full_name VARCHAR(100),
    age INT,
    PRIMARY KEY (owner_id)
);
