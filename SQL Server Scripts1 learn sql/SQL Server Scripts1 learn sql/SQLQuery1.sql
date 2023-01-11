DROP TABLE student;

CREATE TABLE student ( 
	student_id INT NOT NULL,
	name VARCHAR(20) NOT NULL, 
	major VARCHAR(20) DEFAULT 'undecided'
	PRIMARY KEY(STUDENT_ID)
	--major varchar(20) unique
	);

EXEC sp_help 'student';

INSERT INTO student VALUES(1, 'Jack', 'Biology');
INSERT INTO student VALUES(2, 'Kate', 'Sociology');
INSERT INTO student(student_id, name) VALUES(3, 'Clarie');
INSERT INTO student VALUES(4, 'Jack', 'Biology');
INSERT INTO student VALUES(5, 'Mike', 'Computer Science');

update student set major='Comp' where student_id=3;
delete from student where name='Tom' and major='undecied';
delete from student where name='Tom' or major='undecied';
SELECT* FROM student;

SELECT* FROM student order by name desc;

SELECT* FROM student where major in ('Biology','Sociology');

SELECT Top 2 * FROM student order by major,student_id desc;
ALTER TABLE FK ADD CONSTRAINT FK_P_Id 
FOREIGN KEY (P_Id) REFERENCES PK (P_Id) ON UPDATE CASCADE;

alter table employee add foreign key(st_id) reference employee(emp_id) on delete set NULL;

SELECT* FROM student order by major, student_id desc;

ALTER TABLE student ADD gpa DECIMAL(3,2);

ALTER TABLE student DROP COLUMN gpa;

/*
DELIMITER $$
	CREATE
	TRIGGER PersonCards BEFORE DELETE
	ON Person, Cards
	FOR EACH ROW BEGIN
	UPDATE SET delete1=1 WHERE person_id = NEW.person_id or card_id = NEW.card_id; 
	END$$
DELIMITER;

DELIMITER $$
	CREATE
	TRIGGER My_triger2 BEFORE INSERT
	ON Employees
	FOR EACH ROW BEGIN
		if NEW.sex ='M' THEN
			INSERT INTO trigger_test values('added MALE');
		ELSE IF NEW.sex ='f' THEN
			INSERT INTO trigger_test values('added FEMALE');
		ELSE
			INSERT INTO trigger_test values('added SOMEONE');
	END IF;
	END$$
DELIMITER;
*/

--check hot to inser multiple values in column single row
