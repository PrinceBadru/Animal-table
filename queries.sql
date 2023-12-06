/*Queries that provide answers to the questions from all projects.*/
-- Queries using JOIN to answer the questions
-- Add these queries to your queries.sql file

-- 1. What animals belong to Melody Pond?
SELECT * FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

-- 2. List of all animals that are Pokemon.
SELECT * FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- 3. List all owners and their animals, including those that don't own any animal.
SELECT owners.full_name, animals.name AS animal_name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

-- 4. How many animals are there per species?
SELECT species.name, COUNT(*) AS animal_count
FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

-- 5. List all Digimon owned by Jennifer Orwell.
SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

-- 6. List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- 7. Who owns the most animals?
SELECT owners.full_name, COUNT(*) AS animal_count
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY animal_count DESC
LIMIT 1;
