-- Queries to answer the questions
-- Add these queries to your queries.sql file

-- 1. Who was the last animal seen by William Tatcher?
SELECT a.name AS animal_name, v.name AS vet_name, v.date_of_graduation, MAX(vt.visit_date) AS last_visit_date
FROM animals a
JOIN visits vt ON a.id = vt.animal_id
JOIN vets v ON vt.vet_id = v.id
WHERE v.name = 'William Tatcher'
GROUP BY a.name, v.name, v.date_of_graduation
ORDER BY last_visit_date DESC
LIMIT 1;

-- 2. How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT a.id) AS num_animals_seen
FROM animals a
JOIN visits vt ON a.id = vt.animal_id
JOIN vets v ON vt.vet_id = v.id
WHERE v.name = 'Stephanie Mendez';

-- 3. List all vets and their specialties, including vets with no specialties.
SELECT v.name AS vet_name, s.name AS specialty_name
FROM vets v
LEFT JOIN species_vets sv ON v.id = sv.vet_id
LEFT JOIN species s ON sv.species_id = s.id;

-- 4. List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT a.name AS animal_name, vt.visit_date
FROM animals a
JOIN visits vt ON a.id = vt.animal_id
JOIN vets v ON vt.vet_id = v.id
WHERE v.name = 'Stephanie Mendez'
AND vt.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

-- 5. What animal has the most visits to vets?
SELECT a.name AS animal_name, COUNT(vt.visit_date) AS num_visits
FROM animals a
JOIN visits vt ON a.id = vt.animal_id
GROUP BY a.name
ORDER BY num_visits DESC
LIMIT 1;

-- 6. Who was Maisy Smith's first visit?
SELECT a.name AS animal_name, vt.visit_date
FROM animals a
JOIN visits vt ON a.id = vt.animal_id
JOIN vets v ON vt.vet_id = v.id
WHERE v.name = 'Maisy Smith'
ORDER BY vt.visit_date
LIMIT 1;

-- 7. Details for the most recent visit: animal information, vet information, and date of visit.
SELECT a.name AS animal_name, v.name AS vet_name, v.date_of_graduation, MAX(vt.visit_date) AS last_visit_date
FROM animals a
JOIN visits vt ON a.id = vt.animal_id
JOIN vets v ON vt.vet_id = v.id
GROUP BY a.name, v.name, v.date_of_graduation
ORDER BY last_visit_date DESC
LIMIT 1;

-- 8. How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) AS num_visits_no_specialization
FROM visits vt
JOIN vets v ON vt.vet_id = v.id
JOIN animals a ON vt.animal_id = a.id
LEFT JOIN species_vets sv ON v.id = sv.vet_id AND a.species_id = sv.species_id
WHERE sv.vet_id IS NULL;

-- 9. What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT s.name AS specialty_name, COUNT(*) AS num_visits
FROM visits vt
JOIN vets v ON vt.vet_id = v.id
JOIN animals a ON vt.animal_id = a.id
LEFT JOIN species_vets sv ON v.id = sv.vet_id AND a.species_id = sv.species_id
JOIN species s ON sv.species_id = s.id
WHERE v.name = 'Maisy Smith'
GROUP BY s.name
ORDER BY num_visits DESC
LIMIT 1;
