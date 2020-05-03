 SET echo on;
 set linesize 200;
 @"F:\Lab-Assignment\DBMS lab\assgn3_13\Airlines_dataset\air_main.sql"
 @ "F:\Lab-Assignment\DBMS lab\assgn3_13\Airlines_dataset\air_cre.sql"
 --*****************************************************
 --CS 2258				     B.Senthil Kumar
 --DBMS Lab 			     Asst. Prof
 -- 			 Computer Science Department
 -- 			  SSN College of Engineering
 -- 				  senthil@ssn.edu.in
 --*****************************************************
 -- 	       AIRLINES DATASET
 -- 		Version 1.0
 -- 	       February 05, 2013
 --*****************************************************
 --Sources:
 -- 	This dataset is prepared for the assignment
 --      on Subqueries and Join in SQL to students. This
 --      is a test dataset.
 --      The below SQL create the relations for airlines
 --      database with constraints.
 --
 --******************************************************
 
 drop table fl_schedule;

Table dropped.

 drop table flights;

Table dropped.

 drop table routes;

Table dropped.

 drop table certified;

Table dropped.

 drop table employee;

Table dropped.

 drop table aircraft;

Table dropped.

 
 create table aircraft(
  2  	     aid number(4) constraint aid_pk primary key,
  3  	     aname varchar2(30),
  4  	     type varchar2(10),
  5  	     cruisingrange number(6)
  6  	     );

Table created.

 
 create table employee(
  2  	     eid number(9) constraint eid_pk primary key,
  3  	     ename varchar2(30),
  4  	     salary number(10,2)
  5  	     );

Table created.

 
 create table certified(
  2  	     eid number(9),
  3  	     aid number(4),
  4  	     constraint eaid_pk primary key(eid,aid),
  5  	     constraint eid_fk foreign key(eid) references employee,
  6  	     constraint aid_fk foreign key(aid) references aircraft
  7  	     );

Table created.

 
 create table routes(
  2  	     routeID varchar2(6) constraint rid_pk primary key,
  3  	     orig_airport varchar2(20),
  4  	     dest_airport varchar2(20),
  5  	     distance number(6)
  6  	     );

Table created.

 
 create table flights(
  2  	     flightNo varchar2(7) constraint fno_pk primary key,
  3  	     rID varchar2(6),
  4  	     aid number(4),
  5  	     constraint fl_aid_fk foreign key(aid) references aircraft,
  6  	     constraint rid_fk foreign key(rid) references routes
  7  	     );

Table created.

 
 create table fl_schedule(
  2  	     flno varchar2(7),
  3  	     departs date,
  4  	     dtime number(4),
  5  	     arrives date,
  6  	     atime number(4),
  7  	     price number(7,2),
  8  	     constraint fno_dep_pk primary key (flno,departs),
  9  	     constraint fno_fk foreign key(flno) references flights
 10  	     );

Table created.

 
 --********************END OF CREATE**********************************
 @ "F:\Lab-Assignment\DBMS lab\assgn3_13\Airlines_dataset\air_pop.sql"
 --*****************************************************
 --CS 2258				     B.Senthil Kumar
 --DBMS Lab 			     Asst. Prof
 -- 			 Computer Science Department
 -- 			  SSN College of Engineering
 -- 				  senthil@ssn.edu.in
 --*****************************************************
 -- 	       AIRLINES DATASET
 -- 		Version 1.0
 -- 	       February 05, 2013
 --*****************************************************
 --Sources:
 -- 	This dataset is prepared for the assignment
 --      on Subqueries and Join in SQL to students. This
 --      is a test dataset.
 --      The below SQL statements will populate the
 --      airlines database. The flight schedule contains
 --      information pertained to flights during 12 to 22
 --      April 2005. Do NOT MODIFY the instances.
 --
 --******************************************************
 --
 -- Populating Aircraft
 --aircraft(aid, aname, type, cruisingrange)
 
 INSERT INTO  aircraft VALUES (1,'Boeing 747-400','Boeing',8430);

1 row created.

 INSERT INTO  aircraft VALUES (2,'Boeing 737-800','Boeing',3383);

1 row created.

 INSERT INTO  aircraft VALUES (3,'Airbus A340-300','Airbus',7120);

1 row created.

 INSERT INTO  aircraft VALUES (4,'British Aerospace Jetstream 41','BAe',1502);

1 row created.

 INSERT INTO  aircraft VALUES (5,'Embraer ERJ-145','Embraer',1530);

1 row created.

 INSERT INTO  aircraft VALUES (6,'SAAB 340','Saab',2128);

1 row created.

 INSERT INTO  aircraft VALUES (7,'Piper PA-46 Meridian','Piper',520);

1 row created.

 INSERT INTO  aircraft VALUES (8,'Tupolev Tu-154','Tupolev',4103);

1 row created.

 INSERT INTO  aircraft VALUES (16,'Schweizer 2-33','Schweizer',300);

1 row created.

 INSERT INTO  aircraft VALUES (9,'Lockheed L1011 Tristar','Lockheed',6900);

1 row created.

 INSERT INTO  aircraft VALUES (10,'Boeing 757-300','Boeing',4010);

1 row created.

 INSERT INTO  aircraft VALUES (11,'Boeing 777-300','Boeing',6441);

1 row created.

 INSERT INTO  aircraft VALUES (12,'Boeing 767-400ER','Boeing',6475);

1 row created.

 INSERT INTO  aircraft VALUES (13,'Airbus A320','Airbus',2605);

1 row created.

 INSERT INTO  aircraft VALUES (14,'Airbus A319','Airbus',1805);

1 row created.

 INSERT INTO  aircraft VALUES (15,'Boeing 727','Boeing',1504);

1 row created.

 
 
 -- Populating employee relation
 --employee(eid, ename, salary)
 
 INSERT INTO  employee VALUES (242518965,'James Smith',120433);

1 row created.

 INSERT INTO  employee VALUES (141582651,'Mary Johnson',178345);

1 row created.

 INSERT INTO  employee VALUES (011564812,'John Williams',153972);

1 row created.

 INSERT INTO  employee VALUES (567354612,'Lisa Walker',256481);

1 row created.

 INSERT INTO  employee VALUES (552455318,'Larry West',101745);

1 row created.

 INSERT INTO  employee VALUES (550156548,'Karen Scott',205187);

1 row created.

 INSERT INTO  employee VALUES (390487451,'Lawrence Sperry',212156);

1 row created.

 INSERT INTO  employee VALUES (274878974,'Michael Miller',99890);

1 row created.

 INSERT INTO  employee VALUES (254099823,'Patricia Jones',24450);

1 row created.

 INSERT INTO  employee VALUES (356187925,'Robert Brown',44740);

1 row created.

 INSERT INTO  employee VALUES (355548984,'Angela Martinez',212156);

1 row created.

 INSERT INTO  employee VALUES (310454876,'Joseph Thompson',212156);

1 row created.

 INSERT INTO  employee VALUES (489456522,'Linda Davis',127984);

1 row created.

 INSERT INTO  employee VALUES (489221823,'Richard Jackson',23980);

1 row created.

 INSERT INTO  employee VALUES (548977562,'William Ward',84476);

1 row created.

 INSERT INTO  employee VALUES (310454877,'Chad Stewart',33546);

1 row created.

 INSERT INTO  employee VALUES (142519864,'Betty Adams',227489);

1 row created.

 INSERT INTO  employee VALUES (269734834,'George Wright',289950);

1 row created.

 INSERT INTO  employee VALUES (287321212,'Michael Miller',48090);

1 row created.

 INSERT INTO  employee VALUES (552455348,'Dorthy Lewis',92013);

1 row created.

 INSERT INTO  employee VALUES (248965255,'Barbara Wilson',43723);

1 row created.

 INSERT INTO  employee VALUES (159542516,'William Moore',48250);

1 row created.

 INSERT INTO  employee VALUES (348121549,'Haywood Kelly',32899);

1 row created.

 INSERT INTO  employee VALUES (090873519,'Elizabeth Taylor',32021);

1 row created.

 INSERT INTO  employee VALUES (486512566,'David Anderson',743001);

1 row created.

 INSERT INTO  employee VALUES (619023588,'Jennifer Thomas',54921);

1 row created.

 INSERT INTO  employee VALUES (015645489,'Donald King',18050);

1 row created.

 INSERT INTO  employee VALUES (556784565,'Mark Young',205187);

1 row created.

 INSERT INTO  employee VALUES (573284895,'Eric Cooper',114323);

1 row created.

 INSERT INTO  employee VALUES (574489456,'William Jones',105743);

1 row created.

 INSERT INTO  employee VALUES (574489457,'Milo Brooks',12000);

1 row created.

 
 
 -- Populating Certified relation
 --certified(eid, aid)
 
 INSERT INTO certified VALUES (567354612,1);

1 row created.

 INSERT INTO certified VALUES (567354612,2);

1 row created.

 INSERT INTO certified VALUES (567354612,10);

1 row created.

 INSERT INTO certified VALUES (567354612,11);

1 row created.

 INSERT INTO certified VALUES (567354612,12);

1 row created.

 INSERT INTO certified VALUES (567354612,15);

1 row created.

 INSERT INTO certified VALUES (567354612,7);

1 row created.

 INSERT INTO certified VALUES (567354612,9);

1 row created.

 INSERT INTO certified VALUES (567354612,3);

1 row created.

 INSERT INTO certified VALUES (567354612,4);

1 row created.

 INSERT INTO certified VALUES (567354612,5);

1 row created.

 INSERT INTO certified VALUES (552455318,2);

1 row created.

 INSERT INTO certified VALUES (552455318,14);

1 row created.

 INSERT INTO certified VALUES (550156548,1);

1 row created.

 INSERT INTO certified VALUES (550156548,12);

1 row created.

 INSERT INTO certified VALUES (390487451,3);

1 row created.

 INSERT INTO certified VALUES (390487451,13);

1 row created.

 INSERT INTO certified VALUES (390487451,14);

1 row created.

 INSERT INTO certified VALUES (274878974,10);

1 row created.

 INSERT INTO certified VALUES (274878974,12);

1 row created.

 INSERT INTO certified VALUES (355548984,8);

1 row created.

 INSERT INTO certified VALUES (355548984,9);

1 row created.

 INSERT INTO certified VALUES (310454876,8);

1 row created.

 INSERT INTO certified VALUES (310454876,9);

1 row created.

 INSERT INTO certified VALUES (548977562,7);

1 row created.

 INSERT INTO certified VALUES (142519864,1);

1 row created.

 INSERT INTO certified VALUES (142519864,11);

1 row created.

 INSERT INTO certified VALUES (142519864,12);

1 row created.

 INSERT INTO certified VALUES (142519864,10);

1 row created.

 INSERT INTO certified VALUES (142519864,3);

1 row created.

 INSERT INTO certified VALUES (142519864,2);

1 row created.

 INSERT INTO certified VALUES (142519864,13);

1 row created.

 INSERT INTO certified VALUES (142519864,7);

1 row created.

 INSERT INTO certified VALUES (269734834,1);

1 row created.

 INSERT INTO certified VALUES (269734834,2);

1 row created.

 INSERT INTO certified VALUES (269734834,3);

1 row created.

 INSERT INTO certified VALUES (269734834,4);

1 row created.

 INSERT INTO certified VALUES (269734834,5);

1 row created.

 INSERT INTO certified VALUES (269734834,6);

1 row created.

 INSERT INTO certified VALUES (269734834,7);

1 row created.

 INSERT INTO certified VALUES (269734834,8);

1 row created.

 INSERT INTO certified VALUES (269734834,9);

1 row created.

 INSERT INTO certified VALUES (269734834,10);

1 row created.

 INSERT INTO certified VALUES (269734834,11);

1 row created.

 INSERT INTO certified VALUES (269734834,12);

1 row created.

 INSERT INTO certified VALUES (269734834,13);

1 row created.

 INSERT INTO certified VALUES (269734834,14);

1 row created.

 INSERT INTO certified VALUES (269734834,15);

1 row created.

 INSERT INTO certified VALUES (552455318,7);

1 row created.

 INSERT INTO certified VALUES (556784565,5);

1 row created.

 INSERT INTO certified VALUES (556784565,2);

1 row created.

 INSERT INTO certified VALUES (556784565,3);

1 row created.

 INSERT INTO certified VALUES (573284895,3);

1 row created.

 INSERT INTO certified VALUES (573284895,4);

1 row created.

 INSERT INTO certified VALUES (573284895,5);

1 row created.

 INSERT INTO certified VALUES (574489456,8);

1 row created.

 INSERT INTO certified VALUES (574489456,6);

1 row created.

 INSERT INTO certified VALUES (574489457,16);

1 row created.

 INSERT INTO certified VALUES (287321212,7);

1 row created.

 INSERT INTO certified VALUES (242518965,2);

1 row created.

 INSERT INTO certified VALUES (242518965,10);

1 row created.

 INSERT INTO certified VALUES (141582651,2);

1 row created.

 INSERT INTO certified VALUES (141582651,10);

1 row created.

 INSERT INTO certified VALUES (141582651,12);

1 row created.

 INSERT INTO certified VALUES (011564812,2);

1 row created.

 INSERT INTO certified VALUES (011564812,10);

1 row created.

 INSERT INTO certified VALUES (356187925,6);

1 row created.

 INSERT INTO certified VALUES (159542516,5);

1 row created.

 INSERT INTO certified VALUES (159542516,7);

1 row created.

 INSERT INTO certified VALUES (090873519,6);

1 row created.

 
 
 -- Populating Routes relation
 --routes(routeID, orig_airport, dest_airport, distance)
 
 INSERT INTO routes VALUES ('LW100','Los Angeles','Washington D.C.',2308);

1 row created.

 INSERT INTO routes VALUES ('LC101','Los Angeles','Chicago',1749);

1 row created.

 INSERT INTO routes VALUES ('LD102','Los Angeles','Dallas',1251);

1 row created.

 INSERT INTO routes VALUES ('LB103','Los Angeles','Boston',2606);

1 row created.

 INSERT INTO routes VALUES ('LS104','Los Angeles','Sydney',7487);

1 row created.

 INSERT INTO routes VALUES ('LT105','Los Angeles','Tokyo',5478);

1 row created.

 INSERT INTO routes VALUES ('LH106','Los Angeles','Honolulu',2551);

1 row created.

 INSERT INTO routes VALUES ('CL150','Chicago','Los Angeles',1749);

1 row created.

 INSERT INTO routes VALUES ('CN151','Chicago','New York',802);

1 row created.

 INSERT INTO routes VALUES ('MD200','Madison','Detroit',319);

1 row created.

 INSERT INTO routes VALUES ('DN250','Detroit','New York',470);

1 row created.

 INSERT INTO routes VALUES ('DM251','Detroit','Montreal',517);

1 row created.

 INSERT INTO routes VALUES ('MN204','Madison','New York',789);

1 row created.

 INSERT INTO routes VALUES ('MC201','Madison','Chicago',150);

1 row created.

 INSERT INTO routes VALUES ('MP202','Madison','Pittsburgh',510);

1 row created.

 INSERT INTO routes VALUES ('MM203','Madison','Minneapolis',247);

1 row created.

 INSERT INTO routes VALUES ('MNY300','Minneapolis','New York',991);

1 row created.

 INSERT INTO routes VALUES ('PN350','Pittsburgh','New York',303);

1 row created.

 INSERT INTO routes VALUES ('PC351','Pittsburgh','Chicago',409);

1 row created.

 INSERT INTO routes VALUES ('NYL400','New York','London',3471);

1 row created.

 INSERT INTO routes VALUES ('NYP401','New York','Paris',3631);

1 row created.

 INSERT INTO routes values('LNY107','Los Angeles','New York',2510);

1 row created.

 
 
 -- Populating Fligts relations
 --flights(flightNo, rID, aid)
 
 INSERT INTO flights VALUES ('9E-3749','DM251',4);

1 row created.

 INSERT INTO flights VALUES ('MQ-4477','DN250',5);

1 row created.

 INSERT INTO flights VALUES ('MQ-4565','DN250',5);

1 row created.

 INSERT INTO flights VALUES ('CX-7520','LD102',4);

1 row created.

 INSERT INTO flights VALUES ('WS-5060','LD102',5);

1 row created.

 INSERT INTO flights VALUES ('QF-3045','LD102',15);

1 row created.

 INSERT INTO flights VALUES ('JJ-7456','LW100',13);

1 row created.

 INSERT INTO flights VALUES ('JJ-2482','LW100',13);

1 row created.

 INSERT INTO flights VALUES ('SN-8814','LW100',2);

1 row created.

 INSERT INTO flights VALUES ('WN-484','LC101',14);

1 row created.

 INSERT INTO flights VALUES ('WN-434','LC101',13);

1 row created.

 INSERT INTO flights VALUES ('B6-474','LB103',2);

1 row created.

 INSERT INTO flights VALUES ('B6-482','LB103',2);

1 row created.

 INSERT INTO flights VALUES ('VA-6551','LS104',1);

1 row created.

 INSERT INTO flights VALUES ('VA-2','LS104',1);

1 row created.

 INSERT INTO flights VALUES ('DJ-2','LS104',1);

1 row created.

 INSERT INTO flights VALUES ('SQ-11','LT105',11);

1 row created.

 INSERT INTO flights VALUES ('AI-7205','LT105',12);

1 row created.

 INSERT INTO flights VALUES ('MH-93','LT105',11);

1 row created.

 INSERT INTO flights VALUES ('HA-3','LH106',13);

1 row created.

 INSERT INTO flights VALUES ('HA-1','LH106',13);

1 row created.

 INSERT INTO flights VALUES ('UA-1428','LH106',2);

1 row created.

 INSERT INTO flights VALUES ('A5-3376','CL150',14);

1 row created.

 INSERT INTO flights VALUES ('A5-3246','CN151',4);

1 row created.

 INSERT INTO flights VALUES ('9E-3851','MD200',5);

1 row created.

 INSERT INTO flights VALUES ('9E-3622','MD200',4);

1 row created.

 INSERT INTO flights VALUES ('G7-6205','MN204',4);

1 row created.

 INSERT INTO flights VALUES ('EV-5134','MN204',15);

1 row created.

 INSERT INTO flights VALUES ('RP-5018','MC201',16);

1 row created.

 INSERT INTO flights VALUES ('G7-3664','MC201',5);

1 row created.

 INSERT INTO flights VALUES ('FX-2351','MP202',7);

1 row created.

 INSERT INTO flights VALUES ('AS-5958','MM203',16);

1 row created.

 INSERT INTO flights VALUES ('AS-5062','MM203',7);

1 row created.

 INSERT INTO flights VALUES ('DL-3402','PN350',15);

1 row created.

 INSERT INTO flights VALUES ('CY-1846','NYL400',8);

1 row created.

 INSERT INTO flights VALUES ('BA-178','NYL400',10);

1 row created.

 INSERT INTO flights VALUES ('IB-4618','NYL400',9);

1 row created.

 INSERT INTO flights VALUES ('VS-26','NYL400',8);

1 row created.

 INSERT INTO flights VALUES ('AF-23','NYP401',10);

1 row created.

 INSERT INTO flights VALUES ('AF-11','NYP401',10);

1 row created.

 INSERT INTO flights VALUES ('RJ-7056','NYP401',8);

1 row created.

 INSERT INTO flights values('AF-12','LNY107',10);

1 row created.

 
 
 -- Populating Fl_schedule relation
 --fl_schedule(flno, departs, dtime, arrives, atime, price)
 
 INSERT INTO fl_schedule VALUES ('9E-3851','12-apr-2005',0710,'12-apr-2005',0800,120.40);

1 row created.

 INSERT INTO fl_schedule VALUES ('CX-7520','12-apr-2005',0730,'12-apr-2005',0840,225.43);

1 row created.

 INSERT INTO fl_schedule VALUES ('JJ-7456','12-apr-2005',0930,'12-apr-2005',1240,235.98);

1 row created.

 INSERT INTO fl_schedule VALUES ('WS-5060','12-apr-2005',0930,'12-apr-2005',1042,227.60);

1 row created.

 INSERT INTO fl_schedule VALUES ('AI-7205','12-apr-2005',1010,'13-apr-2005',1850,785.19);

1 row created.

 INSERT INTO fl_schedule VALUES ('CY-1846','12-apr-2005',1040,'13-apr-2005',0920,250.50);

1 row created.

 INSERT INTO fl_schedule VALUES ('DL-3402','12-apr-2005',1140,'12-apr-2005',1220,116.50);

1 row created.

 INSERT INTO fl_schedule VALUES ('AS-5958','12-apr-2005',1210,'14-apr-2005',1300,220.15);

1 row created.

 INSERT INTO fl_schedule VALUES ('QF-3045','12-apr-2005',1320,'12-apr-2005',1440,227.60);

1 row created.

 INSERT INTO fl_schedule VALUES ('9E-3749','12-apr-2005',1940,'14-apr-2005',2020,170.40);

1 row created.

 INSERT INTO fl_schedule VALUES ('G7-3664','13-apr-2005',0535,'13-apr-2005',0610,112.45);

1 row created.

 INSERT INTO fl_schedule VALUES ('WN-484','13-apr-2005',0800,'13-apr-2005',0935,220.98);

1 row created.

 INSERT INTO fl_schedule VALUES ('HA-3','13-apr-2005',1230,'13-apr-2005',1555,375.23);

1 row created.

 INSERT INTO fl_schedule VALUES ('AS-5062','13-apr-2005',2010,'14-apr-2005',2100,120.11);

1 row created.

 INSERT INTO fl_schedule VALUES ('VA-2','13-apr-2005',2030,'15-apr-2005',0430,1300.50);

1 row created.

 INSERT INTO fl_schedule VALUES ('A5-3376','13-apr-2005',2030,'13-apr-2005',2150,220.98);

1 row created.

 INSERT INTO fl_schedule VALUES ('FX-2351','14-apr-2005',0810,'14-apr-2005',0900,208.98);

1 row created.

 INSERT INTO fl_schedule VALUES ('AF-23','14-apr-2005',1020,'15-apr-2005',1210,320.70);

1 row created.

 INSERT INTO fl_schedule VALUES ('B6-474','14-apr-2005',1710,'14-apr-2005',2120,261.56);

1 row created.

 INSERT INTO fl_schedule VALUES ('G7-6205','22-apr-2005',1725,'22-apr-2005',1850,202.34);

1 row created.

 INSERT INTO fl_schedule VALUES ('VA-6551','14-apr-2005',2230,'16-apr-2005',0610,1278.56);

1 row created.

 INSERT INTO fl_schedule VALUES ('9E-3851','15-apr-2005',1035,'15-apr-2005',1140,120.40);

1 row created.

 INSERT INTO fl_schedule VALUES ('HA-1','15-apr-2005',1110,'15-apr-2005',1445,375.23);

1 row created.

 INSERT INTO fl_schedule VALUES ('BA-178','15-apr-2005',1140,'16-apr-2005',1020,250.50);

1 row created.

 INSERT INTO fl_schedule VALUES ('SQ-11','15-apr-2005',1230,'16-apr-2005',2055,780.99);

1 row created.

 INSERT INTO fl_schedule VALUES ('JJ-2482','15-apr-2005',1230,'15-apr-2005',1540,235.98);

1 row created.

 INSERT INTO fl_schedule VALUES ('MQ-4477','15-apr-2005',1510,'15-apr-2005',1600,180.56);

1 row created.

 INSERT INTO fl_schedule VALUES ('A5-3246','15-apr-2005',1810,'15-apr-2005',1900,202.45);

1 row created.

 INSERT INTO fl_schedule VALUES ('RP-5018','15-apr-2005',2100,'15-apr-2005',2155,225.45);

1 row created.

 INSERT INTO fl_schedule VALUES ('WS-5060','16-apr-2005',0930,'16-apr-2005',1042,227.60);

1 row created.

 INSERT INTO fl_schedule VALUES ('WN-484','16-apr-2005',0940,'16-apr-2005',1110,220.98);

1 row created.

 INSERT INTO fl_schedule VALUES ('WN-434','16-apr-2005',1410,'16-apr-2005',1530,225.10);

1 row created.

 INSERT INTO fl_schedule VALUES ('MH-93','17-apr-2005',0440,'18-apr-2005',1315,783.30);

1 row created.

 INSERT INTO fl_schedule VALUES ('G7-3664','17-apr-2005',0725,'17-apr-2005',0815,112.45);

1 row created.

 INSERT INTO fl_schedule VALUES ('CX-7520','17-apr-2005',0730,'17-apr-2005',0840,225.43);

1 row created.

 INSERT INTO fl_schedule VALUES ('AF-11','17-apr-2005',1340,'18-apr-2005',1530,320.70);

1 row created.

 INSERT INTO fl_schedule VALUES ('9E-3622','17-apr-2005',1655,'17-apr-2005',1750,118.40);

1 row created.

 INSERT INTO fl_schedule VALUES ('EV-5134','17-apr-2005',2135,'17-apr-2005',2240,202.34);

1 row created.

 INSERT INTO fl_schedule VALUES ('B6-482','18-apr-2005',0330,'18-apr-2005',0740,261.56);

1 row created.

 INSERT INTO fl_schedule VALUES ('DL-3402','18-apr-2005',1140,'18-apr-2005',1220,116.50);

1 row created.

 INSERT INTO fl_schedule VALUES ('IB-4618','18-apr-2005',1310,'19-apr-2005',1150,250.50);

1 row created.

 INSERT INTO fl_schedule VALUES ('UA-1428','18-apr-2005',1420,'18-apr-2005',1740,425.38);

1 row created.

 INSERT INTO fl_schedule VALUES ('MQ-4565','18-apr-2005',1810,'18-apr-2005',1900,180.56);

1 row created.

 INSERT INTO fl_schedule VALUES ('JJ-7456','19-apr-2005',0930,'19-apr-2005',1240,235.98);

1 row created.

 INSERT INTO fl_schedule VALUES ('WN-484','19-apr-2005',1000,'19-apr-2005',1120,220.98);

1 row created.

 INSERT INTO fl_schedule VALUES ('QF-3045','19-apr-2005',1320,'19-apr-2005',1440,227.60);

1 row created.

 INSERT INTO fl_schedule VALUES ('WS-5060','20-apr-2005',0930,'20-apr-2005',1042,227.60);

1 row created.

 INSERT INTO fl_schedule VALUES ('RJ-7056','20-apr-2005',1810,'21-apr-2005',2020,320.70);

1 row created.

 INSERT INTO fl_schedule VALUES ('FX-2351','21-apr-2005',0810,'21-apr-2005',0900,208.98);

1 row created.

 INSERT INTO fl_schedule VALUES ('AF-23','21-apr-2005',1020,'22-apr-2005',1210,320.70);

1 row created.

 INSERT INTO fl_schedule VALUES ('VS-26','21-apr-2005',1340,'22-apr-2005',1230,250.50);

1 row created.

 INSERT INTO fl_schedule VALUES ('VA-6551','21-apr-2005',2230,'23-apr-2005',0610,1278.56);

1 row created.

 INSERT INTO fl_schedule VALUES ('G7-3664','22-apr-2005',0535,'22-apr-2005',0610,112.45);

1 row created.

 INSERT INTO fl_schedule VALUES ('CX-7520','22-apr-2005',0730,'22-apr-2005',0840,225.43);

1 row created.

 INSERT INTO fl_schedule VALUES ('SN-8814','22-apr-2005',1030,'22-apr-2005',1335,245);

1 row created.

 INSERT INTO fl_schedule VALUES ('WN-484','22-apr-2005',1200,'22-apr-2005',1325,220.98);

1 row created.

 INSERT INTO fl_schedule VALUES ('JJ-2482','22-apr-2005',1230,'22-apr-2005',1540,235.98);

1 row created.

 INSERT INTO fl_schedule VALUES ('WN-434','22-apr-2005',1540,'22-apr-2005',1700,225.10);

1 row created.

 INSERT INTO fl_schedule VALUES ('B6-474','22-apr-2005',1710,'22-apr-2005',2120,261.56);

1 row created.

 INSERT INTO fl_schedule VALUES ('A5-3246','22-apr-2005',1810,'22-apr-2005',1900,202.45);

1 row created.

 INSERT INTO fl_schedule values('AF-12','22-apr-05',1245,'22-apr-05',1850,450.25);

1 row created.

 
 --**************************END OF INSERT****************************
SELECT f.flightno as flight_num,s.departs as depart_date,s.dtime as time,r.routeid as route_id,r.orig_airport as orig_airport,r.dest_airport as dest_airport,a.aname as aircraft_name
  2     FROM flights f JOIN fl_schedule s ON(f.flightno = s.flno) JOIN routes r ON(f.rid=r.routeid) JOIN aircraft a ON (f.aid= a.aid)
  3     WHERE (a.type IN ('Schweizer','Piper')) AND (s.dtime BETWEEN 2000 AND 2100);

FLIGHT_ DEPART_DA       TIME ROUTE_ ORIG_AIRPORT         DEST_AIRPORT         AIRCRAFT_NAME                                                                                                             
------- --------- ---------- ------ -------------------- -------------------- ------------------------------                                                                                            
AS-5062 13-APR-05       2010 MM203  Madison              Minneapolis          Piper PA-46 Meridian                                                                                                      
RP-5018 15-APR-05       2100 MC201  Madison              Chicago              Schweizer 2-33                                                                                                            

 SELECT routeid,flightno,orig_airport,dest_airport
  2     FROM flights f JOIN routes r ON(f.rid=r.routeid);

ROUTEI FLIGHTN ORIG_AIRPORT         DEST_AIRPORT                                                                                                                                                        
------ ------- -------------------- --------------------                                                                                                                                                
DM251  9E-3749 Detroit              Montreal                                                                                                                                                            
DN250  MQ-4477 Detroit              New York                                                                                                                                                            
DN250  MQ-4565 Detroit              New York                                                                                                                                                            
LD102  CX-7520 Los Angeles          Dallas                                                                                                                                                              
LD102  WS-5060 Los Angeles          Dallas                                                                                                                                                              
LD102  QF-3045 Los Angeles          Dallas                                                                                                                                                              
LW100  JJ-7456 Los Angeles          Washington D.C.                                                                                                                                                     
LW100  JJ-2482 Los Angeles          Washington D.C.                                                                                                                                                     
LW100  SN-8814 Los Angeles          Washington D.C.                                                                                                                                                     
LC101  WN-484  Los Angeles          Chicago                                                                                                                                                             
LC101  WN-434  Los Angeles          Chicago                                                                                                                                                             

ROUTEI FLIGHTN ORIG_AIRPORT         DEST_AIRPORT                                                                                                                                                        
------ ------- -------------------- --------------------                                                                                                                                                
LB103  B6-474  Los Angeles          Boston                                                                                                                                                              
LB103  B6-482  Los Angeles          Boston                                                                                                                                                              
LS104  VA-6551 Los Angeles          Sydney                                                                                                                                                              
LS104  VA-2    Los Angeles          Sydney                                                                                                                                                              
LS104  DJ-2    Los Angeles          Sydney                                                                                                                                                              
LT105  SQ-11   Los Angeles          Tokyo                                                                                                                                                               
LT105  AI-7205 Los Angeles          Tokyo                                                                                                                                                               
LT105  MH-93   Los Angeles          Tokyo                                                                                                                                                               
LH106  HA-3    Los Angeles          Honolulu                                                                                                                                                            
LH106  HA-1    Los Angeles          Honolulu                                                                                                                                                            
LH106  UA-1428 Los Angeles          Honolulu                                                                                                                                                            

ROUTEI FLIGHTN ORIG_AIRPORT         DEST_AIRPORT                                                                                                                                                        
------ ------- -------------------- --------------------                                                                                                                                                
CL150  A5-3376 Chicago              Los Angeles                                                                                                                                                         
CN151  A5-3246 Chicago              New York                                                                                                                                                            
MD200  9E-3851 Madison              Detroit                                                                                                                                                             
MD200  9E-3622 Madison              Detroit                                                                                                                                                             
MN204  G7-6205 Madison              New York                                                                                                                                                            
MN204  EV-5134 Madison              New York                                                                                                                                                            
MC201  RP-5018 Madison              Chicago                                                                                                                                                             
MC201  G7-3664 Madison              Chicago                                                                                                                                                             
MP202  FX-2351 Madison              Pittsburgh                                                                                                                                                          
MM203  AS-5958 Madison              Minneapolis                                                                                                                                                         
MM203  AS-5062 Madison              Minneapolis                                                                                                                                                         

ROUTEI FLIGHTN ORIG_AIRPORT         DEST_AIRPORT                                                                                                                                                        
------ ------- -------------------- --------------------                                                                                                                                                
PN350  DL-3402 Pittsburgh           New York                                                                                                                                                            
NYL400 CY-1846 New York             London                                                                                                                                                              
NYL400 BA-178  New York             London                                                                                                                                                              
NYL400 IB-4618 New York             London                                                                                                                                                              
NYL400 VS-26   New York             London                                                                                                                                                              
NYP401 AF-23   New York             Paris                                                                                                                                                               
NYP401 AF-11   New York             Paris                                                                                                                                                               
NYP401 RJ-7056 New York             Paris                                                                                                                                                               
LNY107 AF-12   Los Angeles          New York                                                                                                                                                            

42 rows selected.

SELECT aname as Aircraft_Name,AVG(salary) as AVG_emp_SAL
  2     FROM aircraft a JOIN certified c USING (aid) JOIN employee e USING (eid)
  3     WHERE cruisingrange > 5000
  4     GROUP BY aname;

AIRCRAFT_NAME                  AVG_EMP_SAL                                                                                                                                                              
------------------------------ -----------                                                                                                                                                              
Airbus A340-300                 217597.667                                                                                                                                                              
Boeing 777-300                  257973.333                                                                                                                                                              
Boeing 747-400                   244776.75                                                                                                                                                              
Lockheed L1011 Tristar           242685.75                                                                                                                                                              
Boeing 767-400ER                    209557                                                                                                                                                              

 SELECT distinct eid,ename
  2     FROM employee e JOIN certified c  USING (eid) JOIN aircraft a USING (aid)
  3     WHERE aid NOT IN (SELECT f.aid FROM flights f);

       EID ENAME                                                                                                                                                                                        
---------- ------------------------------                                                                                                                                                               
 269734834 George Wright                                                                                                                                                                                
  90873519 Elizabeth Taylor                                                                                                                                                                             
 356187925 Robert Brown                                                                                                                                                                                 
 574489456 William Jones                                                                                                                                                                                
 556784565 Mark Young                                                                                                                                                                                   
 567354612 Lisa Walker                                                                                                                                                                                  
 573284895 Eric Cooper                                                                                                                                                                                  
 142519864 Betty Adams                                                                                                                                                                                  
 390487451 Lawrence Sperry                                                                                                                                                                              

9 rows selected.

 SELECT distinct eid,ename
  2     FROM employee e JOIN certified c  USING (eid) JOIN aircraft a USING (aid)
  3     WHERE aid NOT IN (SELECT f.aid FROM flights f);

       EID ENAME                                                                                                                                                                                        
---------- ------------------------------                                                                                                                                                               
 269734834 George Wright                                                                                                                                                                                
  90873519 Elizabeth Taylor                                                                                                                                                                             
 356187925 Robert Brown                                                                                                                                                                                 
 574489456 William Jones                                                                                                                                                                                
 556784565 Mark Young                                                                                                                                                                                   
 567354612 Lisa Walker                                                                                                                                                                                  
 573284895 Eric Cooper                                                                                                                                                                                  
 142519864 Betty Adams                                                                                                                                                                                  
 390487451 Lawrence Sperry                                                                                                                                                                              

9 rows selected.

 SELECT orig_airport,dest_airport
  2    FROM routes JOIN flights ON (rid=routeid)
  3    WHERE distance = (SELECT max(distance)
  4                      FROM routes
  5                      )
  6    GROUP BY orig_airport,dest_airport
  7    HAVING count(*) >= 3;

ORIG_AIRPORT         DEST_AIRPORT                                                                                                                                                                       
-------------------- --------------------                                                                                                                                                               
Los Angeles          Sydney                                                                                                                                                                             

 SELECT distinct eid,ename,salary
  2  FROM employee e JOIN certified c USING(eid) JOIN flights f USING(aid) JOIN routes r ON(f.rid=r.routeid)
  3  WHERE e.salary > ANY(SELECT AVG(salary)
  4                  FROM employee e1 JOIN certified c1 USING(eid) JOIN flights f1 USING(aid) JOIN routes r1 ON(f1.rid=r1.routeid)
  5                  WHERE r1.routeid=r.routeid
  6                  AND orig_airport <> 'Madison'
  7                  GROUP BY(r1.routeid)
  8              );

       EID ENAME                              SALARY                                                                                                                                                    
---------- ------------------------------ ----------                                                                                                                                                    
 556784565 Mark Young                         205187                                                                                                                                                    
 310454876 Joseph Thompson                    212156                                                                                                                                                    
 567354612 Lisa Walker                        256481                                                                                                                                                    
 269734834 George Wright                      289950                                                                                                                                                    
 390487451 Lawrence Sperry                    212156                                                                                                                                                    
 142519864 Betty Adams                        227489                                                                                                                                                    
 355548984 Angela Martinez                    212156                                                                                                                                                    

7 rows selected.

 SELECT flightno,type,orig_airport,dest_airport
  2  FROM aircraft a JOIN flights f USING(aid) JOIN routes r ON(f.rid=r.routeid)
  3  WHERE aid = (   SELECT aid
  4  FROM aircraft a JOIN flights f USING(aid) JOIN routes r ON(f.rid=r.routeid)
  5  WHERE dest_airport = 'Honolulu'
  6  GROUP BY aid
  7  HAVING count(*) = ( SELECT max(count(*))
  8  FROM aircraft a JOIN flights f USING(aid) JOIN routes r ON(f.rid=r.routeid)
  9  WHERE dest_airport = 'Honolulu'
 10  GROUP BY aid
 11  )
 12  );

FLIGHTN TYPE       ORIG_AIRPORT         DEST_AIRPORT                                                                                                                                                    
------- ---------- -------------------- --------------------                                                                                                                                            
JJ-7456 Airbus     Los Angeles          Washington D.C.                                                                                                                                                 
JJ-2482 Airbus     Los Angeles          Washington D.C.                                                                                                                                                 
WN-434  Airbus     Los Angeles          Chicago                                                                                                                                                         
HA-3    Airbus     Los Angeles          Honolulu                                                                                                                                                        
HA-1    Airbus     Los Angeles          Honolulu                                                                                                                                                        

 SELECT *
  2  FROM employee
  3  WHERE eid IN (SELECT c.eid
  4   FROM certified c JOIN aircraft a ON(c.aid=a.aid)
  5   WHERE c.eid IN (SELECT c1.eid
  6  FROM certified c1 JOIN aircraft a1 ON(c1.aid=a1.aid)
  7  GROUP BY c1.eid
  8  HAVING(count(DISTINCT a1.type)) = 1
  9  )
 10   GROUP BY c.eid,a.type
 11   HAVING count(*) = (  SELECT count(a1.aid)
 12   FROM aircraft a1
 13   WHERE a1.type = a.type
 14     )
 15  );

       EID ENAME                              SALARY                                                                                                                                                    
---------- ------------------------------ ----------                                                                                                                                                    
 548977562 William Ward                        84476                                                                                                                                                    
 390487451 Lawrence Sperry                    212156                                                                                                                                                    
 574489457 Milo Brooks                         12000                                                                                                                                                    
 287321212 Michael Miller                      48090                                                                                                                                                    
  90873519 Elizabeth Taylor                    32021                                                                                                                                                    
 356187925 Robert Brown                        44740                                                                                                                                                    

6 rows selected.

 SELECT f.flightNo,fl.departs,r.orig_airport,fl.dtime,r.dest_airport,fl.atime,a.aname
  2  FROM aircraft a JOIN flights f on(a.aid=f.aid) JOIN routes r on(f.rid = r.routeid) JOIN fl_schedule fl on (f.flightNo = fl.flno)
  3  where r.orig_airport = 'New York' AND fl.departs between '15-APR-05' AND '19-APR-05' AND 1 < (SELECT count(f.flightNo)
  4   FROM
  5  aircraft a JOIN flights f USING (aid)
  6  JOIN routes r1 on(f.rid = r1.routeid)
  7  JOIN fl_schedule fl on (f.flightNo = fl.flno)
  8   where
  9  r1.orig_airport = 'New York' AND
 10  fl.departs between '15-APR-05' AND '19-APR-05' AND r1.routeid = r.routeid) ;

FLIGHTN DEPARTS   ORIG_AIRPORT              DTIME DEST_AIRPORT              ATIME ANAME                                                                                                                 
------- --------- -------------------- ---------- -------------------- ---------- ------------------------------                                                                                        
BA-178  15-APR-05 New York                   1140 London                     1020 Boeing 757-300                                                                                                        
IB-4618 18-APR-05 New York                   1310 London                     1150 Lockheed L1011 Tristar                                                                                                

 (select distinct f.flightNo
  2  from
  3  (routes r join flights f on (r.routeid = f.rid)
  4   join fl_schedule fl on(f.flightNo = fl.flno)
  5  )
  6  where
  7  r.orig_airport = 'Madison' and
  8  r.dest_airport = 'New York' and
  9  fl.atime <=1850
 10  )
 11  union
 12  (select distinct f.flightNo
 13  from
 14  (routes r join flights f on (r.routeid = f.rid)
 15   join fl_schedule fl on(f.flightNo = fl.flno)
 16  )
 17   join
 18  (
 19   routes rm join flights fm on (rm.routeid = fm.rid)
 20   join fl_schedule flm on(fm.flightNo = flm.flno)
 21  )
 22  on (r.dest_airport = rm.orig_airport)
 23  where
 24  r.orig_airport = 'Madison' and
 25  rm.dest_airport = 'New York' and
 26  fl.atime <= flm.dtime and
 27  flm.atime <=1850
 28  )
 29  union
 30  (select distinct f.flightNo
 31  from
 32  (
 33  (routes r join flights f on (r.routeid = f.rid)
 34   join fl_schedule fl on(f.flightNo = fl.flno)
 35  )
 36  join
 37  (routes rm join flights fm on (rm.routeid = fm.rid)
 38   join fl_schedule flm on(fm.flightNo = flm.flno)
 39  )
 40  on (r.dest_airport = rm.orig_airport)
 41  )
 42  join
 43  (
 44    routes rm1 join flights fm1 on (rm1.routeid = fm1.rid)
 45    join fl_schedule flm1 on(fm1.flightNo = flm1.flno)
 46  )
 47  on (rm.dest_airport = rm1.orig_airport)
 48  where
 49  r.orig_airport = 'Madison' and
 50  rm1.dest_airport = 'New York' and
 51  (fl.atime<=flm.dtime and flm.atime<=flm1.dtime) and
 52  flm1.atime <= 1850;
flm1.atime <= 1850
                 *
ERROR at line 52:
ORA-00907: missing right parenthesis 


 (select distinct f.flightNo
  2  from
  3  (routes r join flights f on (r.routeid = f.rid)
  4   join fl_schedule fl on(f.flightNo = fl.flno)
  5  )
  6  where
  7  r.orig_airport = 'Madison' and
  8  r.dest_airport = 'New York' and
  9  fl.atime <=1850
 10  )
 11  union
 12  (select distinct f.flightNo
 13  from
 14  (routes r join flights f on (r.routeid = f.rid)
 15   join fl_schedule fl on(f.flightNo = fl.flno)
 16  )
 17   join
 18  (
 19   routes rm join flights fm on (rm.routeid = fm.rid)
 20   join fl_schedule flm on(fm.flightNo = flm.flno)
 21  )
 22  on (r.dest_airport = rm.orig_airport)
 23  where
 24  r.orig_airport = 'Madison' and
 25  rm.dest_airport = 'New York' and
 26  fl.atime <= flm.dtime and
 27  flm.atime <=1850
 28  )
 29  union
 30  (select distinct f.flightNo
 31  from
 32  (
 33  (routes r join flights f on (r.routeid = f.rid)
 34   join fl_schedule fl on(f.flightNo = fl.flno)
 35  )
 36  join
 37  (routes rm join flights fm on (rm.routeid = fm.rid)
 38   join fl_schedule flm on(fm.flightNo = flm.flno)
 39  )
 40  on (r.dest_airport = rm.orig_airport)
 41  )
 42  join
 43  (
 44    routes rm1 join flights fm1 on (rm1.routeid = fm1.rid)
 45    join fl_schedule flm1 on(fm1.flightNo = flm1.flno)
 46  )
 47  on (rm.dest_airport = rm1.orig_airport)
 48  where
 49  r.orig_airport = 'Madison' and
 50  rm1.dest_airport = 'New York' and
 51  (fl.atime<=flm.dtime and flm.atime<=flm1.dtime) and
 52  flm1.atime <= 1850);

FLIGHTN                                                                                                                                                                                                 
-------                                                                                                                                                                                                 
9E-3851                                                                                                                                                                                                 
FX-2351                                                                                                                                                                                                 
G7-6205                                                                                                                                                                                                 

 select e.eid,e.ename from employee e
  2  where e.eid in
  3  (select e1.eid from employee e1
  4  minus
  5  select c.eid from certified c);

       EID ENAME                                                                                                                                                                                        
---------- ------------------------------                                                                                                                                                               
 254099823 Patricia Jones                                                                                                                                                                               
 489456522 Linda Davis                                                                                                                                                                                  
 489221823 Richard Jackson                                                                                                                                                                              
 310454877 Chad Stewart                                                                                                                                                                                 
 552455348 Dorthy Lewis                                                                                                                                                                                 
 248965255 Barbara Wilson                                                                                                                                                                               
 348121549 Haywood Kelly                                                                                                                                                                                
 486512566 David Anderson                                                                                                                                                                               
 619023588 Jennifer Thomas                                                                                                                                                                              
  15645489 Donald King                                                                                                                                                                                  

10 rows selected.

 select distinct eid,e.ename
  2  from
  3  employee e join certified c using (eid)
  4  join flights f using(aid)
  5  join aircraft a using(aid)
  6  join routes r on (r.routeID=f.rID)
  7  where
  8  r.orig_airport='Los Angeles'
  9  intersect
 10  select distinct eid,e.ename
 11  from
 12  employee e join certified c using (eid)
 13  join flights f using(aid)
 14  join aircraft a using(aid)
 15  join routes r on (r.routeID=f.rID)
 16  where
 17  r.orig_airport='Detroit';

       EID ENAME                                                                                                                                                                                        
---------- ------------------------------                                                                                                                                                               
 159542516 William Moore                                                                                                                                                                                
 269734834 George Wright                                                                                                                                                                                
 556784565 Mark Young                                                                                                                                                                                   
 567354612 Lisa Walker                                                                                                                                                                                  
 573284895 Eric Cooper                                                                                                                                                                                  

 spool off;
