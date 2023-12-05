BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT my_savepoint;

UPDATE animals SET weight_kg = weight_kg * -1;


ROLLBACK TO my_savepoint;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

SELECT * FROM animals;
