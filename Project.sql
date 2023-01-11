CREATE TABLE Persons(
	person_id uniqueidentifier default newid() PRIMARY KEY, 
	name VARCHAR(40), 
	age INT, 
	deleted BIT DEFAULT 0
	);

CREATE TABLE Cards(
	card_id uniqueidentifier default newid() PRIMARY KEY, 
	number INT , 
	deleted BIT DEFAULT 0);
/*
CREATE TABLE PersonCards( 
	personcard_id uniqueidentifier default newid() PRIMARY KEY,
	card_id uniqueidentifier default newid() , 
	person_id uniqueidentifier default newid() , 
	delete_card_id BIT DEFAULT 0, 
	delete_person_id BIT DEFAULT 0,
	FOREIGN KEY(card_id) REFERENCES Cards(card_id),
	FOREIGN KEY(person_id) REFERENCES Person(person_id) 
	);
*/

CREATE TABLE PersonCards( 
	personcard_id uniqueidentifier default newid() PRIMARY KEY,
	card_id uniqueidentifier , 
	person_id uniqueidentifier , 
	deleted BIT DEFAULT 0
	FOREIGN KEY(card_id) REFERENCES Cards(card_id),
	FOREIGN KEY(person_id) REFERENCES Persons(person_id)
	);

INSERT INTO Persons VALUES(CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB01'), 'Ram', 15, 0);
INSERT INTO Persons VALUES(CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB02'), 'Shyam', 20, 0);
INSERT INTO Persons VALUES(CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB03'), 'Rena', 21, 0);
INSERT INTO Persons VALUES(CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB04'), 'Rita', 22, 0);
INSERT INTO Persons VALUES(CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB05'), 'Ram Raj', 15, 0);
INSERT INTO Persons VALUES(CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB06'), 'Shyam agr', 20, 0);

INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000001'), 407,0);
INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000002'), 406,0);
INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000003'), 408,0);
INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000004'), 407,0);
INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000005'), 407,0);
INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000006'), 406,0);
INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000007'), 408,0);
INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000008'), 407,0);
INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000009'), 406,0);
INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000010'), 408,0);
INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000011'), 407,0);
INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000012'), 406,0);
INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000013'), 408,0);
INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000014'), 407,0);
INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000015'), 406,0);
INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000016'), 408,0);
INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000017'), 407,0);
INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000018'), 406,0);
INSERT INTO Cards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000019'), 408,0);

INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BC86-BC0000000001'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000001'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB01'), 0);
INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-BC0000000002'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000002'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB02'), 0);
INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-BC0000000003'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000003'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB01'), 0);
INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-BC0000000004'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000004'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB03'), 0);
INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-BC0000000005'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000005'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB01'), 0);
INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-BC0000000006'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000006'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB02'), 0);
INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-BC0000000007'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000007'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB04'), 0);
INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-BC0000000008'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000008'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB01'), 0);
INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-BC0000000009'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000009'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB04'), 0);
INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-BC0000000010'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000010'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB04'), 0);
INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-BC0000000011'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000011'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB04'), 0);
INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-BC0000000012'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000012'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB04'), 0);
INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-BC0000000013'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000013'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB01'), 0);
INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-BC0000000014'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000014'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB02'), 0);
INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-BC0000000015'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000015'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB01'), 0);
INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-BC0000000016'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000016'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB01'), 0);
INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-BC0000000017'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000017'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB01'), 0);
INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-BC0000000018'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000018'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB05'), 0);
INSERT INTO PersonCards VALUES(CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-BC0000000019'), CONVERT(uniqueidentifier,'01CA36BA-10E4-438F-BA86-000000000019'), CONVERT(uniqueidentifier,'1C6A36BA-10E4-438F-BA86-0D5B68A2BB01'), 0);



/*
DELIMETER $$
CREATE
TRIGGER PersonCards BEFORE DELETE
ON Person, Cards
FOR EACH ROW BEGIN
UPDATE SET delete1=1 WHERE person_id = NEW.person_id or card_id = NEW.card_id; 

UPDATE PersonCards SET delete_card_id=1 WHERE card_id IN (SELECT card_id FROM Cards WHERE delete1=1);
UPDATE PersonCards SET delete_person_id=1 WHERE person_id IN (SELECT person_id FROM Person WHERE delete1=1);

UPDATE PersonCards SET delete1=1 WHERE person_id IN (SELECT person_id FROM Person WHERE delete1=1) or card_id IN (SELECT card_id FROM Cards WHERE delete1=1);
UPDATE Person SET delete1=1 WHERE person_id IN (SELECT person_id FROM PersonCards WHERE delete1=1);
UPDATE Cards SET delete1=1 WHERE card_id IN (SELECT card_id FROM PersonCards WHERE delete1=1);


SELECT person_id, COUNT(*) FROM PersonCards GROUP BY person_id HAVING delete_card_id <> 1 AND delete_person_id <> 1;

SELECT Person.person_id, Person.name, COUNT(1) AS no_of_cards FROM PersonCards JOIN Person on Person.person_id = PersonCards.person_id GROUP BY PersonCards.person_id HAVING delete_card_id <> 1 AND delete_person_id <> 1;

SELECT Person.person_id, Person.name, COUNT(1) AS no_of_cards FROM PersonCards JOIN Person on Person.person_id = PersonCards.person_id GROUP BY PersonCards.person_id HAVING PersonCards.delete1 <> 1;

SELECT * FROM (SELECT Person.person_id, Person.name, COUNT(1) AS no_of_cards FROM PersonCards JOIN Person on Person.person_id = PersonCards.person_id GROUP BY PersonCards.person_id HAVING PersonCards.delete1 <> 1) as Newtable WHERE no_of_cards>1;
*/

UPDATE PersonCards SET deleted=1;

UPDATE Cards SET deleted=1;

UPDATE Persons SET deleted=1;


SELECT * FROM Persons;
SELECT * FROM Cards;
SELECT * FROM PersonCards;

SELECT Persons.name, COUNT(1) AS no_of_cards 
FROM PersonCards 
JOIN Persons on Persons.person_id = PersonCards.person_id 
where PersonCards.deleted != 1
and Persons.deleted != 1
GROUP BY PersonCards.person_id, Persons.name;

SELECT Persons.name, no_of_cards from Persons JOIN 
(SELECT PersonCards.person_id as person_id, COUNT(1) AS no_of_cards FROM PersonCards GROUP BY PersonCards.person_id, PersonCards.deleted HAVING PersonCards.deleted <> 1) as TempTable on TempTable.person_id = Persons.person_id;

DELETE FROM Persons;

DELETE FROM Cards;

DELETE FROM PersonCards;


DROP TABLE Persons;
DROP TABLE Cards;
DROP TABLE PersonCards;

