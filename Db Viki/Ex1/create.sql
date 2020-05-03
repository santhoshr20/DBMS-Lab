REM Drop table

drop table SungBy;
drop table Song;
drop table Album;
drop table Studio;
drop table Artist;
drop table Musician;


REM creating Musician table

CREATE TABLE Musician(
	m_id number(10) CONSTRAINT m_id_pk PRIMARY KEY,
	m_name varchar2(20),
	birth_place varchar2(20));

desc Musician;

REM creating Aritst table

CREATE TABLE Artist(
	ar_id number(10) CONSTRAINT ar_id_pk PRIMARY KEY,
	ar_name varchar2(20) CONSTRAINT ar_name_un UNIQUE);

desc Artist;


REM creating Studio table

CREATE TABLE Studio(
	s_name varchar2(20) CONSTRAINT s_name_pk PRIMARY KEY,
	address varchar2(50),
	phone varchar2(10));

desc Studio;

REM creating Album table

CREATE TABLE Album(
	a_name varchar2(20),
	a_id number(10) CONSTRAINT a_id_pk PRIMARY KEY,
	year_of_release number(4) CONSTRAINT y_ch CHECK(year_of_release>1945),
	no_of_tracks number(10) CONSTRAINT no_of_tracks_nn NOT NULL,
	s_name varchar2(20),
	genre varchar2(10) CONSTRAINT a_ch CHECK(genre in('CAR','DIV','MOV','POP')),
	m_id number(10),
	CONSTRAINT s_name_fk FOREIGN KEY(s_name) REFERENCES Studio(s_name),
	CONSTRAINT a_id_fk FOREIGN  KEY(m_id) REFERENCES Musician(m_id));

desc Album;

REM creating song table

CREATE TABLE Song(
	a_id number(10),
	track_no number(10),
	s_name varchar2(20),
	length number(10),
	genre varchar2(10) CONSTRAINT song_ch CHECK(genre IN('PHI','REL','LOV','DEV','PAT')),
	CONSTRAINT s_pk PRIMARY KEY(a_id,track_no),
	CONSTRAINT s_fk FOREIGN KEY(a_id) REFERENCES Album(a_id),
	CONSTRAINT s_pat CHECK (genre NOT IN ('PAT') OR length > 7));

desc Song;

REM creating SungBy table

CREATE TABLE SungBy(
	a_id  number(10),
	ar_id number(10),
	track_no number(10),
	rec_date date,
	CONSTRAINT sb_pk PRIMARY KEY(a_id,ar_id,track_no),
	CONSTRAINT sb_id_fk FOREIGN KEY(a_id,track_no) REFERENCES Song(a_id,track_no),
	CONSTRAINT sb_ar_id_fk FOREIGN KEY(ar_id) REFERENCES Artist(ar_id));

desc SungBy;



