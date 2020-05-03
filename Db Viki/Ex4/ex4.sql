REM ASSIGNMENT 4:Views – Security

SAVEPOINT s0;

REM 1. Create a view Schedule_15 that display the flight number, route, airport(origin, destination) departure (date, time), arrival (date, time) of a flight on 15 apr 2005. Label the view column as flight, route, from_airport, to_airport, ddate, dtime, adate, atime respectively


CREATE OR REPLACE VIEW Schedule_15 (Flight,Route,From_Airport,
			To_Airport,Ddate,Dtime,Adate,Atime)
AS (SELECT f.flightno,r.routeid,r.orig_airport,
	r.dest_airport,fl.departs,fl.dtime,fl.arrives,fl.atime
FROM Flights f,Routes r,fl_schedule fl
WHERE f.rid=r.routeid AND f.flightno=fl.flno 
	AND fl.departs = '15-APR-2005');

SELECT * FROM Schedule_15;

SAVEPOINT s1;




REM INSERT
INSERT INTO Schedule_15 VALUES(
	'BUG-25',
	'AD123',
	'New York',
	'London',
	'15-APR-05',
	1002,
	'15-APR-05',
	1130);

SELECT * FROM Schedule_15;
	
ROLLBACK TO s1;




REM Updatable columns
SELECT table_name,column_name,updatable,insertable,deletable
FROM user_updatable_columns
WHERE table_name='SCHEDULE_15';


REM Update
UPDATE Schedule_15
SET Ddate='22-MAR-20',Dtime=1000,Adate='20-MAR-23',Atime=1050
WHERE Flight='HA-1';


REM VIEW After Update
SELECT * FROM Schedule_15
WHERE Flight='HA-1';


REM TABLE After Update
SELECT * FROM Fl_Schedule
WHERE flno='HA-1';

ROLLBACK TO s1;




REM DELETE
DELETE FROM Schedule_15
WHERE Flight='HA-1';

SELECT * FROM Schedule_15
WHERE Flight='HA-1';

SELECT * FROM Fl_Schedule
WHERE flno='HA-1';

ROLLBACK TO s1;





REM 2. Define a view Airtype that display the number of aircrafts for each of its type. Label the column as craft_type, total.


CREATE OR REPLACE VIEW Airtype (Craft_Type,Total) 
AS (SELECT type,COUNT(*) 
FROM Aircraft
GROUP BY type);


SELECT * FROM Airtype;

SAVEPOINT s2;




REM INSERT
INSERT INTO Airtype VALUES(
	'Nimbus',
	10);

SELECT * FROM Airtype;

ROLLBACK TO s2;	 



REM Updatable columns
SELECT table_name,column_name,updatable,insertable,deletable
FROM user_updatable_columns
WHERE table_name='AIRTYPE';



REM DELETE
DELETE FROM Airtype
WHERE Total=1;

ROLLBACK TO s2;





REM 3. Create a view Losangeles_Route that contains Los Angeles in the route. Ensure that the view always contain/allows only information about the Los Angeles route


CREATE OR REPLACE VIEW Losangeles_Route(RouteId,ORigin,Destination,Distance)
AS (SELECT routeid,orig_airport,dest_airport,distance
FROM Routes
WHERE orig_airport='Los Angeles' OR dest_airport='Los Angeles');


SELECT * FROM Losangeles_Route; 

SAVEPOINT s3;

REM INSERT
INSERT INTO Losangeles_Route VALUES(
	'AB123',
	'INDIA',
	'Los Angeles',
	3400);

SELECT * FROM Losangeles_Route; 

ROLLBACK TO s3;



REM Updatable columns
SELECT table_name,column_name,updatable,insertable,deletable
FROM user_updatable_columns
WHERE table_name='LOSANGELES_ROUTE';

REM Update
UPDATE Losangeles_Route
SET Origin='Los Angeles',Destination='India',Distance=1000
WHERE routeid='CL150';


REM VIEW After Update
SELECT * FROM Losangeles_Route
WHERE routeid='CL150';


REM TABLE After Update
SELECT * FROM Routes
WHERE routeid='CL150';

ROLLBACK TO s3;


REM DELETE

DELETE FROM Losangeles_Route
WHERE routeid='LW100';

SELECT * FROM Routes
WHERE routeid='LW100';


ROLLBACK TO s3;





REM 4. Create a view named Losangeles_Flight on Schedule_15 (as defined in 1) that display flight, departure (date, time), arrival (date, time) of flight(s) from Los Angeles


CREATE OR REPLACE VIEW Losangeles_Flight
AS (SELECT Flight,Ddate,Dtime,Adate,Atime
FROM Schedule_15
WHERE From_Airport='Los Angeles');

SAVEPOINT s4;


SELECT * FROM Losangeles_Flight;




REM INSERT
INSERT INTO Losangeles_Flight VALUES(
	'BUG-25',
	'15-APR-05',
	1002,
	'15-APR-05',
	1130);

SELECT * FROM Losangeles_Flight;
	
ROLLBACK TO s4;





REM Updatable columns
SELECT table_name,column_name,updatable,insertable,deletable
FROM user_updatable_columns
WHERE table_name='LOSANGELES_FLIGHT';


REM Update 
UPDATE Losangeles_Flight
SET Ddate='22-MAR-20',Dtime=1000,Adate='20-MAR-23',Atime=1050
WHERE Flight='HA-1';


REM VIEW After Update
SELECT * FROM Losangeles_Flight
WHERE Flight='HA-1';


REM TABLE After Update
SELECT * FROM Fl_Schedule
WHERE flno='HA-1';


ROLLBACK TO S4;



REM DELETE
DELETE FROM Losangeles_Flight
WHERE FLIGHT='HA-1';


SELECT * FROM Losangeles_Flight
WHERE FLIGHT='HA-1';


SELECT * FROM Fl_Schedule
WHERE flno='HA-1';

ROLLBACK TO S4;











