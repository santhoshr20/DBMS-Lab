REM Ex9
REM Database Design using Normal Forms

REM Drop table
drop table company;

drop table works_on;
drop table project;
drop table employee;
drop table department;


REM create table
CREATE TABLE company(
	empid varchar2(10),
	pno number(10),
	name varchar2(20),
	address varchar2(30),
	bdate date,
	sex varchar2(1),
	salary number(10),
	dno number(10),
	dname varchar2(20),
	mgr_id varchar2(10),
	pname varchar2(20),
	pdno number(10),
	hrs number(10,2),
	CONSTRAINT comapny_pk PRIMARY KEY(empid,pno));
	
	
	
CREATE TABLE department(
	dno number(10) CONSTRAINT dno_pk PRIMARY KEY,
	dname varchar2(20),
	mgr_id varchar2(10));
	
CREATE TABLE employee(
	empid varchar2(10) CONSTRAINT id_pk PRIMARY KEY,
	name varchar2(20),
	address varchar2(30),
	bdate date,
	sex varchar2(1),
	salary number(10),
	dno number(10) CONSTRAINT dno_fk REFERENCES department(dno));
	
CREATE TABLE project(
	pno number(10) CONSTRAINT pno_pk PRIMARY KEY,
	pname varchar2(20),
	pdno number(10));
	
CREATE TABLE works_on(
	empid varchar2(10) CONSTRAINT id_fk REFERENCES employee(empid),
	pno number (10) CONSTRAINT pno_fk REFERENCES project(pno),
	hrs number(10,2),
	CONSTRAINT pk PRIMARY KEY(empid,pno));
	
REM Populating

REM company(empid,pno,name,address,bdate,sex,salary,dno,dname,mgr_id,pname,pdno,hrs)
INSERT INTO company VALUES('123456789',1,'John Smith','731 Fondren,Houston,TX','05-APR-1986','M',30000,5,'Research','333445555','ProductX',5,32.5);
INSERT INTO company VALUES('123456789',2,'John Smith','731 Fondren,Houston,TX','05-APR-1986','M',30000,5,'Research','333445555','ProductY',5,7.5);
INSERT INTO company VALUES('333445555',2,'Franklin Wong','638 Voss,Houston,TX','25-OCT-1983','M',40000,5,'Research','333445555','ProductY',5,10.0);
INSERT INTO company VALUES('333445555',3,'Franklin Wong','638 Voss,Houston,TX','25-OCT-1983','M',40000,5,'Research','333445555','ProductZ',5,10.0);
INSERT INTO company VALUES('333445555',10,'Franklin Wong','638 Voss,Houston,TX','25-OCT-1983','M',40000,5,'Research','333445555','Computerization',4,10.0);
INSERT INTO company VALUES('333445555',20,'Franklin Wong','638 Voss,Houston,TX','25-OCT-1983','M',40000,5,'Research','333445555','Reorganization',1,10.0);
INSERT INTO company VALUES('999887777',30,'Alicia Zelaya','3321 Castle,Spring,TX','03-MAY-1958','F',25000,4,'Administration','987654321','Newbenefits',4,30.0);
INSERT INTO company VALUES('999887777',10,'Alicia Zelaya','3321 Castle,Spring,TX','03-MAY-1958','F',25000,4,'Administration','987654321','Computerization',4,10.0);
INSERT INTO company VALUES('987654321',30,'Jennifer Wallace','291 Berry,Bellaire,TX','28-FEB-1942' ,'F',43000,4,'Administration','987654321','Newbenefits',4,20.0);
INSERT INTO company VALUES('987654321',20,'Jennifer Wallace','291 Berry,Bellaire,TX','28-FEB-1942' ,'F',43000,4,'Administration','987654321','Reorganization',1,15.0);
INSERT INTO company VALUES('666884444',3,'Ramesh Narayan','975 Fire Oak,Humble,TX','04-JAN-1988','M',38000,5,'Research','333445555','ProductZ',5,40.0);
INSERT INTO company VALUES('453453453',1,'Joyce English','5631 Rice,Houston,TX','30-DEC-1988','F',25000,5,'Research','333445555','ProductX',5,20.0);
INSERT INTO company VALUES('453453453',2,'Joyce English','5631 Rice,Houston,TX','30-DEC-1988','F',25000,5,'Research','333445555','ProductY',5,20.0);
INSERT INTO company VALUES('987987987',10,'Ahmad Jabbar','980 Dallas,Houston,TX','05-MAY-1989','M',25000,4,'Administration','987654321','Computerization',4,35.0);
INSERT INTO company VALUES('987987987',30,'Ahmad Jabbar','980 Dallas,Houston,TX','05-MAY-1989','M',25000,4,'Administration','987654321','Newbenefits',4,5.0);
INSERT INTO company VALUES('888665555',20,'James Borg','450 Stone,Houston,TX','23-APR-1978','M',55000,1,'Headquarters','888665555','Reorganization',1,NULL);


REM department(dno,dname,mgr_id)
INSERT INTO department VALUES(5,'Research','333445555');
INSERT INTO department VALUES(4,'Administration','987654321');
INSERT INTO department VALUES(1,'Headquarters','888665555');


REM employee(empid,name,address,bdate,sex,salary,dno)

INSERT INTO employee VALUES('123456789','John Smith','731 Fondren,Houston,TX','09-JAN-1965','M',30000,5);
INSERT INTO employee VALUES('333445555','Franklin Wong','638 Voss,Houston,TX','08-DEC-1955','M',40000,5);
INSERT INTO employee VALUES('999887777','Alicia Zelaya','3321 Castle,Spring,TX','19-JAN-1968','F',25000,4);
INSERT INTO employee VALUES('987654321','Jennifer Wallace','291 Berry,Bellaire,TX','20-JUN-1941','F',43000,4);
INSERT INTO employee VALUES('666884444','Ramesh Narayan','975 Fire Oak,Humble,TX','15-SEP-1962','M',38000,5);
INSERT INTO employee VALUES('453453453','Joyce English','5631 Rice,Houston,TX','31-JUL-1972','F',25000,5);
INSERT INTO employee VALUES('987987987','Ahamed Jabbar','980 Dallas,Houston,TX','29-MAR-1969','M',25000,4);
INSERT INTO employee VALUES('888665555','James Borg','450 Stone,Houston,TX','10-NOV-1937','M',55000,1);


REM project(pno,pname,pdno)
INSERT INTO project VALUES(1,'ProductX',5);
INSERT INTO project VALUES(2,'ProductY',5);
INSERT INTO project VALUES(3,'ProductZ',5);
INSERT INTO project VALUES(10,'Computerization',4);
INSERT INTO project VALUES(20,'Reorganization',1);
INSERT INTO project VALUES(30,'Newbenefits',4);


REM works_on(empid,pno,hrs)
INSERT INTO works_on VALUES('123456789', 1,32.5);
INSERT INTO works_on VALUES('123456789',2,7.5);
INSERT INTO works_on VALUES('666884444',3,40.0);
INSERT INTO works_on VALUES('453453453',1,20.0);
INSERT INTO works_on VALUES('453453453',2,20.0);
INSERT INTO works_on VALUES('333445555',2,10.0);
INSERT INTO works_on VALUES('333445555',3,10.0);
INSERT INTO works_on VALUES('333445555',10,10.0);
INSERT INTO works_on VALUES('333445555',20,10.0);
INSERT INTO works_on VALUES('999887777',30,30.0);
INSERT INTO works_on VALUES('999887777',10,10.0);
INSERT INTO works_on VALUES('987987987',10,35.0);
INSERT INTO works_on VALUES('987987987',30,5.0);
INSERT INTO works_on VALUES('987654321',30,20.0);
INSERT INTO works_on VALUES('987654321',20,15.0);
INSERT INTO works_on VALUES('888665555',20,NULL);

REM 1NF
SELECT * FROM company;

REM 3NF
SELECT * FROM department;
SELECT * FROM employee;
SELECT * FROM project;
SELECT * FROM works_on;

REM LOSSLESS JOIN proof
SELECT * FROM company
ORDER BY empid;

SELECT * FROM employee natural join department natural join project natural join works_on
ORDER BY empid;

REM Both company table and join of all 3NF tables gives 16 tuples which have same value
REM Hence the decomposition is lossless.

