REM EXERCISE 3
REM Advanced DML

REM 1 Display the flight number,departure date and time of a flight, its route details and aircraft
REM name of type either Schweizer or Piper that departs during 8.00 PM and 9.00 PM.


SELECT 
	s.flno,
	s.departs,
	s.dtime,	
	r.routeid,
	r.orig_airport,
	r.dest_airport,
	r.distance,
	a.aname
FROM fl_schedule s,flights f,routes r,Aircraft a 	
WHERE (s.flno=f.flightno)
	AND (r.routeid=f.rid)
	AND (f.aid=a.aid)
	AND (a.aname LIKE 'Schweizer%' OR a.aname LIKE 'Piper%') 
	AND (s.dtime BETWEEN 2000 AND 2100);


REM  2. For all the routes, display the flight number, origin and destination airport, if a flight is
REM assigned for that route.

SELECT 
	r.routeid,
	f.flightno,
	r.orig_airport,
	r.dest_airport
FROM Routes r LEFT OUTER JOIN Flights f ON (r.routeid=f.rid);




REM 3. For all aircraft with cruisingrange over 5,000 miles, find the name of the aircraft and the
REM average salary of all pilots certified for this aircraft.

SELECT
	a.aname,
	avg(e.salary)
FROM aircraft a,certified c,employee e
WHERE (a.aid=c.aid)
	AND (c.eid=e.eid)
	AND (a.cruisingrange>5000)
GROUP BY a.aname;


REM 4. Show the employee details such as id, name and salary who are not pilots and whose salary
REM is more than the average salary of pilots.


SELECT 
	e.eid,
	e.ename,
	e.salary
FROM Employee e
	LEFT JOIN certified c
	ON e.eid=c.eid
WHERE c.eid IS NULL
	AND e.salary> 
		(SELECT AVG(salary) 
		FROM employee em,certified ce 
		WHERE em.eid=ce.eid);

REM 5. Find the id and name of pilots who were certified to operate some aircrafts but at least one
REM of that aircraft is not scheduled from any routes.


SELECT DISTINCT e.eid,
	e.ename
FROM employee e,certified c 
WHERE  (e.eid=c.eid) 
	AND c.aid NOT IN 
		(SELECT ce.aid 
		FROM certified ce,flights f 
		WHERE (ce.aid=f.aid));
		
		


REM 6. Display the origin and destination of the flights having at least three departures with
REM maximum distance covered.

SELECT 
	r.orig_airport,
	r.dest_airport
FROM
	routes r
WHERE r.routeid IN 
	(
		SELECT ro.routeid
		FROM routes ro,flights f,fl_schedule fl
		WHERE (ro.routeid=f.rid)
		AND (f.flightno=fl.flno)
		AND ro.distance =
			(SELECT max(distance)
			FROM routes
			)
		GROUP BY ro.routeid
		HAVING count(*)>=3
	);


REM 7. Display name and salary of pilot whose salary is more than the average salary of any pilots
REM for each route other than flights originating from Madison airport.

SELECT DISTINCT e.ename,e.salary
FROM Employee e,
	Certified c,
	Aircraft a,
	Routes r,
	Flights f
WHERE
	(f.rid=r.routeid)
	AND (f.aid=a.aid)
	AND (a.aid=c.aid)
	AND (c.eid=e.eid)
	AND r.routeid IN
		(
			SELECT routeid FROM routes
			WHERE orig_airport<>'Madison'
		)
	AND e.salary >
		(
			SELECT avg(salary)
			FROM employee e INNER JOIN certified c ON (e.eid=c.eid)
		);



REM 8. Display the flight number, aircraft type, source and destination airport of the aircraft having
REM maximum number of flights to Honolulu.



SELECT f.flightno,
	a.type,
	r.orig_airport,
	r.dest_airport
FROM Flights f,
	Aircraft a,
	Routes r
WHERE (r.dest_airport='Honolulu')
	AND (f.rid=r.routeid) 
	AND (f.aid=a.aid)
	AND a.aid IN
		(
			select aid 
			from 
				(select aid
				from flights f,routes r 
				where f.rid=r.routeid 
					AND r.dest_airport='Honolulu'
				group by aid
				order by count(*) DESC)
			where rownum=1);
	


REM 9. Display the pilot(s) who are certified exclusively to pilot all aircraft in a type.





REM 10. Name the employee(s) who is earning the maximum salary among the airport having
REM maximum number of departures.


SELECT DISTINCT (ename),salary
FROM flights f,routes r,aircraft a,certified c,employee e,
WHERE
	(f.rid=r.routeid)
	AND (f.aid=a.aid)
	AND (a.aid=c.aid)
	AND (c.eid=e.eid)
	AND orig_airport=
		(
			select orig_airport
			FROM Routes ro,flights ff,fl_schedule fs
			WHERE (ro.routeid=ff.rid) AND (ff.flightno=fs.flno)
			group by orig_airport
			having count(*)=
				(
					SELECT max(count)
					FROM (SELECT count(*) AS count
						FROM Routes ro,flights ff,fl_schedule fs
						WHERE (ro.routeid=ff.rid) AND (ff.flightno=fs.flno)
					  	GROUP BY orig_airport)
				)
		)
	AND salary=
	(
		SELECT max(salary)
		FROM flights fl,routes ro,aircraft ai,certified ce,employee em
		WHERE
			(fl.rid=ro.routeid)
			AND (fl.aid=ai.aid)
			AND (ai.aid=ce.aid)
			AND (ce.eid=em.eid)
		GROUP BY orig_airport
		HAVING ro.orig_airport=r.orig_airport
	);





REM 11. Display the departure chart as follows:
REM flight number, departure(date,airport,time), destination airport, arrival time, aircraft name
REM for the flights from New York airport during 15 to 19th April 2005. Make sure that the route
REM contains at least two flights in the above specified condition.

SELECT DISTINCT
	fl.flno,
	fl.departs,
	r.orig_airport,
	fl.dtime,
	r.dest_airport,
	fl.atime,
	a.aname
FROM
	fl_schedule fl,flights f,routes r,aircraft a
WHERE
	(f.flightno=fl.flno)
	AND (f.rid=r.routeid)
	AND (f.aid=a.aid)
	AND r.orig_airport='New York'
	AND (fl.departs BETWEEN '15-APR-2005' AND '19-APR-2005')
	AND 
		(
			SELECT count(*)
			FROM 
			(
				SELECT fl.flno
				FROM fl_schedule fl,flights f,routes r
				WHERE (f.flightno=fl.flno)
					AND (f.rid=r.routeid)
					AND (fl.departs BETWEEN '15-APR-2005' AND '19-APR-2005')
					AND r.orig_airport='New York'
			)
		)>=2;



REM 12. A customer wants to travel from Madison to New York with no more than two changes of
REM flight. List the flight numbers from Madison if the customer wants to arrive in New York by
REM 6.50 p.m.

SELECT flightno
FROM flights
WHERE flightno IN
	(
		SELECT f0.flightno
		FROM ((fl_schedule fl0 INNER JOIN flights f0 ON (fl0.flno=f0.flightno)) INNER JOIN routes r0 ON (f0.rid=r0.routeid))
		WHERE (r0.orig_airport='Madison') AND 
			(r0.dest_airport='New York') AND
			(fl0.atime<=1850) 
	)
	UNION
	(
		SELECT f0.flightno
		FROM ((fl_schedule fl0 INNER JOIN flights f0 ON (fl0.flno=f0.flightno)) INNER JOIN routes r0 ON (f0.rid=r0.routeid)),
			((fl_schedule fl1 INNER JOIN flights f1 ON (fl1.flno=f1.flightno)) INNER JOIN routes r1 ON (f1.rid=r1.routeid))
		WHERE (r0.dest_airport=r1.orig_airport) AND
			(r0.orig_airport='Madison') AND 
			(fl0.arrives<=fl1.departs) AND
			(r1.orig_airport<>'New York') AND
			(r1.dest_airport='New York') AND
			(fl1.atime<1850)
	);
	




REM 13. Display the id and name of employee(s) who are not pilots.

SELECT eid,ename
FROM Employee
WHERE eid = ANY
	(
		SELECT eid
		FROM employee 
		MINUS
		SELECT eid
		FROM Certified
	);


REM 14. Display the id and name of employee(s) who pilots the aircraft from Los Angels and Detroit
REM airport.


SELECT DISTINCT e.eid,e.ename
FROM employee e
WHERE
	e.eid IN
		(
			SELECT e.eid
			FROM flights f,routes r,aircraft a,certified c,employee e
			WHERE
				(f.rid=r.routeid)
				AND (f.aid=a.aid)
				AND (a.aid=c.aid)
				AND (c.eid=e.eid)
				AND (orig_airport='Detroit')
		INTERSECT
			SELECT e.eid
			FROM flights f,routes r,aircraft a,certified c,employee e
			WHERE
				(f.rid=r.routeid)
				AND (f.aid=a.aid)
				AND (a.aid=c.aid)
				AND (c.eid=e.eid)
				AND (orig_airport='Los Angeles')
		);































REM http://mll.csie.ntu.edu.tw/course/database_f07/assignment/Solutions/assignment3_solution.pdf






