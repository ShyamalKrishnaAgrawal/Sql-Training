DROP TABLE Employees;
DROP TABLE Branch;
DROP TABLE Client;
DROP TABLE Works_with;
DROP TABLE Branch_supplier;

CREATE TABLE Employees (
	emp_id INT PRIMARY KEY,
	first_name VARCHAR(40),
	last_name VARCHAR(40),
	birthday DATE,
	sex VARCHAR(1),
	salary INT,
	super_id INT,
	branch_id INT
);

CREATE TABLE Branch(
	branch_id INT PRIMARY KEY,
	branch_name VARCHAR(40),
	mgr_id INT,
	mgr_start_date DATE,
	FOREIGN KEY(mgr_id) REFERENCES Employees(emp_id) 
);

ALTER TABLE Employees ADD FOREIGN KEY (branch_id) REFERENCES Branch(branch_id); 

ALTER TABLE Employees ADD FOREIGN KEY (super_id) REFERENCES Employees(emp_id); 

CREATE TABLE Client(
	client_id INT PRIMARY KEY,
	client_name VARCHAR(40),
	branch_id INT,
	FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

CREATE TABLE Works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES Employees(emp_id),
  FOREIGN KEY(client_id) REFERENCES Client(client_id)
);

CREATE TABLE Branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES Branch(branch_id)
);

EXEC sp_help 'Employees';
EXEC sp_help 'Branch';
EXEC sp_help 'Client';
EXEC sp_help 'Works_with';
EXEC sp_help 'Branch_supplier';

-- Corporate
INSERT INTO Employees VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO Branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE Employees
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO Employees VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton
INSERT INTO Employees VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE Employees
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO Employees VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO Employees VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO Employees VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO Employees VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE Employees
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO Employees VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO Employees VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

SELECT * FROM Employees;
SELECT * FROM branch;
SELECT * FROM branch_supplier;
SELECT * FROM client;
SELECT * FROM works_with;

SELECT DISTINCT branch_id FROM Branch;
SELECT COUNT(branch_id) FROM Branch;
SELECT COUNT(emp_id) as cnt_employees FROM Employees where sex='F' AND birthday >= '1971-01-01';

SELECT AVG(salary) FROM Employees;
SELECT SUM(salary) FROM Employees;

SELECT COUNT(sex), sex from Employees group by sex;

SELECT * FROM Employees where first_name like 'J%';

SELECT * FROM Employees where first_name like 'Jo__';

SELECT first_name FROM Employees
Union
SELECT branch_name FROM branch;

INSERT INTO branch VALUES(4, 'bufallo', NULL, NULL);

SELECT Employees.emp_id, Employees.first_name, Branch.branch_id FROM Employees JOIN Branch
ON Employees.emp_id = Branch.mgr_id;

SELECT Employees.emp_id, Employees.first_name, Branch.branch_id FROM Employees LEFT JOIN Branch
ON Employees.emp_id = Branch.mgr_id;

SELECT Employees.emp_id, Employees.first_name, Branch.branch_id FROM Employees RIGHT JOIN Branch
ON Employees.emp_id = Branch.mgr_id;

SELECT Employees.emp_id, Employees.first_name, Branch.branch_id FROM Employees FULL JOIN Branch
ON Employees.emp_id = Branch.mgr_id;

SELECT Employees.emp_id, Employees.first_name, Branch.branch_id FROM Employees LEFT JOIN Branch
ON Employees.emp_id = Branch.mgr_id;

DECLARE @person_id UNIQUEIDENTIFIER
SET @person_id = NEWID()

DECLARE @guid uniqueidentifier = NEWID();
SELECT @guid as 'GUID';

CREATE TABLE Person(
	person_id uniqueidentifier default newid() PRIMARY KEY, 
	name VARCHAR(40), 
	age INT, 
	delete1 BIT DEFAULT 0
	);

CREATE TABLE Cards(
	card_id uniqueidentifier default newid() PRIMARY KEY, 
	number INT , 
	delete1 BIT DEFAULT 0);
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
	delete1 BIT DEFAULT 0
	FOREIGN KEY(card_id) REFERENCES Cards(card_id),
	FOREIGN KEY(person_id) REFERENCES Person(person_id)
	);

/*

used in sql only


DELIMETER $$
CREATE
TRIGGER PersonCards BEFORE DELETE
ON Person, Cards
FOR EACH ROW BEGIN
UPDATE SET delete1=1 WHERE person_id = NEW.person_id or card_id = NEW.card_id; 
*/

/*
UPDATE PersonCards SET delete_card_id=1 WHERE card_id IN (SELECT card_id FROM Cards WHERE delete1=1);
UPDATE PersonCards SET delete_person_id=1 WHERE person_id IN (SELECT person_id FROM Person WHERE delete1=1);

UPDATE PersonCards SET delete1=1 WHERE person_id IN (SELECT person_id FROM Person WHERE delete1=1) or card_id IN (SELECT card_id FROM Cards WHERE delete1=1);
UPDATE Person SET delete1=1 WHERE person_id IN (SELECT person_id FROM PersonCards WHERE delete1=1);
UPDATE Cards SET delete1=1 WHERE card_id IN (SELECT card_id FROM PersonCards WHERE delete1=1);


SELECT person_id, COUNT(*) FROM PersonCards GROUP BY person_id HAVING delete_card_id <> 1 AND delete_person_id <> 1;

SELECT Person.person_id, Person.name, COUNT(1) AS no_of_cards FROM PersonCards JOIN Person on Person.person_id = PersonCards.person_id GROUP BY PersonCards.person_id HAVING delete_card_id <> 1 AND delete_person_id <> 1;

SELECT Person.person_id, Person.name, COUNT(1) AS no_of_cards FROM PersonCards JOIN Person on Person.person_id = PersonCards.person_id GROUP BY PersonCards.person_id HAVING PersonCards.delete1 <> 1;

SELECT * FROM (SELECT Person.person_id, Person.name, COUNT(1) AS no_of_cards FROM PersonCards JOIN Person on Person.person_id = PersonCards.person_id GROUP BY PersonCards.person_id HAVING PersonCards.delete1 <> 1) as Newtable WHERE no_of_cards>1;
--UPDATE PersonCards SET DELETEDPERSONID=1 WHERE PERSONID NOT IN (SELECT PERSONID FROM PERSONID);

-- if a composite/primary key is also a foriegn key and we want to delete its value we need to delete entire row/We need to use on delete cascade
*/

/*

Trigger event

CREATE OR ALTER TRIGGER trigger_name1
ON Person    
[ WITH <dml_trigger_option> [ ,...n ] ]  
{ FOR | AFTER }   
{ [ INSERT ] [ , ] [ UPDATE ] [ , ] [ DELETE ] }   
AS { UPDATE PersonCards SET delete1=1 WHERE person_id = NEW.person_id or card_id = NEW.card_id
[ ; ] [ ,...n ] } 
*/