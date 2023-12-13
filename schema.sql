-- Create the vets table
CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER,
    date_of_graduation DATE
);

-- Create the species_vets join table
CREATE TABLE species_vets (
    vet_id INTEGER REFERENCES vets(id),
    species_id INTEGER REFERENCES species(id),
    PRIMARY KEY (vet_id, species_id)
);

-- Create the visits join table
CREATE TABLE visits (
    animal_id INTEGER REFERENCES animals(id),
    vet_id INTEGER REFERENCES vets(id),
    visit_date DATE,
    PRIMARY KEY (animal_id, vet_id, visit_date)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

SELECT * FROM owners WHERE email = 'owner_18327@mail.com';
7:32
INSERT INTO owners (full_name, email)
SELECT 'Owner ' || generate_series(1, 2500000), 'owner_' || generate_series(1, 2500000) || '@mail.com';






