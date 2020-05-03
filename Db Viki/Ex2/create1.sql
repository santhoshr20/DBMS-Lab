REM Part – I : DML Update operations & TCL statements
REM Classes table creation

CREATE TABLE Classes(
	class varchar2(20) CONSTRAINT class_pk PRIMARY KEY,
	type varchar2(2) CONSTRAINT type_ck CHECK(type in('bb','bc')),
	country varchar2(20),
	numGuns number(10),
	bore number(10),
	displacement number(20));

desc Classes;

Rem 1. Add first two tuples from the above sample data. List the columns explicitly in the INSERT clause. (No ordering of columns)

INSERT INTO Classes(
	country,
	class,
	type,
	numGuns,
	bore,
	displacement)
VALUES(
	'Germany',
	'Bismark',
	'bb',
	8,
	14,
	32000);


INSERT INTO Classes(
	country,
	class,
	type,
	numGuns,
	displacement,
	bore)
VALUES(
	'USA',
	'lowa',
	'bb',
	9,
	46000,
	16);

REM 2. Populate the relation with the remaining set of tuples. This time, do not list the columns in the INSERT clause.

INSERT INTO Classes Values(
	'Kongo',
	'bc',
	'Japan',
	8,
	15,
	42000);


INSERT INTO Classes Values(
	'North Carolina',
	'bb',
	'USA',
	9,
	16,
	37000);


INSERT INTO Classes Values(
	'Revenge',
	'bb',
	'Gt. Britain',
	8,
	15,
	29000);

INSERT INTO Classes Values(
	'Renown',
	'bc',
	'Gt. Britain',
	6,
	15,
	32000);


REM 3. Display the populated relation.

SELECT * FROM Classes;


REM 4. Mark an intermediate point here in this transaction.

SAVEPOINT s1;


REM 5. Change the displacement of Bismark to 34000.

UPDATE Classes 
SET displacement = 34000 
WHERE class = 'Bismark';
SELECT * FROM Classes WHERE class = 'Bismark';


REM 6. For the battleships having at least 9 number of guns or the ships with at least 15 inch bore,increase the displacement by 10%. Verify your changes to the table.

UPDATE Classes
SET displacement = displacement + (displacement * 10.0/100.0)
WHERE numGuns>=9 OR bore >=15;

SELECT * FROM Classes
WHERE numGuns>=9 OR bore >=15;


REM 7. Delete Kongo class of ship from Classes table.

DELETE Classes WHERE class = 'Kongo';
SELECT * FROM Classes;

REM 8. Display your changes to the table.

SELECT * FROM Classes;

REM 9. Discard the recent updates to the relation without discarding the earlier INSERT operation(s).

ROLLBACK TO s1;
SELECT * FROM Classes;


REM 10. Commit the changes.

COMMIT;
