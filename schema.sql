/* Database schema to keep the structure of entire database. */

-- Add the species column to the animals table
ALTER TABLE animals
ADD COLUMN species VARCHAR(255);

-- Insert data into the animals table (include in your data.sql file)
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES
    (5, 'Charmander', '2020-02-08', 0, false, -11, 'unspecified'),
    (6, 'Plantmon', '2021-11-15', 2, true, -5.7, 'unspecified'),
    (7, 'Squirtle', '1993-04-02', 3, false, -12.13, 'unspecified'),
    (8, 'Angemon', '2005-06-12', 1, true, -45, 'unspecified'),
    (9, 'Boarmon', '2005-06-07', 7, true, 20.4, 'unspecified'),
    (10, 'Blossom', '1998-10-13', 3, true, 17, 'unspecified'),
    (11, 'Ditto', '2022-05-14', 4, true, 22, 'unspecified');

