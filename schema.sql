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

CREATE TABLE species(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(100),
    PRIMARY KEY (species_id)
);

-- Remove column species
ALTER TABLE animals DROP species;

--Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
ADD species_id INT,
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species (id)

--Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
ADD owner_id INT,
ADD CONSTRAINT fk_owner
FOREIGN KEY (owner_id)
REFERENCES owners (id)