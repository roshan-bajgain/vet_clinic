/* Populate database with sample data. */
INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES (
        1, 
        'Agumon',
        '2020-02-03',
        0,
        TRUE,
        10.23
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES (
    2, 
    'Gabumon',
    '2018-11-15',
    2,
    TRUE,
    8
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    3,
    'Pikachu',
    '2021-01-7',
    1,
    FALSE,
    15.08
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    4,
    'Devimon',
    '2017-05-12',
    5,
    TRUE,
    11
);

/*Inserting new data to table*/

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    5,
    'Charmander',
    '2020-02-08',
    0,
    FALSE,
    -11
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUE(
    6,
    'Plantmon',
    '2022-11-15',
    2,
    true,
    -5.7
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    7,
    'Squirtle',
    '1993-04-02',
    3,
    FALSE,
    -12.13
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    8,
    'Angemon',
    '2005-06-12',
    1,
    TRUE,
    -45.0
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    9,
    'Boarmon',
    '2005-06-07',
    7,
    TRUE,
    20.4
);

INSERT INTO animals(
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
) VALUES(
    10,
    'Blossom',
    '1998-10-13',
    3,
    TRUE,
    17
);

-- Inserting data into owners table
INSERT INTO owners(full_name,age) VALUES('sam smith',34);
INSERT INTO owners(full_name,age) VALUES('Jennifer Orwell',19);
INSERT INTO owners(full_name,age) VALUES('Bob',45);
INSERT INTO owners(full_name,age) VALUES('Melody Pond', 77);
INSERT INTO owners(full_name,age) VALUES('Dean Winchester',14);
INSERT INTO owners(full_name,age) VALUES('Jodie Whittaker',38);

-- Inserting data into species table
INSERT INTO species(name) VALUES('Pokemon');
INSERT INTO species(name) VALUES('Digimon');

/* Modify your inserted animals so it includes the species_id value */
UPDATE animals
  SET species_id = 
        (SELECT id FROM species WHERE name = 'Digimon')
  WHERE name LIKE '%mon';

UPDATE animals
  SET species_id = 
        (SELECT id FROM species WHERE name = 'pokemon')
  WHERE species_id IS NULL;

COMMIT TRANSACTION;

/* Modify your inserted animals to include owner information (owner_id) */
BEGIN TRANSACTION;

UPDATE animals
  SET owner_id = 
        (SELECT id FROM owners WHERE full_name = 'sam smith')
  WHERE name = 'Agumon';

UPDATE animals
  SET owner_id = 
        (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
  WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
  SET owner_id = 
        (SELECT id FROM owners WHERE full_name = 'Bob')
  WHERE name IN ('Devimon','Plantmon');

UPDATE animals
  SET owner_id = 
        (SELECT id FROM owners WHERE full_name = 'Melody Pond')
  WHERE name IN ('Charmander', 'Squirtle','Blossom');

UPDATE animals
  SET owner_id = 
        (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
  WHERE name IN ('Angemon', 'Boarmon');

COMMIT TRANSACTION;

-- Inserting data into vets table

INSERT INTO
  vets
    (name, age, date_of_graduation)
  VALUES
    ('William Tatcher', 45, 'Apr 23, 2000'),
    ('Maisy Smith', 26, 'Jan 17, 2019'),
    ('Stephanie Mendez', 64, 'May 4, 1981'),
    ('Jack Harkness', 38, 'Jun 8, 2008');

-- Specializations table data

INSERT INTO 
  specializations
    (species_id, vet_id)
  VALUES
    (
      (
        SELECT id 
        FROM species 
        WHERE name = 'Pokemon'
      ),
      (
        SELECT id 
        FROM vets 
        WHERE name = 'William Tatcher'
      )
    ),
    (
      (
        SELECT id 
        FROM species 
        WHERE name = 'Pokemon'
      ),
      (
        SELECT id 
        FROM vets 
        WHERE name = 'Stephanie Mendez'
      )
    ),
    (
      (
        SELECT id 
        FROM species 
        WHERE name = 'Digimon'
      ),
      (
        SELECT id 
        FROM vets 
        WHERE name = 'Stephanie Mendez'
      )
    ),
    (
      (
        SELECT id 
        FROM species 
        WHERE name = 'Digimon'
      ),
      (
        SELECT id 
        FROM vets 
        WHERE name = 'Jack Harkness'
      )
    );


-- Visits table with data

INSERT INTO
  visits
    (animal_id, vet_id,  date_of_visit)
  VALUES 
    (
      (
        SELECT id
        FROM animals
        WHERE name = 'Agumon'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'William Tatcher'
      ),
      'May 24, 2020'
    ),
    (
      (
        SELECT id
        FROM animals
        WHERE name = 'Agumon'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'Stephanie Mendez'
      ),
      'Jul 22, 2020'
    ),
    (
      (
        SELECT id
        FROM animals
        WHERE name = 'Gabumon'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'Jack Harkness'
      ),
      'Feb 2, 2021'
    ),
    (
      (
        SELECT id
        FROM animals
        WHERE name = 'Pikachu'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'Maisy Smith'
      ),
      'Jan 5, 2020'
    ),
    (
      (
        SELECT id
        FROM animals
        WHERE name = 'Pikachu'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'Maisy Smith'
      ),
      'Mar 8, 2020'
    ),
    (
      (
        SELECT id
        FROM animals
        WHERE name = 'Pikachu'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'Maisy Smith'
      ),
      'May 14, 2020'
    ),
    (
      (
        SELECT id
        FROM animals
        WHERE name = 'Devimon'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'Stephanie Mendez'
      ),
      'May 4, 2021'
    ),
    (
      (
        SELECT id
        FROM animals
        WHERE name = 'Charmander'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'Jack Harkness'
      ),
      'Feb 24, 2021'
    ),
    (
      (
        SELECT id
        FROM animals
        WHERE name = 'Plantmon'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'Maisy Smith'
      ),
      'Dec 21, 2019'
    ),
    (
      (
        SELECT id
        FROM animals
        WHERE name = 'Plantmon'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'William Tatcher'
      ),
      'Aug 10, 2020'
    ),
    (
      (
        SELECT id
        FROM animals
        WHERE name = 'Plantmon'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'Maisy Smith'
      ),
      'Apr 7, 2021'
    ),
    (
      (
        SELECT id
        FROM animals
        WHERE name = 'Squirtle'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'Stephanie Mendez'
      ),
      'Sep 29, 2019'
    ),
    (
      (
        SELECT id
        FROM animals
        WHERE name = 'Angemon'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'Jack Harkness'
      ),
      'Oct 3, 2020'
    ),
    (
      (
        SELECT id
        FROM animals
        WHERE name = 'Angemon'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'Jack Harkness'
      ),
      'Nov 4, 2020'
    ),
    (
      (
        SELECT id
        FROM animals
        WHERE name = 'Boarmon'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'Maisy Smith'
      ),
      'Jan 24, 2019'
    ),
     (
      (
        SELECT id
        FROM animals
        WHERE name = 'Boarmon'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'Maisy Smith'
      ),
      'May 15, 2019'
    ),
     (
      (
        SELECT id
        FROM animals
        WHERE name = 'Boarmon'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'Maisy Smith'
      ),
      'Feb 27, 2020'
    ),
     (
      (
        SELECT id
        FROM animals
        WHERE name = 'Boarmon'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'Maisy Smith'
      ),
      'Aug 3, 2020'
    ),
     (
      (
        SELECT id
        FROM animals
        WHERE name = 'Blossom'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'Stephanie Mendez'
      ),
      'May 24, 2020'
    ),
     (
      (
        SELECT id
        FROM animals
        WHERE name = 'Blossom'
      ),
      (
        SELECT id 
        FROM vets
        WHERE name = 'William Tatcher'
      ),
      'Jan 11, 2021'
    );