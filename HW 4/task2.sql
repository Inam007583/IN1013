-- Use the created database
USE pet_database;

-- 1. Insert event for Fluffy
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');

-- 2. Insert Hammy's details into petPet and an event into petEvent
INSERT INTO petPet (petname, owner, species, gender, birth)
VALUES ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30');

INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');

-- 3. Add information about Fluffy's kittens (5 kittens, 2 males)
INSERT INTO petPet (petname, owner, species, gender, birth)
VALUES ('Kitten1', 'John Doe', 'cat', 'M', '2020-09-01'),
       ('Kitten2', 'John Doe', 'cat', 'M', '2020-09-01'),
       ('Kitten3', 'John Doe', 'cat', 'F', '2020-09-01'),
       ('Kitten4', 'John Doe', 'cat', 'F', '2020-09-01'),
       ('Kitten5', 'John Doe', 'cat', 'F', '2020-09-01');

-- 4. Insert event for Claws
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Claws', '1997-08-03', 'injury', 'broken rib');

-- 5. Update Puffball's death date
UPDATE petPet
SET death = '2020-09-01'
WHERE petname = 'Puffball';

-- 6. Remove Harold's dog due to GDPR
DELETE FROM petPet
WHERE owner = 'Harold' AND species = 'dog';
