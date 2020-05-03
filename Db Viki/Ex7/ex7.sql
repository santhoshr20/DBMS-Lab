REM Ex7
REM PL/SQL – Triggers

REM 1. The date of arrival should be always later than or on the same date of departure.

CREATE OR REPLACE TRIGGER dept_date
BEFORE INSERT OR UPDATE
ON fl_schedule
FOR EACH ROW

BEGIN	
	IF (:new.departs>:new.arrives) OR (:new.departs>:old.arrives) OR (:old.departs>:new.arrives) THEN
		RAISE_APPLICATION_ERROR(-20111,'The date of arrival should be always later than or on the same date of departure');
	END IF;
END;
/

REM insert
INSERT INTO fl_schedule values('AF-12','25-apr-2005',1245,'21-apr-2005',1850,450.25);

SELECT * FROM fl_schedule
WHERE flno='AF-12' AND departs='25-apr-2005';


REM update
UPDATE fl_schedule
SET departs='25-apr-2005'
WHERE flno='AF-12' AND departs='22-apr-2005';

SELECT * FROM fl_schedule
WHERE flno='AF-12' AND departs='25-apr-2005'; 



REM 2. Flight number CX7520 is scheduled only on Tuesday, Friday and Sunday

CREATE OR REPLACE TRIGGER check_day
BEFORE INSERT OR UPDATE ON fl_schedule
FOR EACH ROW
DECLARE 
	day_name VARCHAR2(10);
BEGIN
	SELECT TO_CHAR(:NEW.departs,'DY') INTO day_name FROM DUAL;
	IF(:NEW.flno='CX-7520') AND (day_name NOT IN('TUE','FRI','SUN')) THEN
		RAISE_APPLICATION_ERROR(-20333,'Flight number CX7520 is scheduled only on Tuesday, Friday and Sunday');
	END IF;
END;
/

REM insert
INSERT INTO fl_schedule VALUES ('CX-7520','20-apr-2020',0730,'20-apr-2020',0840,225.43);

SELECT * FROM fl_schedule
WHERE flno='CX-7520' AND departs='20-apr-2020';

REM update
UPDATE fl_schedule
SET departs='13-apr-2005'
WHERE flno='CX-7520' AND departs='12-apr-2005';

SELECT * FROM fl_schedule
WHERE flno='CX-7520' AND departs='13-apr-2005'; 




REM 3. An aircraft is assigned to a flight only if its cruising range is more than the distance of the
REM flights’ route.

CREATE OR REPLACE TRIGGER check_assign
BEFORE INSERT OR UPDATE ON flights
FOR EACH ROW
DECLARE
	cruising aircraft.cruisingrange%TYPE;
	dist routes.distance%TYPE;
		
	CURSOR c1 IS
	SELECT cruisingrange
	FROM aircraft
	WHERE aid = :new.aid;
	
	CURSOR c2 IS
	SELECT distance
	FROM routes 
	WHERE routeID = :NEW.rID;
	
BEGIN
	OPEN c1;
	OPEN c2;
	
	FETCH c1 INTO cruising;
	FETCH c2 INTO dist;

	CLOSE c1;
	CLOSE c2;
	
	IF (dist > cruising) THEN
		RAISE_APPLICATION_ERROR(-20001,'Cruising range should be more than distance');
	END IF;
END;
/


REM insert
INSERT INTO flights VALUES('8A-6577','MQ198',5);

SELECT * 
FROM flights
WHERE flightno='8A-6577';


REM update
UPDATE flights
SET aid=16
WHERE flightno='AF-12';

SELECT * 
FROM flights
WHERE flightno='AF-12' AND aid=16;
