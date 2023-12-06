-- Insert data for vets
INSERT INTO vets (name, age, date_of_graduation) VALUES
    ('William Tatcher', 45, '2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'),
    ('Jack Harkness', 38, '2008-06-08');

-- Insert data for species
INSERT INTO species (name) VALUES
    ('Pokemon'),
    ('Digimon');

-- Insert data for species_vets join table
INSERT INTO species_vets (vet_id, species_id) VALUES
    ((SELECT id FROM vets WHERE name = 'William Tatcher' LIMIT 1), (SELECT id FROM species WHERE name = 'Pokemon' LIMIT 1)),
    ((SELECT id FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1), (SELECT id FROM species WHERE name = 'Digimon' LIMIT 1)),
    ((SELECT id FROM vets WHERE name = 'Jack Harkness' LIMIT 1), (SELECT id FROM species WHERE name = 'Digimon' LIMIT 1));

-- Insert data for visits
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES
    (1, 1, '2020-05-24'),  -- Agumon visited William Tatcher
    (1, 3, '2020-07-22'),  -- Agumon visited Stephanie Mendez
    (2, 4, '2021-02-02'),  -- Gabumon visited Jack Harkness
    (3, 2, '2020-01-05'),  -- Pikachu visited Maisy Smith
    (3, 2, '2020-03-08'),  -- Pikachu visited Maisy Smith
    (3, 2, '2020-05-14'),  -- Pikachu visited Maisy Smith
    (4, 3, '2021-05-04'),  -- Devimon visited Stephanie Mendez
    (5, 4, '2021-02-24'),  -- Charmander visited Jack Harkness
    (6, 2, '2019-12-21'),  -- Plantmon visited Maisy Smith
    (6, 1, '2020-08-10'),  -- Plantmon visited William Tatcher
    (6, 2, '2021-04-07'),  -- Plantmon visited Maisy Smith
    (7, 3, '2019-09-29'),  -- Squirtle visited Stephanie Mendez
    (8, 4, '2020-10-03'),  -- Angemon visited Jack Harkness
    (8, 4, '2020-11-04'),  -- Angemon visited Jack Harkness
    (9, 2, '2019-01-24'),  -- Boarmon visited Maisy Smith
    (9, 2, '2019-05-15'),  -- Boarmon visited Maisy Smith
    (9, 2, '2020-02-27'),  -- Boarmon visited Maisy Smith
    (9, 2, '2020-08-03'),  -- Boarmon visited Maisy Smith
    (10, 3, '2020-05-24'), -- Blossom visited Stephanie Mendez
    (10, 1, '2021-01-11'); -- Blossom visited William Tatcher
