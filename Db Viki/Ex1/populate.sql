REM populating Musician table

INSERT INTO Musician VALUES(
	100,
	'Viki',
	'Coimbatore');


INSERT INTO Musician VALUES(
	101,
	'Ram',
	'Chennai');

 
INSERT INTO Musician VALUES(
	102,
	'Viki',
	'Erode');

INSERT INTO Musician VALUES(
	103,
	'Varsha',
	'Coimbatore');

REM populating Musician table(Invalid cases)

INSERT INTO Musician VALUES(
	100,			
	'Raj',
	'Erode');

REM populating Artist table

INSERT INTO Artist VALUES(
	1000,
	'Rahaman');


INSERT INTO Artist VALUES(
	1001,
	'Aniruth');


REM populating Artist table(Invalid cases)	

INSERT INTO Artist VALUES(
	1003,
	'Aniruth');

REM populating Studio table

INSERT INTO Studio VALUES(
	'Green Studios',
	'Chennai',
	'1234567890');

INSERT INTO Studio VALUES(
	'Apple Studios',
	'Coimbatore',
	'0987654321');

REM populating Studio table(Invlaid cases)

INSERT INTO Studio VALUES(
	'Apple Studios',
	'Coimbatore',
	'0987654321');

REM populating Album table

INSERT INTO Album VALUES
(
	'World',
	1,
	2019,
	7,
	'Green Studios',
	'POP',
	101);

INSERT INTO Album VALUES
(
	'Player',
	2,
	2018,
	10,
	'Apple Studios',
	'CAR',
	102);

INSERT INTO Album VALUES
(
	'Game',
	3,
	2018,
	10,
	'Green Studios',
	'MOV',
	100);

INSERT INTO Album VALUES
(
	'Game',
	4,
	2017,
	10,
	'Apple Studios',
	'MOV',
	101);

REM populating Album table(Invalid cases)

INSERT INTO Album VALUES
(
	'Game',
	3,
	2018,
	10,
	'Studios',
	'MOV',
	100);

REM populating Song table

INSERT INTO Song VALUES(
	1,
	5,
	'Senorita',
	10,
	'LOV');

INSERT INTO Song VALUES(
	2,
	6,
	'Loose You To Love Me',
	9,
	'PHI');


INSERT INTO Song VALUES(
	2,
	5,
	'rand',
	6,
	'PHI');

INSERT INTO Song VALUES(
	3,
	10,
	'Dont let me down',
	9,
	'PAT');

INSERT INTO Song VALUES(
	4,
	8,
	'Never say never',
	11,
	'PHI');

REM populating Song table(Invalid cases)

INSERT INTO Song VALUES(
	1,
	8,
	'temp',
	5,
	'PAT');

REM populating SungBy table

INSERT INTO SungBy VALUES
(
	1,
	1000,
	5,
	'03-mar-19'
);

INSERT INTO SungBy VALUES
(
	2,
	1001,
	6,
	'03-nov-19'
);

INSERT INTO SungBy VALUES
(
	3,
	1000,
	10,
	'03-apr-19'
);

INSERT INTO SungBy VALUES
(
	4,
	1001,
	8,
	'05-nov-18'
);

REM populating SungBy table(Invalid cases)

INSERT INTO SungBy VALUES
(
	100,
	1000,
	5,
	'03-mar-19'
);

SELECT * from Musician;

SELECT * FROM Artist;

SELECT * FROM Studio;

SELECT * FROM Album;

SELECT * FROM Song;

SELECT * FROM SungBy;

DELETE From Song where a_id=1;
DELETE FROM Album where a_id=2;
DELETE FROM SungBy where a_id=1;

INSERT INTO SungBy VALUES
(
	1,
	1000,
	5,
	'03-mar-19'
);